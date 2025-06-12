<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Usuario, dao.UsuarioDAO, org.bson.Document, java.util.List" %>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UsuarioDAO dao = new UsuarioDAO();
    List<Document> porLeer = dao.obtenerLibrosDeLista(u.getCorreo(), "por_leer");
    List<Document> leidos = dao.obtenerLibrosDeLista(u.getCorreo(), "leidos");
    List<Document> favoritos = dao.obtenerLibrosDeLista(u.getCorreo(), "favoritos");
%>
<html>
<head>
    <title>Mis Libros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #fff;
        }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; color: #e50914 !important; }
        .nav-link { color: #fff !important; }
        .titulo { font-size: 1.5rem; margin-top: 30px; }
        .libros-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            width: 180px;
            background-color: #1f1f1f;
            border: none;
            color: #fff;
        }
        .card img {
            height: 240px;
            object-fit: cover;
            border-radius: 8px 8px 0 0;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="principal">📚 BookFlix</a>
        <ul class="navbar-nav me-auto">
            <li class="nav-item"><a class="nav-link" href="libros">Catálogo</a></li>
            <li class="nav-item"><a class="nav-link" href="mislibros.jsp">Mis Libros</a></li>
            <% if ("admin".equals(u.getRol())) {%>
            <li class="nav-item"><a class="nav-link" href="admin.jsp">Admin</a></li>
            <% } %>
            <li class="nav-item"><a class="nav-link" href="perfil.jsp">Mi Perfil</a></li>
        </ul>
        <a href="logout" class="btn btn-danger btn-sm">Salir</a>
    </div>
</nav>

<div class="container mt-4">

    <!-- Sección Por Leer -->
    <h2 class="titulo">📖 Por Leer (<%= porLeer.size() %>)</h2>
    <div class="libros-grid">
        <% for (Document libro : porLeer) { %>
        <div class="card">
            <img src="<%= libro.getString("portada") %>" class="card-img-top" alt="Portada">
            <div class="card-body">
                <h6 class="card-title"><%= libro.getString("titulo") %></h6>
                <form action="lista" method="post">
                    <input type="hidden" name="idLibro" value="<%= libro.getObjectId("_id") %>"/>
                    <input type="hidden" name="accion" value="quitar_por_leer"/>
                    <button class="btn btn-sm btn-outline-danger">❌ Quitar</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Sección Leídos -->
    <h2 class="titulo">✅ Leídos (<%= leidos.size() %>)</h2>
    <div class="libros-grid">
        <% for (Document libro : leidos) { %>
        <div class="card">
            <img src="<%= libro.getString("portada") %>" class="card-img-top" alt="Portada">
            <div class="card-body">
                <h6 class="card-title"><%= libro.getString("titulo") %></h6>
                <form action="lista" method="post">
                    <input type="hidden" name="idLibro" value="<%= libro.getObjectId("_id") %>"/>
                    <input type="hidden" name="accion" value="quitar_leidos"/>
                    <button class="btn btn-sm btn-outline-danger">❌ Quitar</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Sección Favoritos -->
    <h2 class="titulo">⭐ Favoritos (<%= favoritos.size() %>)</h2>
    <div class="libros-grid">
        <% for (Document libro : favoritos) { %>
        <div class="card">
            <img src="<%= libro.getString("portada") %>" class="card-img-top" alt="Portada">
            <div class="card-body">
                <h6 class="card-title"><%= libro.getString("titulo") %></h6>
                <form action="lista" method="post">
                    <input type="hidden" name="idLibro" value="<%= libro.getObjectId("_id") %>"/>
                    <input type="hidden" name="accion" value="quitar_favoritos"/>
                    <button class="btn btn-sm btn-outline-danger">❌ Quitar</button>
                </form>
            </div>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
