package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {

    /************** RONNY CHICLLA ZAMORA ************/

    // Conexión a la primera base de datos (sistema_login)
    public static Connection getConexionSistemaVentas() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/sistema_ventas?useTimezone=true&serverTimezone=UTC";
            String usr = "root";
            String psw = "123456";
            

    		
    		
            con = DriverManager.getConnection(url, usr, psw);
            System.out.println("Conexión a sistema_login ok");
        } catch (ClassNotFoundException ex) {
            System.out.println("No hay Driver!!");
        } catch (SQLException ex) {
            System.out.println("Error con sistema_login");
        }
        return con;
    }

    // Método para cerrar cualquier conexión
    public static void closeConexion(Connection con) {
        try {
            if (con != null) {
                con.close();
                System.out.println("Conexión cerrada correctamente.");
            }
        } catch (SQLException e) {
            System.out.println("Problemas al cerrar la conexión");
        }
    }

}
