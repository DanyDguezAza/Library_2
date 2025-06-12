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

    <script>
        function validar(){
            // Validar nombre (primera mayúscula, resto minúsculas, sin números, permite espacios para nombres compuestos)
            var textoPattern = /^[A-ZÁÉÍÓÚÜÑ][a-záéíóúüñ]+( [A-ZÁÉÍÓÚÜÑ][a-záéíóúüñ]+)*$/;

            var nombre = document.getElementById("nombre").value;
            if (!textoPattern.test(nombre)) {
                alert("El nombre debe comenzar con mayúscula, sin números y cada palabra debe iniciar con mayúscula");
                return false;
            }

            // Validar apellido paterno (misma lógica que nombre pero sin espacios)
            var apellidop = document.getElementById("apellido_paterno").value;
            if (!textoPattern.test(apellidop)) {
                alert("El apellido paterno debe comenzar con mayúscula, sin espacios ni números");
                return false;
            }

            // Validar apellido materno (misma lógica que paterno)
            var apellidom = document.getElementById("apellido_materno").value;
            if (!textoPattern.test(apellidom)) {
                alert("El apellido materno debe comenzar con mayúscula, sin espacios ni números");
                return false;
            }

            // Validar contraseña
            var pass = document.getElementById("contraseña").value;
            if (pass.length < 8){
                alert("La contraseña debe tener al menos 8 caracteres");
                return false;
            }

            if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}/.test(pass)) {
                alert("La contraseña debe tener al menos 8 caracteres, incluyendo mayúsculas, minúsculas y números");
                return false;
            }

            return true;
        }

        // Función para forzar formato mientras escribe (opcional)
        function formatearNombre(input) {
            // Elimina todo lo que no sea letra, espacio o acento
            input.value = input.value.replace(/[^A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]/g, '');

            // Capitaliza la primera letra de cada palabra
            if(input.value.length > 0) {
                input.value = input.value.toLowerCase().replace(/(^|\s)[a-záéíóúüñ]/g, function(letra) {
                    return letra.toUpperCase();
                });
            }
        }
    </script>

    <form onsubmit="return validar()" action="registro" method="post">
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" id="nombre" name="nombre" class="form-control" required
                   oninput="formatearNombre(this)"
                   pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]+"
                   title="Solo letras, comenzando con mayúscula"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido paterno:</label>
            <input type="text" id="apellido_paterno" name="apellido_paterno" class="form-control" required
                   oninput="formatearNombre(this)"
                   pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]+"
                   title="Solo letras, comenzando con mayúscula"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido materno</label>
            <input type="text" id="apellido_materno" name="apellido_materno" class="form-control" required
                   oninput="formatearNombre(this)"
                   pattern="[A-Za-zÁÉÍÓÚáéíóúÜüÑñ ]+"
                   title="Solo letras, comenzando con mayúscula"/>
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
            <input type="password" id="contraseña" name="contraseña" class="form-control"
                   required minlength="8"
                   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$"
                   title="Debe contener al menos 8 caracteres, una mayúscula, una minúscula y un número"/>
            <div class="form-text">Mínimo 8 caracteres con mayúsculas, minúsculas y números</div>
        </div>
        <button type="submit" class="btn btn-primary">Registrarse</button>
    </form>
</div>
</body>
</html>
