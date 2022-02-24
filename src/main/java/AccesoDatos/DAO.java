package AccesoDatos;

import java.util.List;

import Entidades.Proveedor;

public interface DAO<T> {

	boolean Guardar(T entidad);
	T Obtener(Object clavePrimaria);
	List<T> ObtenerTodos();
}