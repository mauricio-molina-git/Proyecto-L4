package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.DAO;
import AccesoDatos.jpaDAO;
import Entidades.TipoDeUsuario;

public class TiposDeUsuarioDAO extends jpaDAO implements DAO<TipoDeUsuario> {

	@Override
	public boolean Guardar(TipoDeUsuario entidad) {
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
	public TipoDeUsuario Obtener(Object clavePrimaria) {
		return manager.find(TipoDeUsuario.class, clavePrimaria);
	}

	@Override
	public List<TipoDeUsuario> ObtenerTodos() {
		//manager.clear();
		return manager.createQuery("FROM TipoDeUsuario", TipoDeUsuario.class).getResultList();
	}

}
