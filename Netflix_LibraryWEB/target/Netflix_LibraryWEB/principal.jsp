<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="beans.Usuario" %>
<%@ page import="beans.Libro" %>
<%@ page import="beans.Libro, java.util.List" %>
<%
    List<Libro> libros = (List<Libro>) request.getAttribute("libros");
%>
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
    <title>BookFlix - Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #141414;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #000;
            border-bottom: 2px solid #e50914;
        }

        .navbar-brand {
            color: #e50914;
            font-weight: bold;
            font-size: 1.8rem;
        }

        .navbar-nav .nav-link {
            color: white;
            margin-right: 20px;
        }

        .navbar-nav .nav-link:hover {
            color: #e50914;
        }

        .banner {
            background-image: url("https://images.unsplash.com/photo-1516979187457-637abb4f9356");
            background-size: cover;
            background-position: center;
            height: 300px;
            border-radius: 15px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .banner h1 {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px 40px;
            border-radius: 10px;
            font-size: 3rem;
            color: #fff;
        }

        .book-scroll-container {
            display: flex;
            overflow-x: auto;
            gap: 20px;
            padding-bottom: 20px;
        }

        .book-card {
            background-color: #1f1f1f;
            border-radius: 10px;
            flex: 0 0 180px;
            text-align: center;
            transition: transform 0.2s;
        }

        .book-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(229, 9, 20, 0.6);
        }

        .book-card img {
            width: 100%;
            height: 270px;
            object-fit: cover;
            border-radius: 8px;
        }

        .book-title {
            margin-top: 10px;
            font-size: 1rem;
            color: #fff;
        }


        .book-card:hover {
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(229, 9, 20, 0.6);
        }

        .book-card img {
            width: 100%;
            border-radius: 8px;
        }

        .book-title {
            margin-top: 10px;
            font-size: 1rem;
            color: #fff;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <img src="img/logo (2).png" alt="BookFlix Logo" style="max-width: 80px; margin-bottom: 20px;">
        <div class="collapse navbar-collapse">
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
    </div>
</nav>

<!-- BANNER DESTACADO -->
<div class="container mt-4">
    <div class="banner">
        <h1>Descubre tu próxima lectura favorita 📖</h1>
    </div>

    <!-- CUADRÍCULA DE LIBROS DEMO -->
    <h3 class="mb-3">📚 Recomendados</h3>
    <div class="book-scroll-container">
        <% int max = 6; int count = 0;
            for (Libro libro : libros) {
                if (count >= max) break;
        %>
        <div class="book-card">
            <img src="<%= libro.getPortada() %>" alt="Portada" />
            <div class="book-title"><%= libro.getTitulo() %></div>
        </div>
        <% count++; } %>
    </div>

    <!-- NUEVO BLOQUE - LIBROS POPULARES -->
    <h3 class="mt-5 mb-3">🔥 Más Populares</h3>
    <div class="book-scroll-container">
        <% int desde = 6; int maxExtra = 6;
            for (int i = desde; i < libros.size() && i < desde + maxExtra; i++) {
                Libro libro = libros.get(i);
        %>
        <div class="book-card">
            <img src="<%= libro.getPortada() %>" alt="Portada" />
            <div class="book-title"><%= libro.getTitulo() %></div>
        </div>
        <% } %>
    </div>

    <!-- NUEVO BLOQUE - FRASE DESTACADA -->
    <div class="mt-5 text-center">
        <blockquote class="blockquote">
            <p class="mb-0">“Un lector vive mil vidas antes de morir... el que nunca lee, solo vive una.”</p>
            <footer class="blockquote-footer text-white">George R. R. Martin</footer>
        </blockquote>
    </div>


</div>

</body>
</html>
