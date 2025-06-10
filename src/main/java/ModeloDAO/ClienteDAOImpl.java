package ModeloDAO;

import Interfaces.ClienteDAO;
import Modelo.Cliente;
import Util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ClienteDAOImpl implements ClienteDAO {

    @Override
    public Cliente buscarPorDniRuc(String dniRuc) {
        Cliente cliente = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT id_cliente, nombre_cliente, dni_ruc FROM clientes WHERE dni_ruc = ?";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) {
                 System.err.println("Error: Conexión nula a sistema_ventas en buscarPorDniRuc");
                 return null;
            }
            ps = con.prepareStatement(sql);
            ps.setString(1, dniRuc);
            rs = ps.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("id_cliente"));
                cliente.setNombreCliente(rs.getString("nombre_cliente"));
                cliente.setDniRuc(rs.getString("dni_ruc"));
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar cliente por DNI/RUC: " + e.getMessage());
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
        return cliente;
    }

    @Override
    public int agregarCliente(Cliente cliente) {
        int idGenerado = -1;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "INSERT INTO clientes (nombre_cliente, dni_ruc) VALUES (?, ?)";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) {
                 System.err.println("Error: Conexión nula a sistema_ventas en agregarCliente");
                 return -1;
            }
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cliente.getNombreCliente());
            ps.setString(2, cliente.getDniRuc());
            int filasAfectadas = ps.executeUpdate();
            if (filasAfectadas > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    idGenerado = rs.getInt(1);
                    cliente.setIdCliente(idGenerado); // Actualizar el objeto cliente con el ID
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al agregar cliente: " + e.getMessage());
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
        return idGenerado;
    }
}