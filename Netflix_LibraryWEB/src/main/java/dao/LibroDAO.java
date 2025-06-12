package dao;

import beans.Libro;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import org.bson.types.ObjectId;
import util.MongoDBUtil;

import java.util.ArrayList;
import java.util.List;

public class LibroDAO {
    private final MongoCollection<Document> coleccion;

    public LibroDAO() {
        MongoDatabase db = MongoDBUtil.getDatabase();
        this.coleccion = db.getCollection("libros");
    }

    public List<Libro> obtenerTodos() {
        List<Libro> lista = new ArrayList<>();
        MongoDatabase db = MongoDBUtil.getDatabase();
        MongoCollection<Document> col = db.getCollection("libros");

        for (Document doc : col.find()) {
            Libro l = new Libro();
            l.setId(doc.getObjectId("_id").toHexString());
            l.setTitulo(doc.getString("titulo"));
            l.setAutor(doc.getString("autor"));
            l.setGenero(doc.getString("genero"));
            l.setSinopsis(doc.getString("sinopsis"));
            l.setPortada(doc.getString("portada"));  // Aquí recuperas la URL de la imagen
            lista.add(l);
        }

        return lista;
    }


    public void insertar(Libro l) {
        Document doc = new Document("titulo", l.getTitulo())
                .append("autor", l.getAutor())
                .append("genero", l.getGenero())
                .append("sinopsis", l.getSinopsis())
                .append("portada", l.getPortada());
        coleccion.insertOne(doc);
    }

    public void eliminarPorId(String id) {
        coleccion.deleteOne(new Document("_id", new ObjectId(id)));
    }

    public Libro obtenerPorId(String id) {
        Document doc = coleccion.find(new Document("_id", new ObjectId(id))).first();
        if (doc == null) return null;
        return new Libro(
                doc.getObjectId("_id").toHexString(),
                doc.getString("titulo"),
                doc.getString("autor"),
                doc.getString("genero"),
                doc.getString("sinopsis"),
                doc.getString("portada")
        );
    }
}
