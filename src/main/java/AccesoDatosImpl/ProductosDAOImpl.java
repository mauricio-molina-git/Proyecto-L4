package AccesoDatosImpl;

import java.math.BigInteger;
import java.util.List;

import AccesoDatos.ProductosDAO;
import AccesoDatos.jpaDAO;
import Entidades.Producto;

public class ProductosDAOImpl extends jpaDAO implements ProductosDAO {

	@Override
	public boolean Guardar(Producto entidad) {
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
	public Producto Obtener(Object clavePrimaria) {
		return manager.find(Producto.class, clavePrimaria);
	}

	@Override
	public List<Producto> ObtenerTodos() {
		//manager.clear();
		return manager.createQuery("FROM Producto", Producto.class).getResultList();
	}

	@Override
	public List<Producto> ObtenerPorCategoria(int idCategoria) {
		return manager.createQuery("FROM Producto where IdCategoria = " + idCategoria, Producto.class).getResultList();
	}

	@Override
	public int ObtenerCantidadRegistrosPorCategoria(int IdCategoria) {
		BigInteger registros = (BigInteger) manager
				.createNativeQuery("select count(*) from productos where IdCategoria = " + IdCategoria)
				.getSingleResult();
		return registros.intValue();
	}

	@Override
	public int ObtenerCantidadRegistros() {
		BigInteger registros = (BigInteger) manager.createNativeQuery("select count(*) from productos")
				.getSingleResult();
		return registros.intValue();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> ObtenerPorFragmentoYCategoria(int RegistrosPorPagina, int RegistrosASaltar, int IdCategoria) {
		return manager.createNativeQuery("SELECT * FROM productos where IdCategoria = " + IdCategoria + " LIMIT "
				+ RegistrosPorPagina + " OFFSET " + RegistrosASaltar, Producto.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> ObtenerPorFragmento(int RegistrosPorPagina, int RegistrosASaltar) {
		return manager.createNativeQuery(
				"SELECT * FROM productos LIMIT " + RegistrosPorPagina + " OFFSET " + RegistrosASaltar, Producto.class)
				.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> ObtenerPorFragmento(int RegistrosPorPagina, int RegistrosASaltar, String orden,
			String precio) {
		return manager.createNativeQuery("SELECT * FROM productos " + precio + orden + " LIMIT " + RegistrosPorPagina
				+ " OFFSET " + RegistrosASaltar, Producto.class).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Producto> ObtenerPorFragmento(int RegistrosPorPagina, int RegistrosASaltar, String orden, String precio,
			String categoria) {
		return manager.createNativeQuery("SELECT * FROM productos " + precio + categoria + orden + " LIMIT "
				+ RegistrosPorPagina + " OFFSET " + RegistrosASaltar, Producto.class).getResultList();
	}
}
