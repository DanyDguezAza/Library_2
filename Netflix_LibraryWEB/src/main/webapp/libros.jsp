<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 07:51 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.bson.Document" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Catálogo de Libros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">📚 Catálogo de Libros</h1>
    <div class="row">
        <%
            List<Document> libros = (List<Document>) request.getAttribute("libros");
            for (Document libro : libros) {
        %>
        <div class="col-md-4">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%= libro.getString("titulo") %></h5>
                    <p class="card-text"><strong>Autor:</strong> <%= libro.getString("autor") %></p>
                    <p class="card-text"><strong>Género:</strong> <%= libro.getString("genero") %></p>
                    <p class="card-text"><%= libro.getString("sinopsis") %></p>

                    <form action="lista" method="post" style="display:inline">
                        <input type="hidden" name="idLibro" value="<%= libro.getObjectId("_id").toHexString() %>"/>
                        <input type="hidden" name="accion" value="por_leer"/>
                        <button class="btn btn-outline-primary btn-sm">📖 Por leer</button>
                    </form>

                    <form action="lista" method="post" style="display:inline">
                        <input type="hidden" name="idLibro" value="<%= libro.getObjectId("_id").toHexString() %>"/>
                        <input type="hidden" name="accion" value="leidos"/>
                        <button class="btn btn-outline-success btn-sm">✅ Leído</button>
                    </form>

                    <form action="lista" method="post" style="display:inline">
                        <input type="hidden" name="idLibro" value="<%= libro.getObjectId("_id").toHexString() %>"/>
                        <input type="hidden" name="accion" value="favoritos"/>
                        <button class="btn btn-outline-warning btn-sm">⭐ Favorito</button>
                    </form>
                </div>

            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
