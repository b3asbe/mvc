package ModeloDAO;

import Interfaces.ProductoDAO;
import Modelo.Producto;
import Util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAOImpl implements ProductoDAO {

    @Override
    public Producto buscarPorCodigo(String codigo) {
        Producto producto = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT codigo, nombre_producto, precio_unitario, stock_disponible FROM productos WHERE codigo = ?";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) return null;
            ps = con.prepareStatement(sql);
            ps.setString(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                producto = new Producto();
                producto.setCodigo(rs.getString("codigo"));
                producto.setNombreProducto(rs.getString("nombre_producto"));
                producto.setPrecioUnitario(rs.getBigDecimal("precio_unitario"));
                producto.setStockDisponible(rs.getInt("stock_disponible"));
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar producto por código: " + e.getMessage());
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
        return producto;
    }

    @Override
    public boolean actualizarStock(String codigoProducto, int cantidadComprada) {
        Connection con = null;
        PreparedStatement ps = null;
        // Restar la cantidad comprada del stock actual
        String sql = "UPDATE productos SET stock_disponible = stock_disponible - ? WHERE codigo = ? AND stock_disponible >= ?";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) return false;
            ps = con.prepareStatement(sql);
            ps.setInt(1, cantidadComprada);
            ps.setString(2, codigoProducto);
            ps.setInt(3, cantidadComprada); // Asegurar que haya stock suficiente
            
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.err.println("Error al actualizar stock: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                MySQLConexion.closeConexion(con);
            } catch (SQLException e) {
                 System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }

    @Override
    public List<Producto> listarProductosParaBusqueda(String termino) {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT codigo, nombre_producto, precio_unitario, stock_disponible " +
                     "FROM productos WHERE (codigo LIKE ? OR nombre_producto LIKE ?) AND stock_disponible > 0 LIMIT 10";
        try (Connection con = MySQLConexion.getConexionSistemaVentas();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            if (con == null) return lista; // Devolver lista vacía si no hay conexión

            ps.setString(1, "%" + termino + "%");
            ps.setString(2, "%" + termino + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Producto p = new Producto();
                    p.setCodigo(rs.getString("codigo"));
                    p.setNombreProducto(rs.getString("nombre_producto"));
                    p.setPrecioUnitario(rs.getBigDecimal("precio_unitario"));
                    p.setStockDisponible(rs.getInt("stock_disponible"));
                    lista.add(p);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al listar productos para búsqueda: " + e.getMessage());
            e.printStackTrace();
        }
        return lista;
    }
}