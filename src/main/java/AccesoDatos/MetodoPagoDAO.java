package AccesoDatos;

import java.util.List;

import Entidades.MetodoDePago;
import Entidades.Producto;

public interface MetodoPagoDAO extends DAO<MetodoDePago> {
	
	public boolean Guardar(MetodoDePago entidad);
	public MetodoDePago Obtener(Object clavePrimaria);
	public List<MetodoDePago> ObtenerTodos();

}
