package Controlador;

import modelo.Producto;
import modelo.ProductoDAO;
import modelo.Proveedor;
import modelo.ProveedorDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SupermercadoControlador", urlPatterns = {"/SupermercadoControlador"})
public class Controlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        ProductoDAO productoDAO = new ProductoDAO();
        ProveedorDAO proveedorDAO = new ProveedorDAO();

        if (menu.equals("Principal")) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        } else if (menu.equals("Producto")) {
            switch (accion) {
                case "Listar":
                    List<Producto> listaProductos = productoDAO.listar();
                    request.setAttribute("productos", listaProductos);
                    break;
                case "Buscar":
                    String idProductoStr = request.getParameter("txtBuscarId");
                    List<Producto> listaProductosB = new ArrayList<>();
                    if (idProductoStr != null && !idProductoStr.trim().isEmpty()) {
                        try {
                            int idProducto = Integer.parseInt(idProductoStr);
                            Producto productoEncontrado = productoDAO.buscar(idProducto);
                            if (productoEncontrado.getIdProducto() != 0) {
                                listaProductosB.add(productoEncontrado);
                            } else {
                                request.setAttribute("error", "Producto no encontrado");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de producto inválido");
                        }
                    } else {
                        listaProductosB = productoDAO.listar();
                    }
                    request.setAttribute("productos", listaProductosB);
                    request.getRequestDispatcher("/Index/Producto.jsp").forward(request, response);
                    return;
                case "Agregar":
                    String nombreProducto = request.getParameter("txtNombreProducto");
                    String precioProductoStr = request.getParameter("txtPrecioProducto");
                    String stockProductoStr = request.getParameter("txtStockProducto");
                    String idProveedorStr = request.getParameter("txtIdProveedor");
                    String tipoProducto = request.getParameter("txtTipoProducto");
                    
                    try {
                        double precioProducto = Double.parseDouble(precioProductoStr);
                        int stockProducto = Integer.parseInt(stockProductoStr);
                        int idProveedor = Integer.parseInt(idProveedorStr);
                        
                        Producto producto = new Producto();
                        producto.setNombreProducto(nombreProducto);
                        producto.setPrecioProducto(precioProducto);
                        producto.setStockProducto(stockProducto);
                        producto.setIdProveedor(idProveedor);
                        producto.setTipoProducto(tipoProducto);
                        
                        int resultado = productoDAO.agregar(producto);
                        if (resultado > 0) {
                            request.setAttribute("mensaje", "Producto agregado exitosamente");
                        } else {
                            request.setAttribute("error", "Error al agregar el producto");
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Datos inválidos para precio, stock o proveedor");
                    }
                    request.getRequestDispatcher("SupermercadoControlador?menu=Producto&accion=Listar").forward(request, response);
                    return;
                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    Producto productoEditar = productoDAO.buscar(idEditar);
                    request.setAttribute("producto", productoEditar);
                    request.setAttribute("productos", productoDAO.listar());
                    request.getRequestDispatcher("/Index/Producto.jsp").forward(request, response);
                    return;
                case "Actualizar":
                    int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                    String nuevoNombreProducto = request.getParameter("txtNombreProducto");
                    String nuevoPrecioStr = request.getParameter("txtPrecioProducto");
                    String nuevoStockStr = request.getParameter("txtStockProducto");
                    String nuevoIdProveedorStr = request.getParameter("txtIdProveedor");
                    String nuevoTipoProducto = request.getParameter("txtTipoProducto");
                    
                    try {
                        double nuevoPrecio = Double.parseDouble(nuevoPrecioStr);
                        int nuevoStock = Integer.parseInt(nuevoStockStr);
                        int nuevoIdProveedor = Integer.parseInt(nuevoIdProveedorStr);
                        
                        Producto producto = new Producto();
                        producto.setIdProducto(idProducto);
                        producto.setNombreProducto(nuevoNombreProducto);
                        producto.setPrecioProducto(nuevoPrecio);
                        producto.setStockProducto(nuevoStock);
                        producto.setIdProveedor(nuevoIdProveedor);
                        producto.setTipoProducto(nuevoTipoProducto);
                        
                        int filas = productoDAO.actualizar(producto);
                        if (filas > 0) {
                            request.setAttribute("mensaje", "Producto actualizado exitosamente");
                        } else {
                            request.setAttribute("error", "Error al actualizar el producto");
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Datos inválidos para precio, stock o proveedor");
                    }
                    request.setAttribute("productos", productoDAO.listar());
                    request.getRequestDispatcher("/Index/Producto.jsp").forward(request, response);
                    return;
                case "Eliminar":
                    String idEliminar = request.getParameter("id");
                    if (idEliminar != null && !idEliminar.trim().isEmpty()) {
                        try {
                            int id = Integer.parseInt(idEliminar);
                            int resultado = productoDAO.eliminar(id);
                            if (resultado > 0) {
                                request.setAttribute("mensaje", "Producto eliminado exitosamente");
                            } else {
                                request.setAttribute("error", "Error al eliminar el producto");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de producto inválido");
                        }
                        response.sendRedirect("SupermercadoControlador?menu=Producto&accion=Listar");
                        return;
                    }
                    break;
                default:
                    request.setAttribute("error", "Acción no reconocida para Producto");
            }
            request.getRequestDispatcher("/Index/Producto.jsp").forward(request, response);
        } else if (menu.equals("Proveedor")) {
            switch (accion) {
                case "Listar":
                    List<Proveedor> listaProveedores = proveedorDAO.listar();
                    request.setAttribute("proveedores", listaProveedores);
                    break;
                case "Buscar":
                    String idProveedorStr = request.getParameter("txtBuscarId");
                    List<Proveedor> listaProveedoresB = new ArrayList<>();
                    if (idProveedorStr != null && !idProveedorStr.trim().isEmpty()) {
                        try {
                            int idProveedor = Integer.parseInt(idProveedorStr);
                            Proveedor proveedorEncontrado = proveedorDAO.buscar(idProveedor);
                            if (proveedorEncontrado.getIdProveedor() != 0) {
                                listaProveedoresB.add(proveedorEncontrado);
                            } else {
                                request.setAttribute("error", "Proveedor no encontrado");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de proveedor inválido");
                        }
                    } else {
                        listaProveedoresB = proveedorDAO.listar();
                    }
                    request.setAttribute("proveedores", listaProveedoresB);
                    request.getRequestDispatcher("/Index/Proveedor.jsp").forward(request, response);
                    return;
                case "Agregar":
                    String nombreProveedor = request.getParameter("txtNombreProveedor");
                    String contactoProveedor = request.getParameter("txtContactoProveedor");
                    String telefonoProveedor = request.getParameter("txtTelefonoProveedor");
                    String emailProveedor = request.getParameter("txtEmailProveedor");
                    
                    Proveedor proveedor = new Proveedor();
                    proveedor.setNombreProveedor(nombreProveedor);
                    proveedor.setContactoProveedor(contactoProveedor);
                    proveedor.setTelefonoProveedor(telefonoProveedor);
                    proveedor.setEmailProveedor(emailProveedor);
                    
                    int resultado = proveedorDAO.agregar(proveedor);
                    if (resultado > 0) {
                        request.setAttribute("mensaje", "Proveedor agregado exitosamente");
                    } else {
                        request.setAttribute("error", "Error al agregar el proveedor");
                    }
                    request.getRequestDispatcher("SupermercadoControlador?menu=Proveedor&accion=Listar").forward(request, response);
                    return;
                case "Editar":
                    int idEditar = Integer.parseInt(request.getParameter("id"));
                    Proveedor proveedorEditar = proveedorDAO.buscar(idEditar);
                    request.setAttribute("proveedor", proveedorEditar);
                    request.setAttribute("proveedores", proveedorDAO.listar());
                    request.getRequestDispatcher("/Index/Proveedor.jsp").forward(request, response);
                    return;
                case "Actualizar":
                    int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                    String nuevoNombreProveedor = request.getParameter("txtNombreProveedor");
                    String nuevoContactoProveedor = request.getParameter("txtContactoProveedor");
                    String nuevoTelefonoProveedor = request.getParameter("txtTelefonoProveedor");
                    String nuevoEmailProveedor = request.getParameter("txtEmailProveedor");
                    
                    Proveedor prov = new Proveedor();
                    prov.setIdProveedor(idProveedor);
                    prov.setNombreProveedor(nuevoNombreProveedor);
                    prov.setContactoProveedor(nuevoContactoProveedor);
                    prov.setTelefonoProveedor(nuevoTelefonoProveedor);
                    prov.setEmailProveedor(nuevoEmailProveedor);
                    
                    int filas = proveedorDAO.actualizar(prov);
                    if (filas > 0) {
                        request.setAttribute("mensaje", "Proveedor actualizado exitosamente");
                    } else {
                        request.setAttribute("error", "Error al actualizar el proveedor");
                    }
                    request.setAttribute("proveedores", proveedorDAO.listar());
                    request.getRequestDispatcher("/Index/Proveedor.jsp").forward(request, response);
                    return;
                case "Eliminar":
                    String idEliminar = request.getParameter("id");
                    if (idEliminar != null && !idEliminar.trim().isEmpty()) {
                        try {
                            int id = Integer.parseInt(idEliminar);
                            int resultadoEliminar = proveedorDAO.eliminar(id);
                            if (resultadoEliminar > 0) {
                                request.setAttribute("mensaje", "Proveedor eliminado exitosamente");
                            } else {
                                request.setAttribute("error", "Error al eliminar el proveedor");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "ID de proveedor inválido");
                        }
                        response.sendRedirect("SupermercadoControlador?menu=Proveedor&accion=Listar");
                        return;
                    }
                    break;
                default:
                    request.setAttribute("error", "Acción no reconocida para Proveedor");
            }
            request.getRequestDispatcher("/Index/Proveedor.jsp").forward(request, response);
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
        return "Servlet para gestionar Productos y Proveedores en el sistema de supermercado";
    }
}