package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.DAO;
import AccesoDatos.jpaDAO;
import Entidades.Localidad;

public class LocalidadesDAO extends jpaDAO implements DAO<Localidad> {

	@Override
	public boolean Guardar(Localidad entidad) {
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
	public Localidad Obtener(Object clavePrimaria) {
		return manager.find(Localidad.class, clavePrimaria);
	}

	@Override
	public List<Localidad> ObtenerTodos() {
		//manager.clear();
		return manager.createQuery("FROM Localidad", Localidad.class).getResultList();
	}

}
