<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 09:40 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Iniciar Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Iniciar Sesión</h2>

    <% String error = request.getParameter("error");
        if (error != null) { %>
    <div class="alert alert-danger">Correo o contraseña incorrectos.</div>
    <% } %>

    <form action="login" method="post">
        <div class="mb-3">
            <label class="form-label">Correo</label>
            <input type="email" name="correo" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <input type="password" name="contraseña" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-success">Ingresar</button>
    </form>
    <p class="mt-3">¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
</div>
</body>
</html>
