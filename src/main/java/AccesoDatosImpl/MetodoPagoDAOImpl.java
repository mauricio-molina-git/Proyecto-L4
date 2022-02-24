package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.DAO;
import AccesoDatos.jpaDAO;
import Entidades.MetodoDePago;
import Entidades.Proveedor;

public class MetodoPagoDAOImpl extends jpaDAO implements DAO<MetodoDePago> {

	@Override
	public boolean Guardar(MetodoDePago entidad) {
		return false;
	}
	
	public MetodoDePago Obtener(Object clavePrimaria) {
		return manager.find(MetodoDePago.class, clavePrimaria);
	}
	
	public List<MetodoDePago> ObtenerTodos() {
		return manager.createQuery("FROM MetodoDePago", MetodoDePago.class).getResultList();
	}
}