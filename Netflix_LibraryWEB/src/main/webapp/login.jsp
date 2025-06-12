<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookFlix - Iniciar Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #141414;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-box {
            max-width: 400px;
            margin: 10vh auto;
            padding: 30px;
            background-color: #1f1f1f;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(229, 9, 20, 0.5);
        }

        .login-box h2 {
            color: #e50914;
            margin-bottom: 20px;
        }

        .form-control {
            background-color: #333;
            color: white;
            border: none;
        }

        .form-control:focus {
            background-color: #444;
            color: white;
            border-color: #e50914;
            box-shadow: 0 0 0 0.2rem rgba(229, 9, 20, 0.25);
        }

        .btn-netflix {
            background-color: #e50914;
            color: white;
            border-radius: 25px;
            width: 100%;
            font-weight: bold;
        }

        .btn-netflix:hover {
            background-color: #f6121d;
        }

        a {
            color: #bbb;
        }

        a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
<div class="login-box">
    <h2 class="text-center">Iniciar Sesión</h2>

    <% String error = request.getParameter("error");
        if (error != null) { %>
    <div class="alert alert-danger text-center">❌ Correo o contraseña incorrectos.</div>
    <% } %>

    <form action="login" method="post">
        <div class="mb-3">
            <label class="form-label">📧 Correo electrónico</label>
            <input type="email" name="correo" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">🔒 Contraseña</label>
            <input type="password" name="contraseña" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-netflix">Ingresar</button>
    </form>

    <p class="mt-3 text-center">¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
</div>
</body>
</html>
