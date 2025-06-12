package servlets;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import util.MongoDBUtil;
import dao.LibroDAO;
import beans.Libro;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/libros")
public class LibrosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LibroDAO dao = new LibroDAO();
        List<Libro> libros = dao.obtenerTodos();

        request.setAttribute("libros", libros);
        request.getRequestDispatcher("libros.jsp").forward(request, response);
    }
}

