<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookFlix - Biblioteca Digital</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #141414;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 15vh;
        }

        .title {
            font-size: 3rem;
            color: #e50914;
            font-weight: bold;
        }

        .slogan {
            font-size: 1.5rem;
            color: #bbbbbb;
            margin-bottom: 40px;
        }

        .btn-netflix {
            padding: 12px 24px;
            font-size: 1.2rem;
            border-radius: 25px;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-login {
            background-color: #e50914;
            color: white;
        }

        .btn-login:hover {
            background-color: #f6121d;
        }

        .btn-register {
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-register:hover {
            background-color: white;
            color: #141414;
        }
    </style>
</head>
<body>
<div class="container text-center">
    <!-- Logo -->
    <img src="img/logo (2).png" alt="BookFlix Logo" style="max-width: 300px; margin-bottom: 20px;">
    <p class="slogan">Donde los libros viven en streaming. Lee lo que quieras, cuando quieras.</p>

    <a href="login.jsp" class="btn btn-netflix btn-login me-3">Iniciar sesión</a>
    <a href="registro.jsp" class="btn btn-netflix btn-register">Registrarse</a>
</div>
</body>
</html>
