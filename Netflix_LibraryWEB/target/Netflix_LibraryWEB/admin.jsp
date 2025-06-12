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
    <title>Panel de Administración</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<h2>Panel de Administración</h2>

<h4>Agregar nuevo libro</h4>
<form action="admin" method="post">
    <input type="hidden" name="accion" value="agregar" />
    <div class="mb-3">
        <input type="text" name="titulo" placeholder="Título" class="form-control" required />
    </div>
    <div class="mb-3">
        <input type="text" name="autor" placeholder="Autor" class="form-control" required />
    </div>
    <div class="mb-3">
        <input type="text" name="genero" placeholder="Género" class="form-control" required />
    </div>
    <div class="mb-3">
        <textarea name="sinopsis" placeholder="Sinopsis" class="form-control" required></textarea>
    </div>
    <button class="btn btn-success">Agregar libro</button>
</form>

<hr/>

<h4>Eliminar libro por ID</h4>
<form action="admin" method="post">
    <input type="hidden" name="accion" value="eliminar" />
    <div class="mb-3">
        <input type="text" name="id" placeholder="ID del libro" class="form-control" required />
    </div>
    <button class="btn btn-danger">Eliminar libro</button>
</form>

<p class="mt-3"><a href="libros">Volver a libros</a></p>
</body>
</html>


