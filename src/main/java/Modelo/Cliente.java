package Modelo;

public class Cliente {
    private int idCliente;
    private String nombreCliente;
    private String dniRuc;

    public Cliente() {
    }

    public Cliente(int idCliente, String nombreCliente, String dniRuc) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.dniRuc = dniRuc;
    }

    // Getters y Setters
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getDniRuc() {
        return dniRuc;
    }

    public void setDniRuc(String dniRuc) {
        this.dniRuc = dniRuc;
    }
}