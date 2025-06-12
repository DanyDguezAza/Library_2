package servlets;

import beans.Usuario;
import dao.UsuarioDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");

        Usuario u = new Usuario(nombre, correo, contraseña);
        UsuarioDAO dao = new UsuarioDAO();
        dao.registrarUsuario(u);

        response.sendRedirect("login.jsp");
    }
}
