<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frank Piura - Sistema de Gestión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #e63946;
            --secondary-color: #1d3557;
            --accent-color: #f1faee;
            --bg-gradient: linear-gradient(135deg, #1d3557, #457b9d);
        }
        
        body {
            background: var(--bg-gradient);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
        }
        
        .content-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 0;
        }
        
        .login-container {
            width: 100%;
            max-width: 1000px;
            display: flex;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }
        
        .branding-section {
            flex: 1;
            background-color: var(--secondary-color);
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
            color: white;
        }
        
        .logo-container {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo-text {
            font-size: 2.5rem;
            font-weight: 800;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .logo-tag {
            font-size: 1.2rem;
            color: var(--accent-color);
        }
        
        .form-section {
            flex: 1;
            background-color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .animated-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            opacity: 0.15;
        }
        
        .animated-bg::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background-image: conic-gradient(
                var(--primary-color),
                transparent 30%,
                transparent 40%,
                var(--accent-color),
                transparent 60%,
                transparent 70%,
                var(--primary-color)
            );
            animation: rotate 20s linear infinite;
        }
        
        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
        
        .form-title {
            color: var(--secondary-color);
            margin-bottom: 30px;
            font-weight: 700;
        }
        
        .input-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .input-group input {
            height: 55px;
            padding-left: 45px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        
        .input-group input:focus {
            box-shadow: none;
            border-color: var(--primary-color);
        }
        
        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            font-size: 18px;
            z-index: 10;
        }
        
        .login-btn {
            background-color: var(--primary-color);
            border: none;
            height: 55px;
            border-radius: 10px;
            font-weight: 600;
            font-size: 18px;
            transition: all 0.3s ease;
            margin-top: 15px;
        }
        
        .login-btn:hover {
            background-color: #c1121f;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(230, 57, 70, 0.3);
        }
        
        .features-list {
            margin-top: 20px;
            position: relative;
            z-index: 1;
        }
        
        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .feature-icon {
            background-color: rgba(241, 250, 238, 0.2);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .car-animation {
            position: absolute;
            bottom: 30px;
            left: -100px;
            animation: driveCar 15s linear infinite;
            z-index: 1;
        }
        
        @keyframes driveCar {
            from {
                left: -100px;
            }
            to {
                left: 120%;
            }
        }
        
        .error-message {
            background-color: rgba(230, 57, 70, 0.1);
            color: var(--primary-color);
            border-left: 4px solid var(--primary-color);
            padding: 12px 15px;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        
        .error-message i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        footer {
            background-color: var(--secondary-color);
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: auto;
        }
        
        /* Responsive adjustments */
        @media (max-width: 992px) {
            .login-container {
                flex-direction: column;
                max-width: 500px;
            }
            
            .branding-section {
                padding: 30px;
            }
            
            .features-list {
                display: none;
            }
            
            .car-animation {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="content-wrapper">
        <div class="container">
            <div class="login-container">
                <div class="branding-section">
                    <div class="animated-bg"></div>
                    <div class="logo-container">
                        <i class="fas fa-cogs fa-3x mb-3" style="color: var(--primary-color);"></i>
                        <h1 class="logo-text">FRANK</h1>
                        <p class="logo-tag">Repuestos y Representaciones</p>
                    </div>
                    
                    <div class="features-list">
                        <div class="feature-item">
                            <div class="feature-icon">
                                <i class="fas fa-shopping-cart"></i>
                            </div>
                            <span>Gestión de ventas directas</span>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">
                                <i class="fas fa-box"></i>
                            </div>
                            <span>Pedidos especiales</span>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">
                                <i class="fas fa-exchange-alt"></i>
                            </div>
                            <span>Devoluciones y reembolsos</span>
                        </div>
                    </div>
                    
                    <div class="car-animation">
                        <i class="fas fa-car-side fa-2x" style="color: var(--accent-color);"></i>
                    </div>
                </div>
                
                <div class="form-section">
                    <h2 class="form-title text-center">Sistema de Gestión</h2>
                    <p class="text-center text-muted mb-4">Ingrese sus credenciales para continuar</p>
                    
                    <form action="controlador" method="post">
                        <div class="input-group">
                            <i class="fas fa-envelope"></i>
                            <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo electrónico" required>
                        </div>
                        
                        <div class="input-group">
                            <i class="fas fa-lock"></i>
                            <input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" required>
                        </div>
                        
                        <button type="submit" class="btn login-btn btn-primary w-100">
                            <i class="fas fa-sign-in-alt me-2"></i>Iniciar Sesión
                        </button>
                    </form>
                    
                    <% if (request.getParameter("error") != null) { %>
                    <div class="error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>Credenciales incorrectas. Por favor, inténtelo nuevamente.</span>
                    </div>
                    <% } %>
                    
                    <div class="text-center mt-4">
                        <p class="text-muted mb-0">¿Problemas para acceder?</p>
                        <a href="#" class="text-decoration-none" style="color: var(--primary-color);">Contactar a soporte</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="container">
            <p class="mb-0">© 2025 Repuestos y Representaciones FRANK Piura</p>
            <p class="mb-0 small">Copyright © 2025-2026</p>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


