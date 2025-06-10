<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Devolución</title>
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
        <h2 class="text-center">Registro de Devolución</h2>
        <hr>

        <!-- Información de la Devolución -->
        <div class="row mb-3">
            <div class="col-md-3">
                <label class="form-label">ID de Devolución:</label>
                <input type="text" class="form-control" name="idDevolucion" value="DEV-2025-0419" readonly>
            </div>
            <div class="col-md-3">
                <label class="form-label">Fecha de Devolución:</label>
                <input type="date" class="form-control" name="fechaDevolucion" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Nº Boleta/Factura:</label>
                <input type="text" class="form-control" name="numeroComprobante" placeholder="Ej. B001-12345">
            </div>
            <div class="col-md-3">
                <label class="form-label">Fecha de Compra:</label>
                <input type="date" class="form-control" name="fechaCompra">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Estado del Proceso:</label>
                <select class="form-select" name="estadoProceso">
                    <option>Verificación de falla</option>
                    <option>Autorización de devolución</option>
                    <option>Finalizado</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Motivo de Devolución:</label>
                <input type="text" class="form-control" name="motivoDevolucion" placeholder="Ej. Falla de fábrica">
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
                <input type="email" class="form-control" name="correoCliente" placeholder="Ejemplo: cliente@email.com">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Tipo de Documento:</label>
                <select class="form-select" name="tipoDocumento">
                    <option>DNI</option>
                    <option>Cédula</option>
                    <option>Pasaporte</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Número de Documento:</label>
                <input type="text" class="form-control" name="numeroDocumento">
            </div>
        </div>

        <!-- Tipo de devolución -->
        <h4>Acción a Tomar</h4>
        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label">Tipo de Devolución:</label>
                <select class="form-select" name="tipoDevolucion">
                    <option>Devolución de dinero</option>
                    <option>Cambio por otro producto</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Notas sobre la Devolución:</label>
                <textarea class="form-control" name="notasDevolucion" rows="3"></textarea>
            </div>
        </div>

        <div class="alert alert-warning mt-3">
            <p>🔹 <strong>Nota importante:</strong> La devolución de dinero procede solo si se confirma falla de fábrica y no hay stock para cambio inmediato.</p>
        </div>

        <!-- Botones de Acción -->
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">Guardar Devolución</button>
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
