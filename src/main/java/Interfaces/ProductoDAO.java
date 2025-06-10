package Interfaces;

import Modelo.Producto;
import java.util.List;

public interface ProductoDAO {
    public Producto buscarPorCodigo(String codigo);
    public boolean actualizarStock(String codigoProducto, int cantidadComprada);
    public List<Producto> listarProductosParaBusqueda(String termino); // Para el modal de búsqueda
    // Otros métodos CRUD para productos (agregar, actualizar, eliminar, listar todos) si son necesarios.
}