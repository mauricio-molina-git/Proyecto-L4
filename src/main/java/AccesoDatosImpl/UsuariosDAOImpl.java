package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.UsuariosDAO;
import AccesoDatos.jpaDAO;
import Entidades.Usuario;

public class UsuariosDAOImpl extends jpaDAO implements UsuariosDAO {

	@Override
	public boolean Guardar(Usuario entidad) {
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
	public Usuario Obtener(Object clavePrimaria) {
		return manager.find(Usuario.class, clavePrimaria);
	}

	@Override
	public List<Usuario> ObtenerTodos() {
		manager.clear();
		return manager.createQuery("FROM Usuario", Usuario.class).getResultList();
	}
	
	public List<Usuario> ObtenerActivos()
	{
		manager.clear();
		return manager.createQuery("FROM Usuario where Estado = 1", Usuario.class).getResultList();
	}

	@Override
	public Usuario ObtenerPorEmail(String eMail) {
		return manager.createQuery("FROM Usuario where Email like'" + eMail + "'", Usuario.class).getSingleResult();
	}

}
