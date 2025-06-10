package Interfaces;

import Modelo.Vendedor;

public interface VendedorDAO {
    public Vendedor buscarPorNombre(String nombre); // O buscarPorId si es más conveniente
    // Puedes agregar más métodos si necesitas un CRUD de vendedores.
}