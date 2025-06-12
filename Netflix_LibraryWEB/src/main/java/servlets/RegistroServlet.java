package servlets;

import beans.Usuario;
import dao.UsuarioDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido_paterno = request.getParameter("apellido_paterno");
        String apellido_materno = request.getParameter("apellido_materno");
        String fecha_nac = request.getParameter("fecha_nacimiento");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");

        if (fecha_nac != null && !fecha_nac.isEmpty()) {
            LocalDate fecha_nacimiento = LocalDate.parse(fecha_nac);
            LocalDate actual = LocalDate.now(); //obtener fecha actual
            int edad = Period.between(fecha_nacimiento, actual).getYears();
            //calcula el tiempo entre la fecha agregada y la actual
            if (edad >= 18) {
                Usuario u = new Usuario(nombre, apellido_paterno, apellido_materno, fecha_nacimiento, correo, contraseña);
                UsuarioDAO dao = new UsuarioDAO();
                dao.registrarUsuario(u);
                response.sendRedirect("login.jsp");

            }else{
                response.getWriter().println("Debes ser mayor a 18 años");
            }
        }else{
            response.getWriter().println("Fecha invalida");
        }

    }

}