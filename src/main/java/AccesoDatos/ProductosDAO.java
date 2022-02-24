package AccesoDatos;

import java.util.List;

import Entidades.Producto;

public interface ProductosDAO extends DAO<Producto> {

	List<Producto> ObtenerPorCategoria(int idCategoria);

	List<Producto> ObtenerPorFragmento(int minimo, int maximo);

	int ObtenerCantidadRegistros();

	List<Producto> ObtenerPorFragmentoYCategoria(int minimo, int maximo, int IdCategoria);

	int ObtenerCantidadRegistrosPorCategoria(int IdCategoria);

	List<Producto> ObtenerPorFragmento(int RegistrosPorPagina, int RegistrosASaltar, String orden, String precio);

	List<Producto> ObtenerPorFragmento(int RegistrosPorPagina, int RegistrosASaltar, String orden, String precio,
			String categoria);
}
