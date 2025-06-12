<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 09:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Mis Listas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
<%@ include file="navbar.jspf" %>
<h2>📖 Libros por leer</h2>
<ul class="list-group mb-4">
    <% for (Document libro : porLeer) { %>
    <li class="list-group-item"><%= libro.getString("titulo") %></li>
    <% } %>
</ul>

<h2>✅ Libros leídos</h2>
<ul class="list-group mb-4">
    <% for (Document libro : leidos) { %>
    <li class="list-group-item"><%= libro.getString("titulo") %></li>
    <% } %>
</ul>

<h2>⭐ Favoritos</h2>
<ul class="list-group">
    <% for (Document libro : favoritos) { %>
    <li class="list-group-item"><%= libro.getString("titulo") %></li>
    <% } %>
</ul>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>

