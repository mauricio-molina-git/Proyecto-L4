package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.DAO;
import AccesoDatos.jpaDAO;
import Entidades.Proveedor;

public class ProveedoresDAO extends jpaDAO implements DAO<Proveedor> {

	@Override
	public boolean Guardar(Proveedor entidad) {
		boolean resultado = false;
		try {
			manager.getTransaction().begin();
			manager.persist(entidad);
			manager.getTransaction().commit();
			resultado = true;
		} catch (Exception e) {
			e.printStackTrace();
			manager.getTransaction().rollback();
		}
		return resultado;
	}

	@Override
	public Proveedor Obtener(Object clavePrimaria) {
		return manager.find(Proveedor.class, clavePrimaria);
	}

	@Override
	public List<Proveedor> ObtenerTodos() {
		return manager.createQuery("FROM Proveedor", Proveedor.class).getResultList();
	}
	public List<Proveedor> ObtenerTodosConProv() {
		return manager.createQuery("FROM Proveedor", Proveedor.class).getResultList();
	}
}
