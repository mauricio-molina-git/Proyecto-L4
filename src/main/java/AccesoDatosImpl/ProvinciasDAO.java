package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.DAO;
import AccesoDatos.jpaDAO;
import Entidades.Provincia;

public class ProvinciasDAO extends jpaDAO implements DAO<Provincia> {

	@Override
	public boolean Guardar(Provincia entidad) {
		boolean resultado = false;
		try {
			manager.getTransaction().begin();
			manager.persist(entidad);
			manager.getTransaction().commit();
			resultado = true;
		} catch (Exception e) {
			manager.getTransaction().rollback();
		}
		return resultado;
	}

	@Override
	public Provincia Obtener(Object clavePrimaria) {
		return manager.find(Provincia.class, clavePrimaria);
	}

	@Override
	public List<Provincia> ObtenerTodos() {
		manager.clear();
		return manager.createQuery("FROM Provincia", Provincia.class).getResultList();
	}

}
