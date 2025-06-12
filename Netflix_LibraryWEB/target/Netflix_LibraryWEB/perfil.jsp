<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Usuario" %>
<%
  Usuario u = (Usuario) session.getAttribute("usuario");
  if (u == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Mi Perfil - BookFlix</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #141414;
      color: white;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .profile-box {
      max-width: 600px;
      margin: 5vh auto;
      padding: 30px;
      background-color: #1f1f1f;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(229, 9, 20, 0.5);
    }

    h2 {
      color: #e50914;
      margin-bottom: 20px;
      text-align: center;
    }

    .form-control {
      background-color: #333;
      color: white;
      border: none;
    }

    .form-control:focus {
      background-color: #444;
      border-color: #e50914;
      box-shadow: 0 0 0 0.2rem rgba(229, 9, 20, 0.25);
    }

    .btn-netflix {
      background-color: #e50914;
      color: white;
      border-radius: 25px;
      font-weight: bold;
    }

    .btn-netflix:hover {
      background-color: #f6121d;
    }
  </style>
</head>
<body>

<div class="profile-box">
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

  <h2>👤 Mi Perfil</h2>

  <form action="perfil" method="post">
    <div class="mb-3">
      <label>Correo electrónico</label>
      <input type="email" class="form-control" value="<%= u.getCorreo() %>" readonly />
    </div>
    <div class="mb-3">
      <label>Nombre</label>
      <input type="text" class="form-control" name="nombre" value="<%= u.getNombre() %>" required />
    </div>
    <div class="mb-3">
      <label>Apellido paterno</label>
      <input type="text" class="form-control" name="apellido_paterno" value="<%= u.getApellido_paterno()%>" required />
    </div>
    <div class="mb-3">
      <label>Apellido materno</label>
      <input type="text" class="form-control" name="apellido_materno" value="<%= u.getApellido_materno()%>" required />
    </div>
    <div class="mb-3">
      <label>Fecha de nacimiento</label>
      <input type="date" class="form-control" name="fecha_nacimiento" value="<%= u.getFecha_nacimiento()%>" required />
    </div>
    <div class="mb-3">
      <label>Nueva contraseña (opcional)</label>
      <input type="password" class="form-control" name="nueva_contraseña" placeholder="••••••••" />
    </div>
    <button type="submit" class="btn btn-netflix w-100">Actualizar perfil</button>
    <div class="text-center mt-3">
      <a href="principal.jsp" class="btn btn-outline-light">⬅️ Volver al inicio</a>
    </div>

  </form>

  <div class="mt-3 text-center">
    <a href="logout" class="btn btn-outline-light btn-sm">Cerrar sesión</a>
  </div>
</div>

</body>
</html>
