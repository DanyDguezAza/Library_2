package util;

public class ValidacionCampos {

    public static boolean nombrevalido(String nombre) {
        return nombre != null && nombre.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑÜü]+$");
    }

    public static boolean apellidovalido(String apellido) {
        return apellido != null &&  apellido.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑÜü]+$");
    }

    public static boolean correovalido(String correo) {
        return correo != null && correo.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑÜü]+$");
    }

    public static boolean esContraseñaValida(String contraseña) {
        return contraseña != null && contraseña.length() >= 8;
    }
}
