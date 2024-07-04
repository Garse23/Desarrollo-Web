package DAO;

import modelo.Empleado;

public interface EmpleadoDAO {
    void registrarEmpleado(Empleado empleado);
    void actualizarEmpleado(Empleado empleado);
    void eliminarEmpleado(Empleado empleado);
}
