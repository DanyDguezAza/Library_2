<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 07:51 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Libro, java.util.List" %>
<%@ page import="beans.Usuario" %>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Catálogo de Libros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #fff;
        }
        .card {
            background-color: #1f1f1f;
            border: none;
            color: #fff;
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
        }
        .btn {
            margin: 2px;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: #e50914 !important;
        }
        .nav-link {
            color: #fff !important;
        }
        .nav-link:hover {
            text-decoration: underline;
        }
        .titulo {
            font-size: 2rem;
            margin: 30px 0;
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

<!-- CONTENIDO -->
<div class="container mt-4">
    <h1 class="text-center titulo">📚 Catálogo de Libros</h1>
    <div class="row">
        <%
            List<Libro> libros = (List<Libro>) request.getAttribute("libros");
            for (Libro libro : libros) {
        %>
        <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
                <img src="<%= libro.getPortada() %>" class="img-fluid mb-3" style="height: 250px; object-fit: cover;" alt="Portada"/>
                <div class="card-body">
                    <h5 class="card-title"><%= libro.getTitulo() %></h5>
                    <p class="card-text"><strong>Autor:</strong> <%= libro.getAutor() %></p>
                    <p class="card-text"><strong>Género:</strong> <%= libro.getGenero() %></p>
                    <p class="card-text"><%= libro.getSinopsis() %></p>

                    <!-- Botones para listas -->
                    <form action="lista" method="post" style="display:inline">
                        <input type="hidden" name="idLibro" value="<%= libro.getId() %>"/>
                        <input type="hidden" name="accion" value="por_leer"/>
                        <button class="btn btn-outline-primary btn-sm">📖 Por leer</button>
                    </form>

                    <form action="lista" method="post" style="display:inline">
                        <input type="hidden" name="idLibro" value="<%= libro.getId() %>"/>
                        <input type="hidden" name="accion" value="leidos"/>
                        <button class="btn btn-outline-success btn-sm">✅ Leído</button>
                    </form>

                    <form action="lista" method="post" style="display:inline">
                        <input type="hidden" name="idLibro" value="<%= libro.getId() %>"/>
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

