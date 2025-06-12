package servlets;

import beans.Usuario;
import dao.UsuarioDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.obtenerPorCorreo(correo);

        if (u != null && u.getContraseña().equals(contraseña)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", u);
            response.sendRedirect("perfil.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
