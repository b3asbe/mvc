package Interfaces;

import Modelo.Venta;
import java.util.List;

public interface VentaDAO {
    public int registrarVenta(Venta venta); // Devuelve el ID de la venta generada
    public boolean registrarDetalleVenta(Modelo.DetalleVenta detalle);
    public List<Venta> listarVentas();
    public Venta obtenerVentaConDetallesPorId(int idVenta);
    // Métodos para actualizar y anular/eliminar ventas podrían ir aquí.
}