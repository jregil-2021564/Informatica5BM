package modelo;

import config.Conexion;
import java.sql.*;
import java.util.*;

public class ProveedorDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    int resp;

    public List<Proveedor> listar() {
        List<Proveedor> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_ListarProveedores()");
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor p = new Proveedor();
                p.setIdProveedor(rs.getInt(1));
                p.setNombreProveedor(rs.getString(2));
                p.setContactoProveedor(rs.getString(3));
                p.setTelefonoProveedor(rs.getString(4));
                p.setEmailProveedor(rs.getString(5));
                lista.add(p);
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return lista;
    }

    public int agregar(Proveedor prov) {
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_AgregarProveedor(?, ?, ?, ?)");
            ps.setString(1, prov.getNombreProveedor());
            ps.setString(2, prov.getContactoProveedor());
            ps.setString(3, prov.getTelefonoProveedor());
            ps.setString(4, prov.getEmailProveedor());
            resp = ps.executeUpdate();
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return resp;
    }

    public int actualizar(Proveedor prov) {
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_EditarProveedor(?, ?, ?, ?, ?)");
            ps.setInt(1, prov.getIdProveedor());
            ps.setString(2, prov.getNombreProveedor());
            ps.setString(3, prov.getContactoProveedor());
            ps.setString(4, prov.getTelefonoProveedor());
            ps.setString(5, prov.getEmailProveedor());
            resp = ps.executeUpdate();
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return resp;
    }

    public int eliminar(int id) {
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_EliminarProveedor(?)");
            ps.setInt(1, id);
            resp = ps.executeUpdate();
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return resp;
    }

    public Proveedor buscar(int id) {
        Proveedor prov = new Proveedor();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement("CALL sp_BuscarProveedor(?)");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                prov.setIdProveedor(rs.getInt(1));
                prov.setNombreProveedor(rs.getString(2));
                prov.setContactoProveedor(rs.getString(3));
                prov.setTelefonoProveedor(rs.getString(4));
                prov.setEmailProveedor(rs.getString(5));
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return prov;
    }
}