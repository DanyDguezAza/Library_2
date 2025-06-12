<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 09:42 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <title>Mi Perfil</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>Hola, <%= u.getNombre() %> 👋</h2>
  <p><strong>Correo:</strong> <%= u.getCorreo() %></p>
  <a href="logout" class="btn btn-danger">Cerrar sesión</a>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>

