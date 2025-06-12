package servlets;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.Document;
import org.bson.types.ObjectId;
import util.MongoDBUtil;

import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        MongoDatabase db = MongoDBUtil.getDatabase();
        MongoCollection<Document> librosCol = db.getCollection("libros");

        if ("agregar".equals(accion)) {
            Document nuevo = new Document("titulo", request.getParameter("titulo"))
                    .append("autor", request.getParameter("autor"))
                    .append("genero", request.getParameter("genero"))
                    .append("sinopsis", request.getParameter("sinopsis"));
            librosCol.insertOne(nuevo);
        } else if ("eliminar".equals(accion)) {
            String id = request.getParameter("id");
            librosCol.deleteOne(new Document("_id", new ObjectId(id)));
        }

        response.sendRedirect("admin.jsp");
    }
}
