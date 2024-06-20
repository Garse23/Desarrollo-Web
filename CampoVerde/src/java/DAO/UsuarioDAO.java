package DAO;

import modelo.Usuario;

public interface UsuarioDAO {
    void registrarUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void eliminarUsuario(Usuario usuario);
    int seleccionarID(Usuario usuario);
    int seleccionarRol(Usuario usuario);
    int seleccionarHabilitado(Usuario usuario);
    String SeleccionarNombreUsuario(Usuario usuario);
}
