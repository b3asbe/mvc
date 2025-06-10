package ModeloDAO;

import Interfaces.VendedorDAO;
import Modelo.Vendedor;
import Util.MySQLConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VendedorDAOImpl implements VendedorDAO {

    @Override
    public Vendedor buscarPorNombre(String nombre) {
        Vendedor vendedor = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        // Asumiendo que el nombre del vendedor es único o tomamos el primero que coincida.
        // Sería mejor buscar por un ID si es posible o si el nombre no es garantizado único.
        String sql = "SELECT id_vendedor, nombre_vendedor FROM vendedores WHERE nombre_vendedor = ? LIMIT 1";
        try {
            con = MySQLConexion.getConexionSistemaVentas();
            if (con == null) return null;
            ps = con.prepareStatement(sql);
            ps.setString(1, nombre);
            rs = ps.executeQuery();
            if (rs.next()) {
                vendedor = new Vendedor();
                vendedor.setIdVendedor(rs.getInt("id_vendedor"));
                vendedor.setNombreVendedor(rs.getString("nombre_vendedor"));
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar vendedor por nombre: " + e.getMessage());
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
        return vendedor;
    }
     // Podrías necesitar un método para obtener un vendedor por ID si es más práctico
    public Vendedor buscarPorId(int idVendedor) {
        Vendedor vendedor = null;
        String sql = "SELECT id_vendedor, nombre_vendedor FROM vendedores WHERE id_vendedor = ?";
        try (Connection con = MySQLConexion.getConexionSistemaVentas();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idVendedor);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    vendedor = new Vendedor();
                    vendedor.setIdVendedor(rs.getInt("id_vendedor"));
                    vendedor.setNombreVendedor(rs.getString("nombre_vendedor"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vendedor;
    }
}