<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 10:09 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Usuario" %>
<%
    Usuario u = (Usuario) session.getAttribute("usuario");
    if (u == null || !"admin".equals(u.getRol())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin - BookFlix</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .navbar-brand {
            color: #e50914 !important;
            font-weight: bold;
            font-size: 1.5rem;
        }
        .form-control, .btn {
            margin-top: 10px;
        }
        .card {
            background-color: #1f1f1f;
            color: white;
        }
        .btn-success {
            background-color: #00c853;
        }
        .btn-danger {
            background-color: #d50000;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="principal.jsp">📚 BookFlix</a>
        <ul class="navbar-nav me-auto">
            <li class="nav-item"><a class="nav-link" href="libros">Catálogo</a></li>
            <li class="nav-item"><a class="nav-link" href="mislibros.jsp">Mis Libros</a></li>
            <li class="nav-item"><a class="nav-link" href="perfil.jsp">Mi Perfil</a></li>
            <li class="nav-item"><a class="nav-link active" href="admin.jsp">Admin</a></li>
        </ul>
        <a href="logout" class="btn btn-danger btn-sm">Salir</a>
    </div>
</nav>

<div class="container mt-4">
    <h2 class="mb-4">🔧 Panel de Administración</h2>

    <div class="card p-4 mb-4">
        <h4>📚 Agregar nuevo libro</h4>
        <form action="admin" method="post">
            <input type="hidden" name="accion" value="agregar" />
            <input type="text" name="titulo" placeholder="Título" class="form-control" required />
            <input type="text" name="autor" placeholder="Autor" class="form-control" required />
            <input type="text" name="genero" placeholder="Género" class="form-control" required />
            <textarea name="sinopsis" placeholder="Sinopsis" class="form-control" required></textarea>
            <input type="text" name="portada" placeholder="URL de la portada" class="form-control" required />
            <button class="btn btn-success">Agregar libro</button>
        </form>
    </div>

    <div class="card p-4">
        <h4>🗑️ Eliminar libro por ID</h4>
        <form action="admin" method="post">
            <input type="hidden" name="accion" value="eliminar" />
            <input type="text" name="id" placeholder="ID del libro" class="form-control" required />
            <button class="btn btn-danger">Eliminar libro</button>
        </form>
    </div>

    <p class="mt-4"><a href="libros" class="btn btn-outline-light">← Volver a Catálogo</a></p>
</div>

</body>
</html>



