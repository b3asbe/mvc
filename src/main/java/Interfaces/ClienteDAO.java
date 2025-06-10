package Interfaces;

import Modelo.Cliente;

public interface ClienteDAO {
    public Cliente buscarPorDniRuc(String dniRuc);
    public int agregarCliente(Cliente cliente); // Devuelve el ID generado o -1 si falla
    // Puedes agregar más métodos como actualizar, listar, etc. si los necesitas para un CRUD de clientes.
}