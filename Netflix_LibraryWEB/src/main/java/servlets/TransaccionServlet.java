package servlets;

import com.mongodb.client.ClientSession;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.bson.Document;
import util.MongoDBUtil;

import java.io.IOException;
import java.util.Date;

@WebServlet("/transaccion")
public class TransaccionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MongoClient mongoClient = MongoDBUtil.getClient(); // Usa el cliente global
        try (ClientSession session = mongoClient.startSession()) {
            session.startTransaction();

            MongoDatabase db = mongoClient.getDatabase("biblioteca"); // Usa el nombre real de tu BD

            MongoCollection<Document> usuarios = db.getCollection("usuarios");
            MongoCollection<Document> logs = db.getCollection("logs");

            // Simula nuevo usuario y log
            Document nuevoUsuario = new Document("correo", "transaccion@demo.com")
                    .append("nombre", "Usuario Transaccion")
                    .append("contraseña", "123456") // no hasheada, solo demo
                    .append("fecha_nacimiento", new Date());

            Document log = new Document("evento", "registro_usuario")
                    .append("correo", "transaccion@demo.com")
                    .append("fecha", new Date());

            usuarios.insertOne(session, nuevoUsuario);
            logs.insertOne(session, log);

            session.commitTransaction();

            response.getWriter().println("✅ Transacción completada exitosamente.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Ocurrió un error en la transacción: " + e.getMessage());
        }
    }
}
