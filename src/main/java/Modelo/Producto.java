package Modelo;

import java.math.BigDecimal;

public class Producto {
    private String codigo;
    private String nombreProducto;
    private BigDecimal precioUnitario;
    private int stockDisponible;

    public Producto() {
    }

    public Producto(String codigo, String nombreProducto, BigDecimal precioUnitario, int stockDisponible) {
        this.codigo = codigo;
        this.nombreProducto = nombreProducto;
        this.precioUnitario = precioUnitario;
        this.stockDisponible = stockDisponible;
    }

    // Getters y Setters
    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public BigDecimal getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(BigDecimal precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int getStockDisponible() {
        return stockDisponible;
    }

    public void setStockDisponible(int stockDisponible) {
        this.stockDisponible = stockDisponible;
    }
}