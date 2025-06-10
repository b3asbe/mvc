package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Util.MySQLConexion;
import Modelo.Usuario;

public class UsuarioDAO {

    public Usuario autenticar(String correo, String clave) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND clave = SHA2(?, 256)";
        
        try (Connection con = MySQLConexion.getConexionSistemaVentas();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, correo);
            ps.setString(2, clave);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setCorreo(rs.getString("correo"));
            }
        } catch (Exception e) {
            System.out.println("Error en autenticación: " + e.getMessage());
        }
        return usuario;
    }
}

