<%--
  Created by IntelliJ IDEA.
  User: dani9
  Date: 11/06/2025
  Time: 08:31 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Registro de Usuario</h2>
    <form action="registro" method="post">
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido paterno:</label>
            <input type="text" name="apellido_paterno" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido materno</label>
            <input type="text" name="apellido_materno" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha de nacimiento</label>
            <input type="date" name="fecha_nacimiento" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Correo</label>
            <input type="email" name="correo" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <input type="password" name="contraseña" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-primary">Registrarse</button>
    </form>
</div>
</body>
</html>
