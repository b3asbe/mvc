package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cerrar")
public class cerrar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Eliminar la sesión si existe
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Cierra la sesión
        }
        
        // Redirigir al login
        response.sendRedirect("login.jsp");
    }
}

