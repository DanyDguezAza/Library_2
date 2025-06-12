package servlets;

import beans.Libro;
import dao.LibroDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/principal")
public class PrincipalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LibroDAO dao = new LibroDAO();
        List<Libro> libros = dao.obtenerTodos();  // Este método debe devolver todos los libros

        request.setAttribute("libros", libros);
        request.getRequestDispatcher("principal.jsp").forward(request, response);
    }
}
