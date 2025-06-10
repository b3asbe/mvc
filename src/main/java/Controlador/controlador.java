package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ModeloDAO.UsuarioDAO;
import Modelo.Usuario;

@WebServlet("/controlador")
public class controlador extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public controlador() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String clave = request.getParameter("clave");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.autenticar(correo, clave);

        if (usuario != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            response.sendRedirect("vistas/index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Credenciales incorrectas");
        }
    }
}


