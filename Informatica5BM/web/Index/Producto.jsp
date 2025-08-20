<%-- 
    Document   : producto
    Created on : 19/08/2025, 11:10:00
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supermercado - Gestión de Productos</title>
    <link rel="icon" type="image/x-icon" href="Images/logosupermercado.png">
    <link rel="stylesheet" href="Styles/estilo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="SupermercadoControlador?menu=Principal">
                <i class="fas fa-store"></i> Supermercado
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="SupermercadoControlador?menu=Proveedor&accion=Listar">
                            <i class="fas fa-truck"></i> Proveedores
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <div class="header-section">
            <h2><i class="fas fa-boxes"></i> Gestión de Productos</h2>
        </div>

        <div class="left-side">
            <!-- Búsqueda -->
            <div class="search-panel">
                <h4><i class="fas fa-search"></i> Buscar Producto</h4>
                <form action="SupermercadoControlador?menu=Producto&accion=Buscar" method="post">
                    <div class="input-group">
                        <input type="text" name="txtBuscarId" class="form-control" placeholder="Buscar por ID">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Buscar</button>
                    </div>
                </form>
            </div>

            <!-- Formulario agregar -->
            <div class="form-panel">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle"></i> Agregar Producto
                    </div>
                    <div class="card-body">
                        <form action="SupermercadoControlador?menu=Producto&accion=Agregar" method="post">
                            <div class="mb-3">
                                <label for="txtNombreProducto" class="form-label">Nombre</label>
                                <input type="text" name="txtNombreProducto" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtPrecioProducto" class="form-label">Precio</label>
                                <input type="number" step="0.01" name="txtPrecioProducto" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtStockProducto" class="form-label">Stock</label>
                                <input type="number" name="txtStockProducto" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtIdProveedor" class="form-label">ID Proveedor</label>
                                <input type="number" name="txtIdProveedor" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtTipoProducto" class="form-label">Tipo Producto</label>
                                <input type="text" name="txtTipoProducto" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-success w-100"><i class="fas fa-plus"></i> Agregar</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Formulario editar -->
            <div class="form-panel">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-edit"></i> Editar Producto
                    </div>
                    <div class="card-body">
                        <form action="SupermercadoControlador?menu=Producto&accion=Actualizar" method="post">
                            <div class="mb-3">
                                <label for="txtIdProducto" class="form-label">ID</label>
                                <input type="number" name="txtIdProducto" class="form-control" value="${producto.idProducto}" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="txtNombreProducto" class="form-label">Nombre</label>
                                <input type="text" name="txtNombreProducto" class="form-control" value="${producto.nombreProducto}" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtPrecioProducto" class="form-label">Precio</label>
                                <input type="number" step="0.01" name="txtPrecioProducto" class="form-control" value="${producto.precioProducto}" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtStockProducto" class="form-label">Stock</label>
                                <input type="number" name="txtStockProducto" class="form-control" value="${producto.stockProducto}" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtIdProveedor" class="form-label">ID Proveedor</label>
                                <input type="number" name="txtIdProveedor" class="form-control" value="${producto.idProveedor}" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtTipoProducto" class="form-label">Tipo Producto</label>
                                <input type="text" name="txtTipoProducto" class="form-control" value="${producto.tipoProducto}" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Actualizar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="right-side">
            <!-- Tabla -->
            <div class="table-panel">
                <h4><i class="fas fa-list"></i> Lista de Productos</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>ID Proveedor</th>
                                <th>Tipo Producto</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="producto" items="${productos}">
                                <tr>
                                    <td>${producto.idProducto}</td>
                                    <td>${producto.nombreProducto}</td>
                                    <td>$${producto.precioProducto}</td>
                                    <td>${producto.stockProducto}</td>
                                    <td>${producto.idProveedor}</td>
                                    <td>${producto.tipoProducto}</td>
                                    <td>
                                        <a href="SupermercadoControlador?menu=Producto&accion=Editar&id=${producto.idProducto}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Editar</a>
                                        <a href="SupermercadoControlador?menu=Producto&accion=Eliminar&id=${producto.idProducto}" class="btn btn-danger btn-sm" onclick="return confirm('¿Está seguro de eliminar este producto?')"><i class="fas fa-trash"></i> Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>