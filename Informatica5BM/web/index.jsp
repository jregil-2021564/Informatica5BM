<%-- 
    Document   : index
    Created on : 19/08/2025, 10:51:00
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supermercado Regil - Inicio</title>
    <link rel="icon" type="image/x-icon" href="Images/logosupermercado.png">
    <link rel="stylesheet" href="Styles/Styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <!-- Header -->
    <header class="main-header">
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="Images/logosupermercado.png" alt="Logo Supermercado Regil" class="logo">
                    <span>Supermercado Regil</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Proveedores</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Carrusel -->
    <div id="carouselExampleAutoplaying" class="carousel slide main-carousel" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Images/carne.jpeg" class="d-block w-100" alt="Oferta 1">
                <div class="carousel-caption">
                    <h2>Carne Fresca</h2>
                    <p>Disfruta de nuestra carne fresca con descuentos especiales</p>
                    <a href="#" class="btn-carousel">Ver Oferta</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="Images/frutas.jpeg" class="d-block w-100" alt="Oferta 2">
                <div class="carousel-caption">
                    <h2>Fruta Fresca</h2>
                    <p>La mejor Fruta con increíbles precios esta semana</p>
                    <a href="#" class="btn-carousel">Comprar Ahora</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="Images/gaseosa.jpeg" class="d-block w-100" alt="Oferta 3">
                <div class="carousel-caption">
                    <h2>Gaseosas Nacionales</h2>
                    <p>Productos Nacionales con hasta 30% de descuento</p>
                    <a href="#" class="btn-carousel">Aprovechar</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Dashboards -->
    <section class="dashboard-section">
        <div class="container">
            <h2 class="section-title">Bienvenido a Nuestro Supermercado</h2>
            <p class="section-subtitle">Explora nuestros productos y categorías</p>
            <div class="dashboard-container">
                <a href="SupermercadoControlador?menu=Producto&accion=Listar" class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <h3>Productos</h3>
                    <p>Gestiona los productos del supermercado</p>
                    <div class="card-hover-effect"></div>
                </a>
                <a href="SupermercadoControlador?menu=Proveedor&accion=Listar" class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-tags"></i>
                    </div>
                    <h3>Proveedores</h3>
                    <p>Explora nuestro Proveedores</p>
                    <div class="card-hover-effect"></div>
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <img src="Images/logosupermercado.png" alt="Logo Supermercado Regil" class="footer-logo">
                    <p>Tu supermercado de confianza con los mejores precios y la más amplia variedad de productos frescos y de calidad.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <h5>Contacto</h5>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt"></i> Av. Principal #123, Ciudad</p>
                        <p><i class="fas fa-phone"></i> (123) 456-7890</p>
                        <p><i class="fas fa-envelope"></i> info@superregil.com</p>
                        <p><i class="fas fa-clock"></i> Lunes a Sábado: 8:00 AM - 10:00 PM<br>Domingo: 8:00 AM - 8:00 PM</p>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4">
                    <h5>Enlaces Rápidos</h5>
                    <ul>
                        <li><a href="#">Inicio</a></li>
                        <li><a href="#">Productos</a></li>
                        <li><a href="#">Proveedores</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2023 Supermercado Regil. Todos los derechos reservados.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>