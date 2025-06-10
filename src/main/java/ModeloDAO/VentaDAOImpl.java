package ModeloDAO;

import Interfaces.VentaDAO;
import Modelo.DetalleVenta;
import Modelo.Venta;
import Util.MySQLConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VentaDAOImpl implements VentaDAO {

    @Override
    public int registrarVenta(Venta venta) {
        int idVentaGenerado = -1;
        Connection con = null;
        PreparedStatement psVenta = null;
        ResultSet rs = null;
        String sqlVenta = "INSERT INTO ventas (id_cliente, id_vendedor, fecha_venta, tipo_comprobante, serie_numero, subtotal, igv, total, estado_pago) " +
                          "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) {
                System.err.println("Error: Conexión nula al registrar venta.");
                return -1;
            }
            con.setAutoCommit(false); // Iniciar transacción

            psVenta = con.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS);
            psVenta.setInt(1, venta.getIdCliente());
            psVenta.setInt(2, venta.getIdVendedor());
            psVenta.setDate(3, venta.getFechaVenta());
            psVenta.setString(4, venta.getTipoComprobante());
            psVenta.setString(5, venta.getSerieNumero());
            psVenta.setBigDecimal(6, venta.getSubtotal());
            psVenta.setBigDecimal(7, venta.getIgv());
            psVenta.setBigDecimal(8, venta.getTotal());
            psVenta.setString(9, venta.getEstadoPago());

            int filasAfectadas = psVenta.executeUpdate();

            if (filasAfectadas > 0) {
                rs = psVenta.getGeneratedKeys();
                if (rs.next()) {
                    idVentaGenerado = rs.getInt(1);
                    venta.setIdVenta(idVentaGenerado); // Asignar el ID generado al objeto venta

                    // Registrar detalles de la venta
                    if (venta.getDetalles() != null && !venta.getDetalles().isEmpty()) {
                        ProductoDAOImpl productoDAO = new ProductoDAOImpl(); // Para actualizar stock
                        for (DetalleVenta detalle : venta.getDetalles()) {
                            detalle.setIdVenta(idVentaGenerado); // Asignar el ID de la venta al detalle
                            if (!registrarDetalleVenta(detalle, con)) { // Pasar la conexión existente
                                con.rollback(); // Si falla el detalle, rollback
                                System.err.println("Error al registrar detalle, rollback ejecutado.");
                                return -1;
                            }
                            // Actualizar stock del producto
                            if (!productoDAO.actualizarStock(detalle.getCodigoProducto(), detalle.getCantidad())) {
                                con.rollback();
                                System.err.println("Error al actualizar stock para " + detalle.getCodigoProducto() + ", rollback ejecutado.");
                                return -1;
                            }
                        }
                    }
                    con.commit(); // Si todo ok, commit
                    System.out.println("Venta registrada con ID: " + idVentaGenerado);
                } else {
                    con.rollback(); // No se generó ID
                     System.err.println("No se pudo obtener el ID generado para la venta, rollback ejecutado.");
                }
            } else {
                con.rollback(); // No se insertó la venta
                System.err.println("No se pudo insertar la venta, rollback ejecutado.");
            }

        } catch (SQLException e) {
            System.err.println("Error SQL al registrar venta: " + e.getMessage());
            e.printStackTrace();
            try {
                if (con != null) con.rollback();
            } catch (SQLException ex) {
                System.err.println("Error en rollback: " + ex.getMessage());
            }
            idVentaGenerado = -1;
        } finally {
            try {
                if (rs != null) rs.close();
                if (psVenta != null) psVenta.close();
                if (con != null) {
                    con.setAutoCommit(true); // Restaurar auto-commit
                    MySQLConexion.closeConexion(con);
                }
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos en registrarVenta: " + e.getMessage());
            }
        }
        return idVentaGenerado;
    }
    
    // Método auxiliar para registrar detalle que acepta una conexión existente (para transacciones)
    private boolean registrarDetalleVenta(DetalleVenta detalle, Connection con) throws SQLException {
        String sqlDetalle = "INSERT INTO detalle_venta (id_venta, codigo_producto, cantidad, precio_unitario, subtotal) " +
                            "VALUES (?, ?, ?, ?, ?)";
        PreparedStatement psDetalle = null;
        try {
            psDetalle = con.prepareStatement(sqlDetalle);
            psDetalle.setInt(1, detalle.getIdVenta());
            psDetalle.setString(2, detalle.getCodigoProducto());
            psDetalle.setInt(3, detalle.getCantidad());
            psDetalle.setBigDecimal(4, detalle.getPrecioUnitario());
            psDetalle.setBigDecimal(5, detalle.getSubtotal());
            return psDetalle.executeUpdate() > 0;
        } finally {
            if (psDetalle != null) psDetalle.close();
            // No cerramos la conexión aquí, se maneja en el método principal
        }
    }


    // Implementación de la interfaz pública (puede usarse si no es parte de una transacción mayor)
    @Override
    public boolean registrarDetalleVenta(DetalleVenta detalle) {
        Connection con = null;
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) return false;
            // Este método no debería manejar commit/rollback si es llamado externamente
            // a menos que sea una operación independiente.
            // Para el flujo de registrarVenta, usamos el método privado.
            return registrarDetalleVenta(detalle, con); 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
             MySQLConexion.closeConexion(con);
        }
    }


    @Override
    public List<Venta> listarVentas() {
        List<Venta> listaVentas = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT v.id_venta, v.fecha_venta, v.tipo_comprobante, v.serie_numero, v.total, v.estado_pago, " +
                     "c.nombre_cliente, vd.nombre_vendedor " +
                     "FROM ventas v " +
                     "JOIN clientes c ON v.id_cliente = c.id_cliente " +
                     "JOIN vendedores vd ON v.id_vendedor = vd.id_vendedor " +
                     "ORDER BY v.fecha_venta DESC, v.id_venta DESC"; // o como prefieras ordenar
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) return listaVentas;
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setFechaVenta(rs.getDate("fecha_venta"));
                venta.setTipoComprobante(rs.getString("tipo_comprobante"));
                venta.setSerieNumero(rs.getString("serie_numero"));
                venta.setTotal(rs.getBigDecimal("total"));
                venta.setEstadoPago(rs.getString("estado_pago"));
                venta.setNombreCliente(rs.getString("nombre_cliente"));
                venta.setNombreVendedor(rs.getString("nombre_vendedor"));
                listaVentas.add(venta);
            }
        } catch (SQLException e) {
            System.err.println("Error al listar ventas: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                MySQLConexion.closeConexion(con);
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return listaVentas;
    }

    @Override
    public Venta obtenerVentaConDetallesPorId(int idVenta) {
        Venta venta = null;
        Connection con = null;
        PreparedStatement psVenta = null;
        ResultSet rsVenta = null;
        PreparedStatement psDetalles = null;
        ResultSet rsDetalles = null;

        String sqlVenta = "SELECT v.*, c.nombre_cliente, c.dni_ruc, vd.nombre_vendedor " +
                          "FROM ventas v " +
                          "JOIN clientes c ON v.id_cliente = c.id_cliente " +
                          "JOIN vendedores vd ON v.id_vendedor = vd.id_vendedor " +
                          "WHERE v.id_venta = ?";
        String sqlDetalles = "SELECT dv.*, p.nombre_producto " +
                             "FROM detalle_venta dv " +
                             "JOIN productos p ON dv.codigo_producto = p.codigo " +
                             "WHERE dv.id_venta = ?";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) return null;

            // Obtener datos de la venta
            psVenta = con.prepareStatement(sqlVenta);
            psVenta.setInt(1, idVenta);
            rsVenta = psVenta.executeQuery();

            if (rsVenta.next()) {
                venta = new Venta();
                venta.setIdVenta(rsVenta.getInt("id_venta"));
                venta.setIdCliente(rsVenta.getInt("id_cliente"));
                venta.setNombreCliente(rsVenta.getString("nombre_cliente"));
                // Podrías querer el DNI/RUC del cliente también: venta.setDniRucCliente(rsVenta.getString("dni_ruc"));
                venta.setIdVendedor(rsVenta.getInt("id_vendedor"));
                venta.setNombreVendedor(rsVenta.getString("nombre_vendedor"));
                venta.setFechaVenta(rsVenta.getDate("fecha_venta"));
                venta.setTipoComprobante(rsVenta.getString("tipo_comprobante"));
                venta.setSerieNumero(rsVenta.getString("serie_numero"));
                venta.setSubtotal(rsVenta.getBigDecimal("subtotal"));
                venta.setIgv(rsVenta.getBigDecimal("igv"));
                venta.setTotal(rsVenta.getBigDecimal("total"));
                venta.setEstadoPago(rsVenta.getString("estado_pago"));

                // Obtener detalles de la venta
                List<DetalleVenta> detalles = new ArrayList<>();
                psDetalles = con.prepareStatement(sqlDetalles);
                psDetalles.setInt(1, idVenta);
                rsDetalles = psDetalles.executeQuery();
                while (rsDetalles.next()) {
                    DetalleVenta detalle = new DetalleVenta();
                    detalle.setIdDetalle(rsDetalles.getInt("id_detalle"));
                    detalle.setIdVenta(rsDetalles.getInt("id_venta"));
                    detalle.setCodigoProducto(rsDetalles.getString("codigo_producto"));
                    detalle.setNombreProducto(rsDetalles.getString("nombre_producto"));
                    detalle.setCantidad(rsDetalles.getInt("cantidad"));
                    detalle.setPrecioUnitario(rsDetalles.getBigDecimal("precio_unitario"));
                    detalle.setSubtotal(rsDetalles.getBigDecimal("subtotal"));
                    detalles.add(detalle);
                }
                venta.setDetalles(detalles);
            }

        } catch (SQLException e) {
            System.err.println("Error al obtener venta con detalles: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rsDetalles != null) rsDetalles.close();
                if (psDetalles != null) psDetalles.close();
                if (rsVenta != null) rsVenta.close();
                if (psVenta != null) psVenta.close();
                MySQLConexion.closeConexion(con);
            } catch (SQLException e) {
                 System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return venta;
    }
}