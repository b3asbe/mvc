<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Pedido</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body class="bg-light">
<!-- Barra de navegación lateral -->
    <div class="d-flex">
        <div class="bg-dark text-light p-3" style="width: 250px; min-height: 100vh;">
            <h4 class="text-center">Sistema de Gestión</h4>
            <hr>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link text-light" href="index.jsp">Inicio</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="ventas.jsp">Ventas</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="pedidos.jsp">Pedidos</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="devoluciones.jsp">Devoluciones</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="ayuda.jsp">Ayuda</a></li>
            </ul>
            <a href="${pageContext.request.contextPath}/cerrar" class="text-warning">Cerrar Sesión</a>
        </div>

    <div class="container mt-4">
        <h2 class="text-center">Registro de Pedido</h2>
        <hr>

        <!-- Información del Pedido -->
        <div class="row mb-3">
            <div class="col-md-3">
                <label class="form-label">ID de Pedido:</label>
                <input type="text" class="form-control" name="idPedido" value="PED-2025-0419" readonly>
            </div>
            <div class="col-md-3">
                <label class="form-label">Fecha de Solicitud:</label>
                <input type="date" class="form-control" name="fechaPedido" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Estado del Pedido:</label>
                <select class="form-select" name="estadoPedido">
                    <option>Cotización pendiente</option>
                    <option>Procesando</option>
                    <option>En camino</option>
                    <option>Entregado</option>
                </select>
            </div>
            <div class="col-md-3">
                <label class="form-label">Tiempo de entrega:</label>
                <input type="text" class="form-control" name="tiempoEntrega" value="1-2 días" readonly>
            </div>
        </div>

        <!-- Información del Cliente -->
        <h4>Datos del Cliente</h4>
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Nombre:</label>
                <input type="text" class="form-control" name="nombreCliente" placeholder="Nombre completo" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Teléfono:</label>
                <input type="text" class="form-control" name="telefonoCliente" placeholder="Número de contacto" required>
            </div>
            <div class="col-md-4">
                <label class="form-label">Correo Electrónico:</label>
                <input type="email" class="form-control" name="correoCliente" placeholder="Ejemplo: cliente@email.com" required>
            </div>
        </div>

        <!-- Información del Vehículo -->
        <h4>Datos del Vehículo</h4>
        <div class="row mb-3">
            <div class="col-md-3">
                <label class="form-label">Marca:</label>
                <input type="text" class="form-control" name="marcaVehiculo" placeholder="Ej. Toyota" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Modelo:</label>
                <input type="text" class="form-control" name="modeloVehiculo" placeholder="Ej. Corolla" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Año:</label>
                <input type="number" class="form-control" name="añoVehiculo" min="1900" max="2025" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Placa:</label>
                <input type="text" class="form-control" name="placaVehiculo" placeholder="Ej. ABC-123" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">VIN/Serie:</label>
                <input type="text" class="form-control" name="vinVehiculo" placeholder="Número de serie del vehículo" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Tarjeta de Propiedad:</label>
                <input type="file" class="form-control" name="tarjetaPropiedad">
            </div>
        </div>

        <!-- Botones de Acción -->
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">Guardar Pedido</button>
            <button type="reset" class="btn btn-secondary">Cancelar</button>
        </div>
    </div>
<!--<footer class="text-center bg-light py-2">
        <p class="mb-0 text-dark">© 2025 Ronny Chiclla. Todos los derechos reservados. | Correo: chicllaelmas@gmail.com</p>
    </footer>-->
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
