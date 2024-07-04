package DAO;

import java.sql.SQLException;
import java.util.List;
import modelo.Producto;

public interface ProductoDAO {
    List<Producto> obtenerProductosHabilitados() throws SQLException, ClassNotFoundException;
    List<Producto> obtenerProductosDeshabilitados() throws SQLException, ClassNotFoundException;
    void AgregarProducto(Producto producto);
    void EliminarProducto(Producto producto);
    void EditarProducto(Producto producto);
    void PedirProducto(Producto producto);
    void SeleccionarProducto(Producto producto);
    void InhabilitarProducto (Producto producto);
    void HabilitarProducto (Producto producto);
}
