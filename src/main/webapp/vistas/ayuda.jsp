<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Centro de Ayuda</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="d-flex">
        <div class="bg-dark text-light p-3" style="width: 250px; min-height: 100vh;">
            <h4 class="text-center">Sistema de Gestión</h4>
            <hr>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link text-light" href="index.jsp">Inicio</a></li>
                <li class="nav-item"><a class="nav-link text-light" href="ayuda.jsp">Ayuda</a></li>
            </ul>
            <a href="${pageContext.request.contextPath}/cerrar" class="text-warning">Cerrar Sesión</a>
        </div>

    <div class="container mt-4">
        <h2 class="text-center">Servicio de Asistencia Rápida</h2>
        <p class="text-center text-muted">Encuentra respuestas a tus consultas de manera rápida y fácil.</p>
        <hr>

        <!-- Buscador de ayuda -->
        <div class="mb-4 text-center">
            <input type="text" class="form-control w-50 mx-auto" placeholder="¿Con qué podemos ayudarte?">
        </div>

        <!-- Secciones de ayuda -->
        <div class="row">
            <div class="col-md-6">
                <h4>📦 Envío y Entrega</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Costo de envío</a></li>
                    <li><a href="#">Tiempo de entrega</a></li>
                </ul>
                
                <h4>🔁 Cambios y Devoluciones</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Políticas de devolución</a></li>
                    <li><a href="#">Garantía de productos</a></li>
                    <li><a href="#">Preguntas frecuentes</a></li>
                </ul>

                <h4>💳 Medios de Pago</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Preguntas sobre métodos de pago</a></li>
                    <li><a href="#">Tarjetas Visa, MasterCard</a></li>
                    <li><a href="#">Pago en efectivo</a></li>
                </ul>
            </div>

            <div class="col-md-6">
                <h4>📋 Pedidos</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Estado de pedido</a></li>
                    <li><a href="#">Cancelar pedido</a></li>
                    <li><a href="#">Modificar pedido</a></li>
                </ul>

                <h4>📖 Guías</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Guía de tallas</a></li>
                    <li><a href="#">Guía de compra</a></li>
                </ul>

                <h4>⚖️ Términos y Condiciones</h4>
                <ul class="list-unstyled">
                    <li><a href="#">Términos sobre envíos</a></li>
                    <li><a href="#">Términos sobre devoluciones</a></li>
                    <li><a href="#">Condiciones de promociones</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--<footer class="text-center bg-light py-2">
        <p class="mb-0 text-dark">© 2025 Ronny Chiclla. Todos los derechos reservados. | Correo: chicllaelmas@gmail.com</p>
    </footer>-->
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
