<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FRANK Piura - Módulo de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #e63946;
            --secondary-color: #1d3557;
            --accent-color: #f1faee;
            --light-blue: #457b9d;
            --medium-blue: #1d3557;
            --light-bg: #f8f9fa;
            --card-hover: #f1faee;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-bg);
            overflow-x: hidden;
        }
        
        /* Sidebar Styling */
        .sidebar {
            background: var(--secondary-color);
            min-height: 100vh;
            width: 250px;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 100;
            transition: all 0.3s;
            box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
        }
        
        .content-wrapper {
            margin-left: 250px;
            width: calc(100% - 250px);
            transition: all 0.3s;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .sidebar-header {
            padding: 15px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .logo-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .logo-icon {
            font-size: 26px;
            color: var(--primary-color);
        }
        
        .logo-text {
            font-size: 22px;
            font-weight: 700;
            color: white;
            margin: 0;
        }
        
        .sidebar-menu {
            padding: 20px 0;
        }
        
        .menu-label {
            color: #a8b2bd;
            text-transform: uppercase;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 1px;
            padding: 15px 20px 10px;
        }
        
        .nav-link {
            color: #f1faee !important;
            padding: 12px 25px;
            font-size: 15px;
            border-left: 4px solid transparent;
            display: flex;
            align-items: center;
            transition: all 0.2s;
            position: relative;
            overflow: hidden;
        }
        
        .nav-link:hover, .nav-link.active {
            background-color: rgba(255,255,255,0.05);
            border-left-color: var(--primary-color);
            color: #ffffff !important;
        }
        
        .nav-link i {
            margin-right: 12px;
            font-size: 18px;
            width: 22px;
            text-align: center;
        }
        
        .nav-link .badge {
            position: absolute;
            right: 15px;
            background-color: var(--primary-color);
        }
        
        /* Main Content Styling */
        .main-content {
            flex: 1;
            padding: 30px;
            position: relative;
            background-color: #f8f9fa;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            margin-bottom: 0; /* Adjusted as it's part of page-header */
            position: relative;
            padding-bottom: 15px;
        }
        
        .page-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            height: 4px;
            width: 60px;
            background-color: var(--primary-color);
            border-radius: 2px;
        }
        
        /* Top Navbar */
        .top-navbar {
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .menu-toggle {
            font-size: 20px;
            color: var(--secondary-color);
            cursor: pointer;
            display: none; /* Hidden by default, shown in responsive */
        }
        
        .search-box {
            position: relative;
            max-width: 400px;
            width: 100%;
        }
        
        .search-box input {
            width: 100%;
            height: 40px;
            border-radius: 20px;
            padding: 5px 15px 5px 40px;
            border: 1px solid #e1e5eb;
            transition: all 0.3s;
        }
        
        .search-box input:focus {
            box-shadow: 0 0 0 3px rgba(29, 53, 87, 0.1);
            border-color: var(--secondary-color);
        }
        
        .search-box i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .user-menu {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-menu .notification {
            position: relative;
            cursor: pointer;
        }
        
        .notification i {
            font-size: 20px;
            color: #6c757d;
        }
        
        .notification-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: var(--primary-color);
            color: white;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            font-size: 11px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }
        
        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--light-blue);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 16px;
        }
        
        .user-details {
            display: flex;
            flex-direction: column;
        }
        
        .user-name {
            font-weight: 600;
            color: var(--secondary-color);
            font-size: 15px;
        }
        
        .user-role {
            font-size: 12px;
            color: #6c757d;
        }
        
        /* Footer Styling */
        footer {
            background-color: #fff;
            padding: 15px 30px;
            text-align: center;
            border-top: 1px solid #e1e5eb;
        }
        
        .footer-text {
            margin-bottom: 0;
            color: #6c757d;
            font-size: 14px;
        }
        
        /* Ventas Module Specific */
        .actions-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .filter-group {
            display: flex;
            gap: 10px;
        }
        
        .table-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .ventas-table th {
            background-color: var(--secondary-color);
            color: white;
            border: none;
        }
        
        .ventas-table td {
            vertical-align: middle;
        }
        
        .badge-pagado {
            background-color: #2a9d8f;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .badge-pendiente {
            background-color: #e9c46a;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .sales-overview {
            margin-bottom: 30px;
        }
        
        .summary-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 20px;
            text-align: center;
        }
        
        .summary-icon {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 24px;
        }
        
        .summary-total {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 0;
            color: var(--secondary-color);
        }
        
        .summary-label {
            color: #6c757d;
            margin-bottom: 5px;
        }
        
        /* Tabs styling */
        .nav-tabs {
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 20px;
        }
        
        .nav-tabs .nav-item {
            margin-bottom: -2px; /* Aligns with the bottom border */
        }
        
        .nav-tabs .nav-link {
            border: none;
            color: #6c757d; 
            font-weight: 600;
            padding: 12px 20px;
            border-bottom: 2px solid transparent;
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            background-color: transparent;
            border-bottom: 2px solid var(--primary-color);
        }
        
        .nav-tabs .nav-link:hover:not(.active) {
            border-color: transparent; 
            color: var(--secondary-color);
        }
        
        /* Form styling */
        .form-section {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 25px;
            margin-bottom: 30px;
        }

        .form-section h4 {
            color: var(--secondary-color);
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        
        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .content-wrapper {
                margin-left: 0;
                width: 100%;
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .menu-toggle {
                display: block;
            }
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .page-header .btn {
                margin-top: 15px;
            }
        }
        
        @media (max-width: 768px) {
            .sidebar.active {
                width: 100%; 
            }
            .actions-bar {
                flex-direction: column;
                gap: 15px;
                align-items: stretch;
            }
            .filter-group {
                flex-wrap: wrap;
            }
            .top-navbar{
                padding: 15px;
            }
            .main-content{
                padding: 15px;
            }
        }
        
        /* Product search modal */
        #productoModal .modal-dialog { /* For the tab form's product search */
            max-width: 800px;
        }
        #registroVentaModal .modal-dialog { /* For the user's specific form modal */
             max-width: 900px; /* Make it quite wide for the form */
        }
        @media (min-width: 1200px) {
            #registroVentaModal .modal-dialog {
                max-width: 1140px; /* Even wider on XL screens */
            }
        }

        .producto-item {
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .producto-item:hover {
            background-color: var(--accent-color);
        }
        
        /* Animated action buttons */
        .btn-animated {
            transition: all 0.3s;
        }
        
        .btn-animated:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* Form validation styles */
        .is-invalid {
            border-color: #dc3545;
        }
        .invalid-feedback {
            display: block;
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        /* Receipt preview section */
        .receipt-preview {
            background: #fff;
            border: 1px dashed #ddd;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
        }
        .receipt-header {
            text-align: center;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        
        /* Payment modal */
        .payment-option {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.2s;
        }
        .payment-option:hover, .payment-option.selected {
            border-color: var(--primary-color);
            background-color: rgba(230, 57, 70, 0.05);
        }
        .payment-option img {
            height: 30px;
            margin-right: 10px;
        }

        /* Pagination styling */
        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            color: white;
        }
        .pagination .page-link {
            color: var(--secondary-color);
        }
        .pagination .page-link:hover {
            color: var(--primary-color);
        }
    </style>
</head>
<body>
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="logo-wrapper">
                <i class="fas fa-cogs logo-icon"></i>
                <h5 class="logo-text">FRANK PIURA</h5>
            </div>
        </div>
        <div class="sidebar-menu">
            <div class="menu-label">PRINCIPAL</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="../index.jsp">
                        <i class="fas fa-home"></i> Inicio
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-chart-bar"></i> Reportes
                        <span class="badge">Nuevo</span>
                    </a>
                </li>
            </ul>
            <div class="menu-label">MÓDULOS</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="ventas.jsp">
                        <i class="fas fa-shopping-cart"></i> Ventas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pedidos.jsp">
                        <i class="fas fa-box"></i> Pedidos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="devoluciones.jsp">
                        <i class="fas fa-exchange-alt"></i> Devoluciones
                    </a>
                </li>
            </ul>
            <div class="menu-label">SISTEMA</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="../ayuda.jsp">
                        <i class="fas fa-question-circle"></i> Ayuda
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-cog"></i> Configuración
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-warning" href="${pageContext.request.contextPath}/cerrar">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                    </a>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="content-wrapper" id="content-wrapper">
        <div class="top-navbar">
            <div class="d-flex align-items-center">
                <div class="menu-toggle me-3" id="menu-toggle">
                    <i class="fas fa-bars"></i>
                </div>
                <div class="search-box d-none d-md-block">
                    <i class="fas fa-search"></i>
                    <input type="text" class="form-control" placeholder="Buscar ventas, comprobantes...">
                </div>
            </div>
            <div class="user-menu">
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <span class="notification-count">3</span>
                </div>
                <div class="user-info">
                    <div class="avatar"> <i class="fas fa-user"></i> </div>
                    <div class="user-details d-none d-md-flex">
                        <span class="user-name">Admin</span>
                        <span class="user-role">Administrador</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-header">
                <div class="page-title">
                    <h2>Gestión de Ventas</h2>
                    <p class="text-muted">Administre todas las operaciones de ventas de repuestos</p>
                </div>
                <button type="button" class="btn btn-primary btn-animated" data-bs-toggle="modal" data-bs-target="#registroVentaModal">
                    <i class="fas fa-plus-circle me-2"></i>Registrar Nueva Venta
                </button>
            </div>
            
            <div class="row sales-overview">
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="summary-card">
                        <div class="summary-icon" style="background-color: rgba(230, 57, 70, 0.1); color: var(--primary-color);">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <p class="summary-label">Ventas Totales</p>
                        <h3 class="summary-total">S/ 26,580</h3>
                        <small class="text-muted">Este mes</small>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="summary-card">
                        <div class="summary-icon" style="background-color: rgba(29, 53, 87, 0.1); color: var(--secondary-color);">
                            <i class="fas fa-receipt"></i>
                        </div>
                        <p class="summary-label">Comprobantes</p>
                        <h3 class="summary-total">128</h3>
                        <small class="text-muted">Este mes</small>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="summary-card">
                        <div class="summary-icon" style="background-color: rgba(42, 157, 143, 0.1); color: #2a9d8f;">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <p class="summary-label">Ventas Pagadas</p>
                        <h3 class="summary-total">112</h3>
                        <small class="text-muted">Este mes</small>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <div class="summary-card">
                        <div class="summary-icon" style="background-color: rgba(233, 196, 106, 0.1); color: #e9c46a;">
                            <i class="fas fa-clock"></i>
                        </div>
                        <p class="summary-label">Pendientes</p>
                        <h3 class="summary-total">16</h3>
                        <small class="text-muted">Pendientes de pago</small>
                    </div>
                </div>
            </div>
            
            <ul class="nav nav-tabs" id="ventasTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="ventas-list-tab" data-bs-toggle="tab" data-bs-target="#ventas-list" type="button" role="tab" aria-controls="ventas-list" aria-selected="true">
                        <i class="fas fa-list me-2"></i>Lista de Ventas
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="nueva-venta-form-tab" data-bs-toggle="tab" data-bs-target="#nueva-venta-form-content" type="button" role="tab" aria-controls="nueva-venta-form-content" aria-selected="false">
                        <i class="fas fa-file-alt me-2"></i>Formulario Venta (Alternativo en Tab)
                    </button>
                </li>
            </ul>
            
            <div class="tab-content" id="ventasTabContent">
                <div class="tab-pane fade show active" id="ventas-list" role="tabpanel" aria-labelledby="ventas-list-tab">
                    <div class="actions-bar">
                        <div class="filter-group">
                            <select class="form-select form-select-sm" aria-label="Filtrar por estado">
                                <option selected>Todos los estados</option>
                                <option value="1">Pagados</option>
                                <option value="2">Pendientes</option>
                            </select>
                            <select class="form-select form-select-sm" aria-label="Filtrar por fecha">
                                <option selected>Este mes</option>
                                <option value="1">Última semana</option>
                                <option value="2">Hoy</option>
                                <option value="3">Personalizado</option>
                            </select>
                            <button class="btn btn-sm btn-outline-secondary"><i class="fas fa-filter me-1"></i>Aplicar</button>
                        </div>
                        <div>
                            <button class="btn btn-sm btn-outline-success me-2"><i class="fas fa-file-excel me-1"></i>Excel</button>
                            <button class="btn btn-sm btn-outline-danger"><i class="fas fa-file-pdf me-1"></i>PDF</button>
                        </div>
                    </div>
                    <div class="table-container">
                        <div class="table-responsive">
                            <table class="table ventas-table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th><th>Fecha</th><th>Comprobante</th><th>Cliente</th><th>Total</th><th>Estado</th><th>Vendedor</th><th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td><td>06/05/2025</td><td>F001-000148</td><td>Jorge Mendoza</td><td>S/ 450.00</td>
                                        <td><span class="badge-pagado">Pagado</span></td><td>Carlos Ramírez</td>
                                        <td>
                                            <button class="btn btn-sm btn-primary btn-animated" title="Ver detalle" data-bs-toggle="modal" data-bs-target="#detalleVentaModal"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-success btn-animated" title="Imprimir"><i class="fas fa-print"></i></button>
                                            <button class="btn btn-sm btn-warning btn-animated" title="Editar"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>2</td><td>06/05/2025</td><td>B001-002547</td><td>María López</td><td>S/ 120.00</td>
                                        <td><span class="badge-pagado">Pagado</span></td><td>Carlos Ramírez</td>
                                        <td>
                                            <button class="btn btn-sm btn-primary btn-animated" title="Ver detalle" data-bs-toggle="modal" data-bs-target="#detalleVentaModal"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-success btn-animated" title="Imprimir"><i class="fas fa-print"></i></button>
                                            <button class="btn btn-sm btn-warning btn-animated" title="Editar"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td><td>05/05/2025</td><td>F001-000147</td><td>Roberto Guzmán</td><td>S/ 875.50</td>
                                        <td><span class="badge-pendiente">Pendiente</span></td><td>Ana Torres</td>
                                        <td>
                                            <button class="btn btn-sm btn-primary btn-animated" title="Ver detalle" data-bs-toggle="modal" data-bs-target="#detalleVentaModal"><i class="fas fa-eye"></i></button>
                                            <button class="btn btn-sm btn-success btn-animated" title="Imprimir"><i class="fas fa-print"></i></button>
                                            <button class="btn btn-sm btn-warning btn-animated" title="Editar"><i class="fas fa-edit"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <nav aria-label="Page navigation" class="d-flex justify-content-center mt-3">
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" href="#">Anterior</a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                <div class="tab-pane fade" id="nueva-venta-form-content" role="tabpanel" aria-labelledby="nueva-venta-form-tab">
                    <div class="form-section">
                        <h3 class="text-center mb-4" style="color: var(--secondary-color);">Registrar Venta (Formulario en Pestaña)</h3>
                        <p class="text-muted text-center">Este es un formulario alternativo con búsqueda de productos integrada.</p>
                        <hr class="mb-4">
                        <form action="procesarVentaEnTab" method="post" id="formNuevaVentaEnTab">
                            <h4><i class="fas fa-user-friends me-2"></i>Datos del Cliente y Venta</h4>
                            <div class="row mb-3">
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <label for="clienteNombreTab" class="form-label">Cliente:</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="clienteNombreTab" name="cliente" placeholder="Nombre del cliente" required>
                                        <button class="btn btn-outline-secondary" type="button" title="Buscar Cliente"><i class="fas fa-search"></i></button>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <label for="clienteDniRucTab" class="form-label">DNI / RUC:</label>
                                    <input type="text" class="form-control" id="clienteDniRucTab" name="dni" placeholder="Número de identificación" required>
                                </div>
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <label for="vendedorTab" class="form-label">Vendedor:</label>
                                    <input type="text" class="form-control" id="vendedorTab" name="vendedor" value="Admin" readonly>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <label for="fechaVentaTab" class="form-label">Fecha Venta:</label>
                                    <input type="date" class="form-control" id="fechaVentaTab" name="fechaVenta" required>
                                </div>
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <label for="tipoComprobanteTab" class="form-label">Tipo de Comprobante:</label>
                                    <select class="form-select" id="tipoComprobanteTab" name="tipoComprobante">
                                        <option value="boleta">Boleta</option><option value="factura">Factura</option>
                                    </select>
                                </div>
                                <div class="col-md-6 col-lg-4 mb-3">
                                    <label for="serieNumeroTab" class="form-label">Serie y Número:</label>
                                    <input type="text" class="form-control" id="serieNumeroTab" name="serieNumero" placeholder="Ej. B001-12345" required>
                                </div>
                            </div>
                            <h4 class="mt-4"><i class="fas fa-tools me-2"></i>Detalle de Repuestos</h4>
                             <div class="d-flex justify-content-end mb-2">
                                <button type="button" class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#productoModal">
                                    <i class="fas fa-search-plus me-2"></i>Buscar y Agregar Producto
                                </button>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Código</th><th>Producto</th><th style="width: 100px;">Cantidad</th>
                                            <th>P. Unitario</th><th>Subtotal</th><th style="width: 120px;">Stock Disp.</th><th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablaProductosVentaEnTab">
                                        <tr><td colspan="7" class="text-center text-muted">Agregue productos a la venta.</td></tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row mt-4 justify-content-end">
                                <div class="col-md-6 col-lg-4">
                                     <div class="mb-2 row">
                                        <label for="subtotalVentaTab" class="col-sm-5 col-form-label text-end">Subtotal:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm" id="subtotalVentaTab" name="subtotalVenta" readonly placeholder="S/ 0.00">
                                        </div>
                                    </div>
                                    <div class="mb-2 row">
                                        <label for="igvVentaTab" class="col-sm-5 col-form-label text-end">IGV (18%):</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm" id="igvVentaTab" name="igvVenta" readonly placeholder="S/ 0.00">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label for="totalVentaTab" class="col-sm-5 col-form-label text-end fw-bold">Total:</label>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control form-control-sm fw-bold" id="totalVentaTab" name="totalVenta" readonly placeholder="S/ 0.00" style="font-size: 1.1rem;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between align-items-center mt-4 pt-3 border-top">
                                <div>
                                    <label for="estadoPagoTab" class="form-label me-2">Estado de Pago:</label>
                                    <select class="form-select form-select-sm d-inline-block" id="estadoPagoTab" name="estadoPago" style="width: auto;">
                                        <option value="pagado">Pagado</option><option value="pendiente">Pendiente</option>
                                    </select>
                                </div>
                                <div class="text-end">
                                    <button type="button" class="btn btn-success btn-animated me-2" data-bs-toggle="modal" data-bs-target="#pagoModalTab">
                                        <i class="fas fa-dollar-sign me-2"></i>Proceder al Pago
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-animated me-2">
                                        <i class="fas fa-save me-2"></i>Guardar Venta
                                    </button>
                                    <button type="reset" class="btn btn-secondary btn-animated">
                                        <i class="fas fa-times me-2"></i>Cancelar
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div> </div> <footer>
            <p class="footer-text">&copy; <span id="currentYear"></span> FRANK PIURA. Todos los derechos reservados.</p>
        </footer>
    </div> <div class="modal fade" id="registroVentaModal" tabindex="-1" aria-labelledby="registroVentaModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="registroVentaModalLabel"><i class="fas fa-plus-circle me-2"></i>Registro de Nueva Venta</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h2 class="text-center">Registro de Venta</h2>
                    <hr>
                    <form action="procesarVenta" method="post" id="formNuevaVentaModal">
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="form-label" for="clienteModal">Cliente:</label>
                                <input type="text" class="form-control" id="clienteModal" name="cliente" placeholder="Nombre del cliente" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label" for="dniModal">DNI / RUC:</label>
                                <input type="text" class="form-control" id="dniModal" name="dni" placeholder="Número de identificación" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label" for="vendedorModal">Vendedor:</label>
                                <input type="text" class="form-control" id="vendedorModal" name="vendedor" value="Carlos Ramirez" readonly>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="form-label" for="fechaVentaModal">Fecha Venta:</label>
                                <input type="date" class="form-control" id="fechaVentaModal" name="fechaVenta" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label" for="tipoComprobanteModal">Tipo de Comprobante:</label>
                                <select class="form-select" id="tipoComprobanteModal" name="tipoComprobante">
                                    <option>Boleta</option>
                                    <option>Factura</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label" for="serieNumeroModal">Serie y Número:</label>
                                <input type="text" class="form-control" id="serieNumeroModal" name="serieNumero" placeholder="Ej. B001-12345" required>
                            </div>
                        </div>

                        <h4>Detalle de Repuestos</h4>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Código</th><th>Producto</th><th>Cantidad</th>
                                        <th>P. Unitario</th><th>Subtotal</th><th>Stock Disp.</th><th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaProductosModal">
                                    <tr>
                                        <td><input type="text" class="form-control form-control-sm" name="codigo[]" ></td>
                                        <td><input type="text" class="form-control form-control-sm" name="producto[]" ></td>
                                        <td><input type="number" class="form-control form-control-sm" name="cantidad[]" min="1" value="1" ></td>
                                        <td><input type="number" step="0.01" class="form-control form-control-sm" name="precio[]" ></td>
                                        <td><input type="text" class="form-control form-control-sm" name="subtotal[]" readonly></td>
                                        <td><input type="text" class="form-control form-control-sm" name="stock[]" readonly></td>
                                        <td><button type="button" class="btn btn-danger btn-sm eliminarFilaProductoModal">Eliminar</button></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-success btn-sm mt-2" id="agregarProductoModal">
                                <i class="fas fa-plus me-1"></i>Agregar Producto
                            </button>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-8"></div> <div class="col-md-4">
                                <div class="row mb-1">
                                    <label class="col-sm-5 col-form-label col-form-label-sm text-end" for="subtotalGeneralModal">Subtotal:</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control form-control-sm" name="subtotalVenta" id="subtotalGeneralModal" readonly>
                                    </div>
                                </div>
                                <div class="row mb-1">
                                    <label class="col-sm-5 col-form-label col-form-label-sm text-end" for="igvGeneralModal">IGV (18%):</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control form-control-sm" name="igvVenta" id="igvGeneralModal" readonly>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-sm-5 col-form-label col-form-label-sm text-end fw-bold" for="totalGeneralModal">Total:</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control form-control-sm fw-bold" name="totalVenta" id="totalGeneralModal" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4">
                            <label class="form-label" for="estadoPagoModal">Estado de Pago:</label>
                            <select class="form-select" id="estadoPagoModal" name="estadoPago">
                                <option value="pagado">Pagado</option>
                                <option value="pendiente">Pendiente</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-outline-secondary" form="formNuevaVentaModal">Limpiar</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary" form="formNuevaVentaModal">
                        <i class="fas fa-save me-2"></i>Guardar Venta
                    </button>
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="detalleVentaModal" tabindex="-1" aria-labelledby="detalleVentaModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title" id="detalleVentaModalLabel"><i class="fas fa-file-invoice-dollar me-2"></i>Detalle de Venta - F001-000148</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="row mb-3">
                <div class="col-md-6"><strong>Cliente:</strong> Jorge Mendoza</div>
                <div class="col-md-6"><strong>DNI/RUC:</strong> 12345678</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6"><strong>Fecha:</strong> 06/05/2025</div>
                <div class="col-md-6"><strong>Vendedor:</strong> Carlos Ramírez</div>
            </div>
            <div class="row mb-3">
                 <div class="col-md-6"><strong>Estado:</strong> <span class="badge-pagado">Pagado</span></div>
                 <div class="col-md-6"><strong>Total:</strong> S/ 450.00</div>
            </div>
            <h6 class="mt-4">Productos:</h6>
            <table class="table table-sm table-bordered">
                <thead>
                    <tr><th>Código</th><th>Producto</th><th>Cant.</th><th>P. Unit.</th><th>Subtotal</th></tr>
                </thead>
                <tbody>
                    <tr><td>REP001</td><td>Filtro de Aceite XYZ</td><td>2</td><td>S/ 75.00</td><td>S/ 150.00</td></tr>
                    <tr><td>REP005</td><td>Pastillas de Freno ABC</td><td>1</td><td>S/ 300.00</td><td>S/ 300.00</td></tr>
                </tbody>
            </table>
            <div class="receipt-preview mt-3">
                <div class="receipt-header">
                    <h5>Resumen del Comprobante</h5>
                </div>
                <p><strong>Subtotal:</strong> S/ 381.36</p>
                <p><strong>IGV (18%):</strong> S/ 68.64</p>
                <p><strong>Total Pagado:</strong> S/ 450.00</p>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cerrar</button>
            <button type="button" class="btn btn-primary"><i class="fas fa-print me-2"></i>Imprimir Comprobante</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="productoModal" tabindex="-1" aria-labelledby="productoModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header bg-info text-white">
            <h5 class="modal-title" id="productoModalLabel"><i class="fas fa-search me-2"></i>Buscar Producto (para Formulario en Pestaña)</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3"><input type="text" class="form-control" id="buscarProductoInputTab" placeholder="Buscar por código, nombre..."></div>
            <div class="table-responsive" style="max-height: 400px;">
                <table class="table table-hover table-sm">
                    <thead><tr><th>Código</th><th>Producto</th><th>Stock</th><th>Precio</th><th>Acción</th></tr></thead>
                    <tbody id="listaProductosBusquedaTab">
                        <tr class="producto-item-tab" data-codigo="REP001" data-nombre="Filtro Aceite XYZ" data-stock="25" data-precio="75.00">
                            <td>REP001</td><td>Filtro Aceite XYZ</td><td>25</td><td>S/ 75.00</td>
                            <td><button class="btn btn-sm btn-success add-product-btn-tab"><i class="fas fa-plus"></i></button></td>
                        </tr>
                         <tr class="producto-item-tab" data-codigo="REP002" data-nombre="Bujía NGK" data-stock="50" data-precio="25.50">
                            <td>REP002</td><td>Bujía NGK</td><td>50</td><td>S/ 25.50</td>
                            <td><button class="btn btn-sm btn-success add-product-btn-tab"><i class="fas fa-plus"></i></button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="pagoModalTab" tabindex="-1" aria-labelledby="pagoModalTabLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header bg-success text-white">
            <h5 class="modal-title" id="pagoModalTabLabel"><i class="fas fa-cash-register me-2"></i>Registrar Pago (Pestaña)</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h4 class="text-center mb-3">Total a Pagar: <span class="fw-bold" id="totalAPagarModalTab">S/ 0.00</span></h4>
            Detalles de pago aquí...
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-success" id="confirmarPagoBtnTab"><i class="fas fa-check-circle me-2"></i>Confirmar Pago</button>
          </div>
        </div>
      </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Sidebar toggle
        const menuToggle = document.getElementById('menu-toggle');
        const sidebar = document.getElementById('sidebar');
        if (menuToggle) {
            menuToggle.addEventListener('click', function () {
                sidebar.classList.toggle('active');
            });
        }

        // Set current year in footer
        const currentYearSpan = document.getElementById('currentYear');
        if(currentYearSpan) currentYearSpan.textContent = new Date().getFullYear();
        
        // --- START: JavaScript para el MODAL de REGISTRO DE VENTA (Formulario Original) ---
        const agregarProductoModalBtn = document.getElementById('agregarProductoModal');
        const tablaProductosModalBody = document.getElementById('tablaProductosModal');
        const formNuevaVentaModal = document.getElementById('formNuevaVentaModal');
        const fechaVentaModalInput = document.getElementById('fechaVentaModal');

        if (fechaVentaModalInput) { // Poner fecha actual en el modal
            const today = new Date();
            const yyyy = today.getFullYear();
            let mm = today.getMonth() + 1;
            let dd = today.getDate();
            if (dd < 10) dd = '0' + dd;
            if (mm < 10) mm = '0' + mm;
            fechaVentaModalInput.value = `${yyyy}-${mm}-${dd}`;
        }

        function calcularTotalesEnModal() {
            let subtotalGeneral = 0;
            if (!tablaProductosModalBody) return;
            const rows = tablaProductosModalBody.querySelectorAll('tr');
            
            rows.forEach(row => {
                const cantidadInput = row.querySelector('input[name="cantidad[]"]');
                const precioInput = row.querySelector('input[name="precio[]"]');
                const subtotalInputCelda = row.querySelector('input[name="subtotal[]"]');

                const cantidad = parseFloat(cantidadInput.value) || 0;
                const precio = parseFloat(precioInput.value) || 0;
                const subtotalProducto = cantidad * precio;
                
                if (subtotalInputCelda) subtotalInputCelda.value = subtotalProducto.toFixed(2);
                subtotalGeneral += subtotalProducto;
            });

            const igv = subtotalGeneral * 0.18;
            const total = subtotalGeneral + igv;

            const subtotalGeneralModalInput = document.getElementById('subtotalGeneralModal');
            const igvGeneralModalInput = document.getElementById('igvGeneralModal');
            const totalGeneralModalInput = document.getElementById('totalGeneralModal');

            if (subtotalGeneralModalInput) subtotalGeneralModalInput.value = subtotalGeneral.toFixed(2);
            if (igvGeneralModalInput) igvGeneralModalInput.value = igv.toFixed(2);
            if (totalGeneralModalInput) totalGeneralModalInput.value = total.toFixed(2);
        }

        function addRowEventListenersEnModal(row) {
            const cantidadInput = row.querySelector('input[name="cantidad[]"]');
            const precioInput = row.querySelector('input[name="precio[]"]');
            const deleteButton = row.querySelector('.eliminarFilaProductoModal');

            if (cantidadInput) cantidadInput.addEventListener('input', calcularTotalesEnModal);
            if (precioInput) precioInput.addEventListener('input', calcularTotalesEnModal);
            
            if (deleteButton) {
                deleteButton.addEventListener('click', function() {
                    if (tablaProductosModalBody.querySelectorAll('tr').length > 1) {
                        row.remove();
                    } else {
                        // Limpiar la única fila en lugar de eliminarla
                        row.querySelectorAll('input[type="text"], input[type="number"]').forEach(input => {
                           if(input.name !== "cantidad[]") input.value = ''; // no limpiar cantidad
                        });
                         if(cantidadInput) cantidadInput.value = '1'; // Reset quantity
                    }
                    calcularTotalesEnModal();
                });
            }
        }

        if (agregarProductoModalBtn && tablaProductosModalBody) {
            agregarProductoModalBtn.addEventListener('click', function() {
                const firstRow = tablaProductosModalBody.querySelector('tr');
                if (firstRow) {
                    const newRow = firstRow.cloneNode(true);
                    newRow.querySelectorAll('input').forEach(input => {
                        if(input.name !== "cantidad[]") input.value = '';
                        else input.value = '1';
                    });
                    tablaProductosModalBody.appendChild(newRow);
                    addRowEventListenersEnModal(newRow);
                    newRow.querySelector('input[name="codigo[]"]').focus();
                } 
            });
            // Añadir listeners a la(s) fila(s) inicial(es) del modal
            tablaProductosModalBody.querySelectorAll('tr').forEach(row => addRowEventListenersEnModal(row));
            if (tablaProductosModalBody.querySelectorAll('tr').length > 0) {
                 calcularTotalesEnModal(); // Calcular totales para la fila inicial
            }
        }

        if (formNuevaVentaModal) {
            formNuevaVentaModal.addEventListener('submit', function(event) {
                event.preventDefault();
                console.log("Enviando formulario del modal...");
                // Aquí tu lógica de envío AJAX
                alert('Venta Registrada desde Modal (Simulación)!');
                
                var modalBootstrapInstance = bootstrap.Modal.getInstance(document.getElementById('registroVentaModal'));
                if(modalBootstrapInstance) modalBootstrapInstance.hide();
                
                this.reset(); // Limpia el formulario
                 if (fechaVentaModalInput) { // Poner fecha actual de nuevo
                    const today = new Date();
                    const yyyy = today.getFullYear();
                    let mm = today.getMonth() + 1; let dd = today.getDate();
                    if (dd < 10) dd = '0' + dd; if (mm < 10) mm = '0' + mm;
                    fechaVentaModalInput.value = `${yyyy}-${mm}-${dd}`;
                }
                // Restablecer la tabla de productos en el modal a una sola fila vacía
                if(tablaProductosModalBody) {
                    tablaProductosModalBody.innerHTML = `
                        <tr>
                            <td><input type="text" class="form-control form-control-sm" name="codigo[]" ></td>
                            <td><input type="text" class="form-control form-control-sm" name="producto[]" ></td>
                            <td><input type="number" class="form-control form-control-sm" name="cantidad[]" min="1" value="1" ></td>
                            <td><input type="number" step="0.01" class="form-control form-control-sm" name="precio[]" ></td>
                            <td><input type="text" class="form-control form-control-sm" name="subtotal[]" readonly></td>
                            <td><input type="text" class="form-control form-control-sm" name="stock[]" readonly></td>
                            <td><button type="button" class="btn btn-danger btn-sm eliminarFilaProductoModal">Eliminar</button></td>
                        </tr>`;
                    // Re-attach listeners to the new single row
                    tablaProductosModalBody.querySelectorAll('tr').forEach(row => addRowEventListenersEnModal(row));
                }
                calcularTotalesEnModal(); // recalcular, debería ser 0
            });
             formNuevaVentaModal.addEventListener('reset', function() {
                 if (fechaVentaModalInput) { 
                    setTimeout(() => { // Timeout para asegurar que el reset se complete
                        const today = new Date();
                        const yyyy = today.getFullYear();
                        let mm = today.getMonth() + 1; let dd = today.getDate();
                        if (dd < 10) dd = '0' + dd; if (mm < 10) mm = '0' + mm;
                        fechaVentaModalInput.value = `${yyyy}-${mm}-${dd}`;
                    },0);
                }
                if(tablaProductosModalBody) { // Reset table to one clean row on form reset
                     tablaProductosModalBody.innerHTML = `
                        <tr>
                            <td><input type="text" class="form-control form-control-sm" name="codigo[]" ></td>
                            <td><input type="text" class="form-control form-control-sm" name="producto[]" ></td>
                            <td><input type="number" class="form-control form-control-sm" name="cantidad[]" min="1" value="1" ></td>
                            <td><input type="number" step="0.01" class="form-control form-control-sm" name="precio[]" ></td>
                            <td><input type="text" class="form-control form-control-sm" name="subtotal[]" readonly></td>
                            <td><input type="text" class="form-control form-control-sm" name="stock[]" readonly></td>
                            <td><button type="button" class="btn btn-danger btn-sm eliminarFilaProductoModal">Eliminar</button></td>
                        </tr>`;
                    tablaProductosModalBody.querySelectorAll('tr').forEach(row => addRowEventListenersEnModal(row));
                }
                calcularTotalesEnModal();
            });
        }
         // --- END: JavaScript para el MODAL de REGISTRO DE VENTA ---


        // --- START: JavaScript para el FORMULARIO EN PESTAÑA (Alternativo) ---
        const fechaVentaInputTab = document.getElementById('fechaVentaTab');
        if(fechaVentaInputTab) {
            const today = new Date();
            const yyyy = today.getFullYear(); let mm = today.getMonth() + 1; let dd = today.getDate();
            if (dd < 10) dd = '0' + dd; if (mm < 10) mm = '0' + mm;
            fechaVentaInputTab.value = `${yyyy}-${mm}-${dd}`;
        }

        const tablaProductosVentaEnTab = document.getElementById('tablaProductosVentaEnTab');
        const subtotalVentaInputTab = document.getElementById('subtotalVentaTab');
        const igvVentaInputTab = document.getElementById('igvVentaTab');
        const totalVentaInputTab = document.getElementById('totalVentaTab');
        const IGV_RATE_TAB = 0.18;
        let productosEnVentaTab = [];

        function actualizarTotalesTab() {
            let subtotalGeneral = 0;
            productosEnVentaTab.forEach(p => { subtotalGeneral += p.subtotal; });
            const igvGeneral = subtotalGeneral * IGV_RATE_TAB;
            const totalGeneral = subtotalGeneral + igvGeneral;

            if(subtotalVentaInputTab) subtotalVentaInputTab.value = `S/ ${subtotalGeneral.toFixed(2)}`;
            if(igvVentaInputTab) igvVentaInputTab.value = `S/ ${igvGeneral.toFixed(2)}`;
            if(totalVentaInputTab) totalVentaInputTab.value = `S/ ${totalGeneral.toFixed(2)}`;
            
            const totalAPagarModalTab = document.getElementById('totalAPagarModalTab');
            if (totalAPagarModalTab) totalAPagarModalTab.textContent = `S/ ${totalGeneral.toFixed(2)}`;
        }

        function renderizarProductosEnVentaTab() {
            if (!tablaProductosVentaEnTab) return;
            tablaProductosVentaEnTab.innerHTML = ''; 
            if (productosEnVentaTab.length === 0) {
                tablaProductosVentaEnTab.innerHTML = '<tr><td colspan="7" class="text-center text-muted">Agregue productos a la venta.</td></tr>';
                actualizarTotalesTab(); return;
            }
            productosEnVentaTab.forEach((producto, index) => {
                const row = tablaProductosVentaEnTab.insertRow();
                row.innerHTML = `
                    <td><input type="text" class="form-control form-control-sm" value="${producto.codigo}" readonly name="detalle[${index}][codigo]"></td>
                    <td><input type="text" class="form-control form-control-sm" value="${producto.nombre}" readonly name="detalle[${index}][nombre]"></td>
                    <td><input type="number" class="form-control form-control-sm cantidad-producto-tab" value="${producto.cantidad}" min="1" max="${producto.stock}" data-index="${index}" name="detalle[${index}][cantidad]"></td>
                    <td><input type="text" class="form-control form-control-sm precio-producto-tab" value="${producto.precio.toFixed(2)}" data-index="${index}" name="detalle[${index}][precio]"></td>
                    <td><input type="text" class="form-control form-control-sm" value="${producto.subtotal.toFixed(2)}" readonly name="detalle[${index}][subtotal]"></td>
                    <td><input type="text" class="form-control form-control-sm" value="${producto.stock}" readonly></td>
                    <td><button type="button" class="btn btn-danger btn-sm eliminar-producto-btn-tab" data-index="${index}"><i class="fas fa-trash-alt"></i></button></td>
                `;
            });
            actualizarTotalesTab();
            addEventListenersToProductRowsTab();
        }
        
        function addEventListenersToProductRowsTab() {
            document.querySelectorAll('.cantidad-producto-tab').forEach(input => {
                input.addEventListener('change', function() {
                    const index = this.dataset.index; let nuevaCantidad = parseInt(this.value);
                    const producto = productosEnVentaTab[index];
                    if (nuevaCantidad > producto.stock) { alert(`Stock insuficiente. Máximo ${producto.stock}`); this.value = producto.stock; nuevaCantidad = producto.stock; }
                    if (nuevaCantidad < 1) { this.value = 1; nuevaCantidad = 1;}
                    producto.cantidad = nuevaCantidad; producto.subtotal = producto.cantidad * producto.precio;
                    renderizarProductosEnVentaTab();
                });
            });
            document.querySelectorAll('.precio-producto-tab').forEach(input => {
                input.addEventListener('change', function() {
                    const index = this.dataset.index; const nuevoPrecio = parseFloat(this.value);
                    const producto = productosEnVentaTab[index];
                    if (nuevoPrecio < 0) { alert('El precio no puede ser negativo.'); this.value = producto.precio.toFixed(2); return; }
                    producto.precio = nuevoPrecio; producto.subtotal = producto.cantidad * producto.precio;
                    renderizarProductosEnVentaTab();
                });
            });
            document.querySelectorAll('.eliminar-producto-btn-tab').forEach(button => {
                button.addEventListener('click', function() {
                    productosEnVentaTab.splice(this.dataset.index, 1);
                    renderizarProductosEnVentaTab();
                });
            });
        }

        const listaProductosBusquedaTab = document.getElementById('listaProductosBusquedaTab');
        if (listaProductosBusquedaTab) {
            listaProductosBusquedaTab.addEventListener('click', function(e) {
                if (e.target.classList.contains('add-product-btn-tab') || e.target.closest('.add-product-btn-tab')) {
                    const itemRow = e.target.closest('.producto-item-tab');
                    const codigo = itemRow.dataset.codigo;
                    if (productosEnVentaTab.find(p => p.codigo === codigo)) { alert('Este producto ya ha sido agregado.'); return; }
                    productosEnVentaTab.push({
                        codigo: codigo, nombre: itemRow.dataset.nombre, cantidad: 1,
                        precio: parseFloat(itemRow.dataset.precio), subtotal: parseFloat(itemRow.dataset.precio),
                        stock: parseInt(itemRow.dataset.stock)
                    });
                    renderizarProductosEnVentaTab();
                }
            });
        }
        
        const buscarProductoInputTab = document.getElementById('buscarProductoInputTab');
        if(buscarProductoInputTab && listaProductosBusquedaTab){
            buscarProductoInputTab.addEventListener('keyup', function(){
                const filter = this.value.toLowerCase();
                const rows = listaProductosBusquedaTab.getElementsByTagName('tr');
                for(let i=0; i < rows.length; i++){
                    let cells = rows[i].getElementsByTagName('td'); let match = false;
                    for(let j=0; j < cells.length -1; j++){
                        if(cells[j].textContent.toLowerCase().includes(filter)){ match = true; break; }
                    }
                    rows[i].style.display = match ? '' : 'none';
                }
            });
        }

        const formNuevaVentaEnTab = document.getElementById('formNuevaVentaEnTab');
        if (formNuevaVentaEnTab) {
            formNuevaVentaEnTab.addEventListener('submit', function(e) {
                e.preventDefault();
                if (productosEnVentaTab.length === 0) { alert('Debe agregar al menos un producto.'); return; }
                console.log("Guardando Venta desde Tab...");
                alert('Venta guardada desde Tab (simulación).');
                productosEnVentaTab = []; renderizarProductosEnVentaTab(); formNuevaVentaEnTab.reset();
                if(fechaVentaInputTab) fechaVentaInputTab.value = new Date().toISOString().split('T')[0];
            });
            formNuevaVentaEnTab.addEventListener('reset', function() {
                productosEnVentaTab = []; renderizarProductosEnVentaTab();
                if(fechaVentaInputTab) setTimeout(() => fechaVentaInputTab.value = new Date().toISOString().split('T')[0], 0);
            });
        }
        renderizarProductosEnVentaTab(); // Render inicial para el form en tab
        // --- END: JavaScript para el FORMULARIO EN PESTAÑA ---

    }); // End DOMContentLoaded
    </script>
</body>
</html>