package dao;

import beans.Usuario;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import util.MongoDBUtil;

public class UsuarioDAO {

    private MongoCollection<Document> coleccion;

    public UsuarioDAO() {
        MongoDatabase db = MongoDBUtil.getDatabase();
        coleccion = db.getCollection("usuarios");
    }

    public void registrarUsuario(Usuario u) {
        Document doc = new Document("nombre", u.getNombre())
                .append("apellido_paterno", u.getApellido_paterno())
                .append("apellido_materno", u.getApellido_materno())
                .append("fecha_nacimiento", u.getFecha_nacimiento())
                .append("correo", u.getCorreo())
                .append("contraseña", u.getContraseña());

        coleccion.insertOne(doc);
    }

    public boolean autenticar(String correo, String contraseña) {
        Document doc = coleccion.find(new Document("correo", correo)
                .append("contraseña", contraseña)).first();
        return doc != null;
    }

    public Usuario obtenerPorCorreo(String correo) {
        Document doc = coleccion.find(new Document("correo", correo)).first();
        if (doc != null) {
            Usuario u = new Usuario();
            u.setId(doc.getObjectId("_id").toHexString());
            u.setNombre(doc.getString("nombre"));
            u.setCorreo(doc.getString("correo"));
            u.setContraseña(doc.getString("contraseña"));
            u.setRol(doc.getString("rol") != null ? doc.getString("rol") : "usuario");
            return u;
        }
        return null;
    }

    public void agregarLibroALista(String correo, String lista, String idLibro) {
        coleccion.updateOne(
                new Document("correo", correo),
                new Document("$addToSet", new Document("listas." + lista, idLibro))
        );
    }

    public List<Document> obtenerLibrosDeLista(String correo, String lista) {
        Document usuario = coleccion.find(new Document("correo", correo)).first();
        List<Document> resultado = new ArrayList<>();
        if (usuario != null && usuario.containsKey("listas")) {
            List<String> ids = (List<String>) ((Document) usuario.get("listas")).get(lista);
            if (ids != null) {
                MongoDatabase db = MongoDBUtil.getDatabase();
                MongoCollection<Document> librosCol = db.getCollection("libros");
                for (String id : ids) {
                    Document libro = librosCol.find(new Document("_id", new org.bson.types.ObjectId(id))).first();
                    if (libro != null) resultado.add(libro);
                }
            }
        }
        return resultado;
    }
}
