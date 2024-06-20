package DAO;

import modelo.Cliente;

public interface ClienteDAO {
    void registrarCliente(Cliente cliente);
    void actualizarCliente(Cliente cliente);
    void eliminarCliente(Cliente cliente);
}
