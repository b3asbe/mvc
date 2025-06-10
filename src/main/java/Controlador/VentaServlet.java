package Controlador;

import Modelo.Cliente;
import Modelo.DetalleVenta;
import Modelo.Producto;
import Modelo.Venta;
import Modelo.Vendedor;
import ModeloDAO.ClienteDAOImpl;
import ModeloDAO.ProductoDAOImpl;
import ModeloDAO.VentaDAOImpl;
import ModeloDAO.VendedorDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "VentaServlet", urlPatterns = {"/VentaServlet"})
public class VentaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar"; // Acción por defecto
        }

        VentaDAOImpl ventaDAO = new VentaDAOImpl();
        ClienteDAOImpl clienteDAO = new ClienteDAOImpl();
        VendedorDAOImpl vendedorDAO = new VendedorDAOImpl();
        // ProductoDAOImpl productoDAO = new ProductoDAOImpl(); // Ya se usa dentro de VentaDAOImpl

        switch (accion) {
            case "registrarModal":
                registrarVentaDesdeModal(request, response, ventaDAO, clienteDAO, vendedorDAO);
                break;
            case "registrarTab":
                // Similar a registrarModal pero tomando los parámetros del form de la pestaña
                // registrarVentaDesdeTab(request, response, ventaDAO, clienteDAO, vendedorDAO);
                 response.sendRedirect("ventas/ventas.jsp?status=not_implemented_tab"); // Placeholder
                break;
            case "listar":
                List<Venta> listaVentas = ventaDAO.listarVentas();
                request.setAttribute("listaVentas", listaVentas);
                // Asumimos que tienes una forma de volver a la página de ventas con la lista
                // Esto podría ser parte de la carga inicial de ventas.jsp
                // o podrías redirigir a ventas.jsp#ventas-list
                 request.getRequestDispatcher("ventas/ventas.jsp").forward(request, response);
                break;
            case "verDetalle":
                int idVenta = Integer.parseInt(request.getParameter("idVenta"));
                Venta ventaDetalle = ventaDAO.obtenerVentaConDetallesPorId(idVenta);
                request.setAttribute("ventaDetalle", ventaDetalle);
                // Aquí deberías enviar esto a un modal o una vista de detalle.
                // Por ahora, lo reenvío a la misma página, y el JSP/JS debería manejar la visualización en el modal.
                // Es común devolver JSON para que JS lo maneje.
                // Por simplicidad, reenviamos y el JS del modal deberá buscar este atributo.
                // O, si prefieres, puedes generar JSON aquí.
                 request.getRequestDispatcher("ventas/detalleVentaModalView.jsp").forward(request, response); // Un JSP específico para el modal
                break;
            // Otros casos: "editar", "anular", "buscarProductos", etc.
            default:
                List<Venta> ventasPorDefecto = ventaDAO.listarVentas();
                request.setAttribute("listaVentas", ventasPorDefecto);
                request.getRequestDispatcher("ventas/ventas.jsp").forward(request, response);
                break;
        }
    }
    
    private void registrarVentaDesdeModal(HttpServletRequest request, HttpServletResponse response, 
                                       VentaDAOImpl ventaDAO, ClienteDAOImpl clienteDAO, VendedorDAOImpl vendedorDAO)
            throws IOException, ServletException {

        try {
            // 1. Recuperar datos del Cliente
            String nombreCliente = request.getParameter("cliente"); // del modal es clienteModal
            String dniRucCliente = request.getParameter("dni");     // del modal es dniModal
            
            Cliente cliente = clienteDAO.buscarPorDniRuc(dniRucCliente);
            if (cliente == null) {
                cliente = new Cliente();
                cliente.setNombreCliente(nombreCliente);
                cliente.setDniRuc(dniRucCliente);
                int idNuevoCliente = clienteDAO.agregarCliente(cliente);
                if (idNuevoCliente == -1) {
                    response.sendRedirect("ventas/ventas.jsp?status=error_cliente");
                    return;
                }
                cliente.setIdCliente(idNuevoCliente);
            }

            // 2. Recuperar datos del Vendedor
            String nombreVendedorForm = request.getParameter("vendedor"); // del modal es vendedorModal
            Vendedor vendedor = vendedorDAO.buscarPorNombre(nombreVendedorForm); // Asumimos que "Carlos Ramirez" o "Admin" existe
            if (vendedor == null) {
                // Manejar caso: Vendedor no encontrado. Podrías tener un vendedor por defecto o error.
                // Por ahora, si no se encuentra, asignamos un ID de vendedor por defecto (ej: 1) o error.
                // Esto debería ser más robusto en una aplicación real.
                System.err.println("Vendedor no encontrado: " + nombreVendedorForm + ". Usando ID 1 por defecto o fallando.");
                // vendedor = vendedorDAO.buscarPorId(1); // Opcional: buscar un vendedor por defecto
                 if (vendedor == null) { // Si sigue siendo nulo
                    response.sendRedirect("ventas/ventas.jsp?status=error_vendedor_no_encontrado");
                    return;
                 }
            }

            // 3. Recuperar datos de la Venta
            Venta nuevaVenta = new Venta();
            nuevaVenta.setIdCliente(cliente.getIdCliente());
            nuevaVenta.setIdVendedor(vendedor.getIdVendedor());
            
            String fechaStr = request.getParameter("fechaVenta"); // del modal es fechaVentaModal
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(fechaStr);
            nuevaVenta.setFechaVenta(new Date(parsedDate.getTime()));
            
            nuevaVenta.setTipoComprobante(request.getParameter("tipoComprobante")); // tipoComprobanteModal
            nuevaVenta.setSerieNumero(request.getParameter("serieNumero"));         // serieNumeroModal
            nuevaVenta.setEstadoPago(request.getParameter("estadoPago"));           // estadoPagoModal

            // Los totales se calculan en base a los detalles, pero el form los envía también.
            // Es mejor recalcular en el backend o confiar en los cálculos del frontend si son validados.
            // Por ahora, tomamos los del formulario, pero con precaución.
            nuevaVenta.setSubtotal(new BigDecimal(request.getParameter("subtotalVenta").replace(",", ""))); // subtotalGeneralModal
            nuevaVenta.setIgv(new BigDecimal(request.getParameter("igvVenta").replace(",", "")));         // igvGeneralModal
            nuevaVenta.setTotal(new BigDecimal(request.getParameter("totalVenta").replace(",", "")));       // totalGeneralModal


            // 4. Recuperar Detalles de la Venta
            String[] codigos = request.getParameterValues("codigo[]");
            String[] nombresProductos = request.getParameterValues("producto[]"); // No se usa para BD, solo para mostrar si es necesario
            String[] cantidades = request.getParameterValues("cantidad[]");
            String[] preciosUnitarios = request.getParameterValues("precio[]");
            // String[] subtotalesDetalle = request.getParameterValues("subtotal[]"); // Calculado

            List<DetalleVenta> listaDetalles = new ArrayList<>();
            if (codigos != null) {
                for (int i = 0; i < codigos.length; i++) {
                    if (codigos[i] != null && !codigos[i].trim().isEmpty()) {
                        DetalleVenta detalle = new DetalleVenta();
                        detalle.setCodigoProducto(codigos[i].trim());
                        detalle.setCantidad(Integer.parseInt(cantidades[i]));
                        detalle.setPrecioUnitario(new BigDecimal(preciosUnitarios[i].replace(",", "")));
                        
                        // Calcular subtotal del detalle
                        BigDecimal subtotalDet = detalle.getPrecioUnitario().multiply(new BigDecimal(detalle.getCantidad()));
                        detalle.setSubtotal(subtotalDet);
                        
                        listaDetalles.add(detalle);
                    }
                }
            }
             if (listaDetalles.isEmpty()) {
                response.sendRedirect("ventas/ventas.jsp?status=error_sin_productos");
                return;
            }
            nuevaVenta.setDetalles(listaDetalles);

            // 5. Registrar la venta completa (esto incluye detalles y actualización de stock)
            int idVentaRegistrada = ventaDAO.registrarVenta(nuevaVenta);

            if (idVentaRegistrada != -1) {
                response.sendRedirect("VentaServlet?accion=listar&status=success_venta");
            } else {
                response.sendRedirect("ventas/ventas.jsp?status=error_venta_registro");
            }

        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("ventas/ventas.jsp?status=error_fecha_formato");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("ventas/ventas.jsp?status=error_numero_formato");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ventas/ventas.jsp?status=error_general");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar ventas";
    }
}