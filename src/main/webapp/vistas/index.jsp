<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FRANK Piura - Dashboard</title>
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
        
        .page-title {
            margin-bottom: 30px;
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
        
        .module-card {
            border-radius: 15px;
            overflow: hidden;
            border: none;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.05);
            height: 100%;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .module-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            background-color: var(--card-hover);
        }
        
        .module-header {
            position: relative;
            padding: 25px 20px;
            text-align: center;
            overflow: hidden;
        }
        
        .module-icon {
            font-size: 50px;
            margin-bottom: 15px;
            color: var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .module-card:hover .module-icon {
            transform: scale(1.2);
        }
        
        .module-title {
            color: var(--secondary-color);
            font-weight: 700;
            font-size: 22px;
            margin-bottom: 5px;
        }
        
        .module-description {
            color: #6c757d;
            min-height: 50px;
        }
        
        .module-body {
            padding: 20px;
            border-top: 1px solid rgba(0,0,0,0.05);
            background-color: #fff;
        }
        
        .module-stat {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 8px 0;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 14px;
        }
        
        .stat-value {
            font-weight: 600;
            color: var(--secondary-color);
        }
        
        .module-action {
            display: block;
            width: 100%;
            border: none;
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 12px 0;
            border-radius: 8px;
            margin-top: 15px;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
        }
        
        .module-action:hover {
            background-color: #c1121f;
            color: #fff;
            box-shadow: 0 5px 15px rgba(230, 57, 70, 0.3);
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
            display: none;
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
        
        /* Dashboard Stats */
        .quick-stats {
            margin-bottom: 30px;
        }
        
        .stat-card {
            background-color: #fff;
            border-radius: 12px;
            padding: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            height: 100%;
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            font-size: 24px;
        }
        
        .sales-icon {
            background-color: rgba(230, 57, 70, 0.1);
            color: var(--primary-color);
        }
        
        .orders-icon {
            background-color: rgba(29, 53, 87, 0.1);
            color: var(--secondary-color);
        }
        
        .returns-icon {
            background-color: rgba(241, 250, 238, 0.3);
            color: #2a9d8f;
        }
        
        .customers-icon {
            background-color: rgba(69, 123, 157, 0.1);
            color: var(--light-blue);
        }
        
        .stat-info {
            flex: 1;
        }
        
        .stat-number {
            font-size: 24px;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 5px;
            line-height: 1;
        }
        
        .stat-text {
            color: #6c757d;
            font-size: 14px;
            margin: 0;
        }
        
        .trend {
            font-size: 13px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .trend-up {
            color: #2a9d8f;
        }
        
        .trend-down {
            color: var(--primary-color);
        }
        
        /* Recent Activity */
        .activity-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .activity-item {
            padding: 15px 0;
            border-bottom: 1px solid #e1e5eb;
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }
        
        .activity-content {
            flex: 1;
        }
        
        .activity-title {
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 3px;
        }
        
        .activity-time {
            color: #6c757d;
            font-size: 12px;
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
            
            .content-wrapper.active {
                margin-left: 250px;
                width: calc(100% - 250px);
            }
            
            .menu-toggle {
                display: block;
            }
        }
        
        @media (max-width: 768px) {
            .content-wrapper.active {
                margin-left: 0;
                width: 100%;
            }
            
            .sidebar.active {
                width: 100%;
            }
        }

        /* Animation for the waves */
        @keyframes wave {
            0% {
                transform: translateX(0) translateZ(0) scaleY(1);
            }
            50% {
                transform: translateX(-25%) translateZ(0) scaleY(0.8);
            }
            100% {
                transform: translateX(-50%) translateZ(0) scaleY(1);
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
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
                    <a class="nav-link active" href="index.jsp">
                        <i class="fas fa-home"></i> Inicio
                    </a>
                </li>
                <li class="nav-item">
                </li>
            </ul>
            
            <div class="menu-label">MÓDULOS</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="vistas/ventas.jsp">
                        <i class="fas fa-shopping-cart"></i> Ventas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="vistas/pedidos.jsp">
                        <i class="fas fa-box"></i> Pedidos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="vistas/devoluciones.jsp">
                        <i class="fas fa-exchange-alt"></i> Devoluciones
                    </a>
                </li>
            </ul>
            
            <div class="menu-label">SISTEMA</div>
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="ayuda.jsp">
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
    
    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Top Navbar -->
        <div class="top-navbar">
            <div class="d-flex align-items-center">
                <div class="menu-toggle me-3">
                    <i class="fas fa-bars"></i>
                </div>
                <div class="search-box d-none d-md-block">
                    <i class="fas fa-search"></i>
                    <input type="text" class="form-control" placeholder="Buscar repuestos, clientes...">
                </div>
            </div>
            
            <div class="user-menu">
                <div class="notification">
                    <i class="fas fa-bell"></i>
                    <span class="notification-count">3</span>
                </div>
                
                <div class="user-info">
                    <div class="avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="user-details d-none d-md-flex">
                        <span class="user-name">Admin</span>
                        <span class="user-role">Administrador</span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <div class="page-title">
                <h2>Panel de Control</h2>
                <p class="text-muted">Bienvenido al sistema de gestión de Repuestos FRANK Piura</p>
            </div>
            
            <!-- Quick Stats -->
            <div class="row quick-stats">
                <div class="col-md-3 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon sales-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-number">128</h3>
                            <p class="stat-text">Ventas este mes</p>
                            <div class="trend trend-up">
                                <i class="fas fa-arrow-up"></i> 12.5%
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon orders-icon">
                            <i class="fas fa-box"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-number">34</h3>
                            <p class="stat-text">Pedidos pendientes</p>
                            <div class="trend trend-up">
                                <i class="fas fa-arrow-up"></i> 5.3%
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon returns-icon">
                            <i class="fas fa-exchange-alt"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-number">8</h3>
                            <p class="stat-text">Devoluciones activas</p>
                            <div class="trend trend-down">
                                <i class="fas fa-arrow-down"></i> 3.8%
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 mb-4">
                    <div class="stat-card">
                        <div class="stat-icon customers-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3 class="stat-number">456</h3>
                            <p class="stat-text">Clientes totales</p>
                            <div class="trend trend-up">
                                <i class="fas fa-arrow-up"></i> 8.2%
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Main Modules Cards -->
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="module-card">
                        <div class="module-header">
                            <i class="fas fa-shopping-cart module-icon"></i>
                            <h3 class="module-title">Gestión de Ventas</h3>
                            <p class="module-description">Control de ventas directas y emisión de comprobantes</p>
                        </div>
                        <div class="module-body">
                            <div class="module-stat">
                                <span class="stat-label">Hoy</span>
                                <span class="stat-value">12 ventas</span>
                            </div>
                            <div class="module-stat">
                                <span class="stat-label">Este mes</span>
                                <span class="stat-value">128 ventas</span>
                            </div>
                            <a href="${pageContext.request.contextPath}/nuevaVenta" class="module-action">
                                <i class="fas fa-arrow-right me-2"></i> Acceder al módulo
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="module-card">
                        <div class="module-header">
                            <i class="fas fa-box module-icon"></i>
                            <h3 class="module-title">Gestión de Pedidos</h3>
                            <p class="module-description">Control y seguimiento de pedidos especiales</p>
                        </div>
                        <div class="module-body">
                            <div class="module-stat">
                                <span class="stat-label">Pendientes</span>
                                <span class="stat-value">34 pedidos</span>
                            </div>
                            <div class="module-stat">
                                <span class="stat-label">En tránsito</span>
                                <span class="stat-value">18 pedidos</span>
                            </div>
                            <a href="vistas/pedidos.jsp" class="module-action">
                                <i class="fas fa-arrow-right me-2"></i> Acceder al módulo
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <div class="module-card">
                        <div class="module-header">
                            <i class="fas fa-exchange-alt module-icon"></i>
                            <h3 class="module-title">Gestión de Devoluciones</h3>
                            <p class="module-description">Control de devoluciones y reembolsos</p>
                        </div>
                        <div class="module-body">
                            <div class="module-stat">
                                <span class="stat-label">En proceso</span>
                                <span class="stat-value">8 devoluciones</span>
                            </div>
                            <div class="module-stat">
                                <span class="stat-label">Este mes</span>
                                <span class="stat-value">15 devoluciones</span>
                            </div>
                            <a href="vistas/devoluciones.jsp" class="module-action">
                                <i class="fas fa-arrow-right me-2"></i> Acceder al módulo
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Recent Activity and Quick Links -->
            <div class="row">
                <div class="col-lg-8 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Actividad Reciente</h5>
                        </div>
                        <div class="card-body p-0">
                            <ul class="activity-list">
                                <li class="activity-item">
                                    <div class="activity-icon" style="background-color: rgba(230, 57, 70, 0.1); color: var(--primary-color);">
                                        <i class="fas fa-shopping-cart"></i>
                                    </div>
                                    <div class="activity-content">
                                        <h6 class="activity-title">Nueva venta registrada</h6>
                                        <p class="mb-0">Factura #F0053 - Cliente: Jorge Mendoza</p>
                                        <span class="activity-time">Hace 15 minutos</span>
                                    </div>
                                </li>
                                <li class="activity-item">
                                    <div class="activity-icon" style="background-color: rgba(29, 53, 87, 0.1); color: var(--secondary-color);">
                                        <i class="fas fa-box"></i>
                                    </div>
                                    <div class="activity-content">
                                        <h6 class="activity-title">Pedido especial recibido</h6>
                                        <p class="mb-0">Pedido #P0028 - Cliente: María López</p>
                                        <span class="activity-time">Hace 2 horas</span>
                                    </div>
                                </li>
                                <li class="activity-item">
                                    <div class="activity-icon" style="background-color: rgba(69, 123, 157, 0.1); color: var(--light-blue);">
                                        <i class="fas fa-truck"></i>
                                    </div>
                                    <div class="activity-content">
                                        <h6 class="activity-title">Orden de compra enviada</h6>
                                        <p class="mb-0">Orden #OC0015 - Proveedor: AutoPartes Express</p>
                                        <span class="activity-time">Hace 3 horas</span>
                                    </div>
                                </li>
                                <li class="activity-item">
                                    <div class="activity-icon" style="background-color: rgba(241, 250, 238, 0.3); color: #2a9d8f;">
                                        <i class="fas fa-exchange-alt"></i>
                                    </div>
                                    <div class="activity-content">
                                        <h6 class="activity-title">Devolución procesada</h6>
                                        <p class="mb-0">Devolución #D0007 - Cliente: Carlos Ramírez</p>
                                        <span class="activity-time">Hoy, 10:30 AM</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="card-footer bg-white">
                            <a href="#" class="text-decoration-none" style="color: var(--primary-color);">Ver todas las actividades</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 mb-4">
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Acciones Rápidas</h5>
                        </div>
                        <div class="card-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                    <i class="fas fa-clipboard-list me-3 text-success"></i>
                                    <span>Crear pedido especial</span>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                    <i class="fas fa-sync-alt me-3 text-warning"></i>
                                    <span>Gestionar devolución</span>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action d-flex align-items-center">
                                    <i class="fas fa-search me-3 text-info"></i>
                                    <span>Buscar inventario</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card shadow-sm">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Inventario Bajo</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="list-group list-group-flush">
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Filtro de aceite</span>
                                    <span class="badge bg-danger rounded-pill">3 unidades</span>
                                </div>
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Pastillas de freno</span>
                                    <span class="badge bg-danger rounded-pill">2 unidades</span>
                                </div>
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Amortiguador delantero</span>
                                    <span class="badge bg-warning rounded-pill">5 unidades</span>
                                </div>
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                    <span>Bujías NGK</span>
                                    <span class="badge bg-warning rounded-pill">7 unidades</span>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-white">
                            <a href="#" class="text-decoration-none" style="color: var(--primary-color);">Ver todo el inventario</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <footer>
            <p class="footer-text">© 2025 Repuestos y Representaciones FRANK Piura</p>
            <p class="footer-text small">Copyright © 2025-2026</p>
        </footer>
    </div>
    
    
    
    
    <!-- Bootstrap and Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle sidebar on mobile
        document.querySelector('.menu-toggle').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('active');
            document.querySelector('.content-wrapper').classList.toggle('active');
        });
        
        // Auto close sidebar on small screens when clicking outside
        document.addEventListener('click', function(event) {
            const sidebar = document.querySelector('.sidebar');
            const menuToggle = document.querySelector('.menu-toggle');
            
            if (window.innerWidth < 992 && 
                sidebar.classList.contains('active') && 
                !sidebar.contains(event.target) && 
                !menuToggle.contains(event.target)) {
                sidebar.classList.remove('active');
                document.querySelector('.content-wrapper').classList.remove('active');
            }
        });
    </script>
</body>
</html>