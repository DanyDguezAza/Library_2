package servlets;

import beans.Usuario;
import dao.UsuarioDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/lista")
public class ListaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Usuario u = (Usuario) sesion.getAttribute("usuario");

        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String idLibro = request.getParameter("idLibro");
        String accion = request.getParameter("accion");

        UsuarioDAO dao = new UsuarioDAO();

        if (accion.startsWith("quitar_")) {
            String lista = accion.replace("quitar_", "");
            dao.quitarLibroDeLista(u.getCorreo(), lista, idLibro);
        } else {
            dao.agregarLibroALista(u.getCorreo(), accion, idLibro);
        }

        response.sendRedirect("libros");
    }
}
