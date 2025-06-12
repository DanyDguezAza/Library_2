package servlets;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import util.MongoDBUtil;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/libros")
public class LibrosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoDatabase db = MongoDBUtil.getDatabase();
        MongoCollection<Document> librosCol = db.getCollection("libros");

        List<Document> libros = new ArrayList<>();
        try (MongoCursor<Document> cursor = librosCol.find().iterator()) {
            while (cursor.hasNext()) {
                libros.add(cursor.next());
            }
        }

        request.setAttribute("libros", libros);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/libros.jsp");
        dispatcher.forward(request, response);
    }
}
