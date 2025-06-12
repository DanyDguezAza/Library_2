package servlets;

import beans.Usuario;
import dao.UsuarioDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario u = (Usuario) request.getSession().getAttribute("usuario");

        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String nombre = request.getParameter("nombre");
        String ap_p = request.getParameter("apellido_paterno");
        String ap_m = request.getParameter("apellido_materno");
        String fecha = request.getParameter("fecha_nacimiento");
        String nuevaContra = request.getParameter("nueva_contraseña");

        u.setNombre(nombre);
        u.setApellido_paterno(ap_p);
        u.setApellido_materno(ap_m);
        u.setFecha_nacimiento(LocalDate.parse(fecha));
        if (nuevaContra != null && !nuevaContra.isEmpty()) {
            u.setContraseña(nuevaContra);
        }

        new UsuarioDAO().actualizarUsuario(u);
        request.getSession().setAttribute("usuario", u);

        response.sendRedirect("perfil.jsp");
    }
}
