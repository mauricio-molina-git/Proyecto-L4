package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatos.ProductosDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.ProductosDAOImpl;
import AccesoDatosImpl.ProveedoresDAO;
import Entidades.Categoria;
import Entidades.Producto;
import Entidades.Proveedor;
import Negocio.Negocio;

/**
 * Servlet implementation class ServletProductos
 */
public class ServletProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductosDAO daoProductos = new ProductosDAOImpl();

	private DAO<Categoria> daoCategorias = new CategoriasDAO();

	private DAO<Proveedor> daoProveedores = new ProveedoresDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletProductos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		cargarListadoCategoriasProveedores(request);
		
		if (request.getParameter("IdModificar") != null) {
			Producto producto = daoProductos.Obtener(Integer.valueOf(request.getParameter("IdModificar")));
			request.setAttribute("producto", producto);
			request.getRequestDispatcher("ModificarProducto.jsp").forward(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarProductos.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnAgregar") != null) {

			int estadoOperacion = 2;
			Producto producto = new Producto();
			
			if (Negocio.CargarProducto(request.getParameterMap(), producto)) {
				if (daoProductos.Guardar(producto)) estadoOperacion = 1;
			}
			else estadoOperacion = 3;

			request.setAttribute("estado", estadoOperacion);
			doGet(request, response);
		}
		
		if (request.getParameter("btnModificar") != null) {
			int estadoOperacion = 2;

			Producto producto = daoProductos.Obtener(Integer.valueOf(request.getParameter("IdProducto")));
			Producto original = daoProductos.Obtener(Integer.valueOf(request.getParameter("IdProducto")));
			request.setAttribute("producto", original);
			
			if (Negocio.CargarProducto(request.getParameterMap(), producto))
			{
				if (daoProductos.Guardar(producto)) {
					estadoOperacion = 1;
				}
			}
			else
				{
				estadoOperacion = 3;
				}

			request.setAttribute("estado", estadoOperacion);
			cargarListadoCategoriasProveedores(request);
			request.getRequestDispatcher("ModificarProducto.jsp").forward(request, response);
		}

	}
	
	void cargarListadoCategoriasProveedores(HttpServletRequest request) {
		List<Categoria> listaCat = daoCategorias.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);

		List<Proveedor> listaProv = daoProveedores.ObtenerTodos();
		request.setAttribute("listaProveedores", listaProv);
	}

}
