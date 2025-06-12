<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BookFlix - Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #141414;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-box {
            max-width: 500px;
            margin: 5vh auto;
            padding: 30px;
            background-color: #1f1f1f;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(229, 9, 20, 0.5);
        }

        h2 {
            color: #e50914;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
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

        .form-text {
            color: #bbb;
        }
    </style>

    <script>
        function validar() {
            var textoPattern = /^[A-ZÁÉÍÓÚÜÑ][a-záéíóúüñ]+( [A-ZÁÉÍÓÚÜÑ][a-záéíóúüñ]+)*$/;

            var nombre = document.getElementById("nombre").value;
            if (!textoPattern.test(nombre)) {
                alert("El nombre debe comenzar con mayúscula, sin números y cada palabra debe iniciar con mayúscula");
                return false;
            }

            var apellidop = document.getElementById("apellido_paterno").value;
            if (!textoPattern.test(apellidop)) {
                alert("El apellido paterno debe comenzar con mayúscula, sin espacios ni números");
                return false;
            }

            var apellidom = document.getElementById("apellido_materno").value;
            if (!textoPattern.test(apellidom)) {
                alert("El apellido materno debe comenzar con mayúscula, sin espacios ni números");
                return false;
            }

            var pass = document.getElementById("contraseña").value;
            if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}/.test(pass)) {
                alert("La contraseña debe tener al menos 8 caracteres, incluyendo mayúsculas, minúsculas y números");
                return false;
            }

            return true;
        }

        function formatearNombre(input) {
            input.value = input.value.replace(/[^A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]/g, '');
            if (input.value.length > 0) {
                input.value = input.value.toLowerCase().replace(/(^|\s)[a-záéíóúüñ]/g, function (letra) {
                    return letra.toUpperCase();
                });
            }
        }
    </script>
</head>
<body>
<div class="register-box">
    <h2 class="text-center">📝 Registro de Usuario</h2>
    <form onsubmit="return validar()" action="registro" method="post">
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" required
                   oninput="formatearNombre(this)"
                   pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]+" title="Solo letras, comenzando con mayúscula" />
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido paterno</label>
            <input type="text" id="apellido_paterno" name="apellido_paterno" class="form-control" required
                   oninput="formatearNombre(this)"
                   pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]+" title="Solo letras, comenzando con mayúscula" />
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido materno</label>
            <input type="text" id="apellido_materno" name="apellido_materno" class="form-control" required
                   oninput="formatearNombre(this)"
                   pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]+" title="Solo letras, comenzando con mayúscula" />
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha de nacimiento</label>
            <input type="date" name="fecha_nacimiento" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Correo electrónico</label>
            <input type="email" name="correo" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <input type="password" id="contraseña" name="contraseña" class="form-control" required
                   minlength="8"
                   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
                   title="Debe contener al menos 8 caracteres, una mayúscula, una minúscula y un número"/>
            <div class="form-text">Debe contener mayúsculas, minúsculas y números.</div>
        </div>
        <button type="submit" class="btn btn-netflix">Registrarse</button>
    </form>
</div>
</body>
</html>
