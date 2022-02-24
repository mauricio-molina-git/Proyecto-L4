package AccesoDatosImpl;

import java.util.List;

import AccesoDatos.DAO;
import AccesoDatos.jpaDAO;
import Entidades.Categoria;

public class CategoriasDAO extends jpaDAO implements DAO<Categoria> {

	public CategoriasDAO() {
		super();
	}

	@Override
	public boolean Guardar(Categoria entidad) {
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
	public Categoria Obtener(Object clavePrimaria) {
		return manager.find(Categoria.class, clavePrimaria);
	}

	@Override
	public List<Categoria> ObtenerTodos() {
		//manager.clear();
		return manager.createQuery("FROM Categoria", Categoria.class).getResultList();
	}

}
