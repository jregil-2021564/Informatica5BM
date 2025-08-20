package modelo;

import config.Conexion;
import java.sql.*;
import java.util.*;

public class ProductoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Producto> listar() {
        List<Producto> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_ListarProductos()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioProducto(rs.getDouble(3));
                p.setStockProducto(rs.getInt(4));
                p.setIdProveedor(rs.getInt(5));
                p.setTipoProducto(rs.getString(6));
                lista.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public int agregar(Producto p) {
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_AgregarProducto(?, ?, ?, ?, ?)");
            ps.setString(1, p.getNombreProducto());
            ps.setDouble(2, p.getPrecioProducto());
            ps.setInt(3, p.getStockProducto());
            ps.setInt(4, p.getIdProveedor());
            ps.setString(5, p.getTipoProducto());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public int actualizar(Producto p) {
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_EditarProducto(?, ?, ?, ?, ?, ?)");
            ps.setInt(1, p.getIdProducto());
            ps.setString(2, p.getNombreProducto());
            ps.setDouble(3, p.getPrecioProducto());
            ps.setInt(4, p.getStockProducto());
            ps.setInt(5, p.getIdProveedor());
            ps.setString(6, p.getTipoProducto());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public int eliminar(int id) {
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_EliminarProducto(?)");
            ps.setInt(1, id);
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    public Producto buscar(int id) {
        Producto p = new Producto();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_BuscarProducto(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setIdProducto(rs.getInt(1));
                p.setNombreProducto(rs.getString(2));
                p.setPrecioProducto(rs.getDouble(3));
                p.setStockProducto(rs.getInt(4));
                p.setIdProveedor(rs.getInt(5));
                p.setTipoProducto(rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
}
