package Servlets.Listados;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

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
import test.Evaluar;
import test.Funciones;

/**
 * Servlet implementation class ServletListadoProductos
 */
public class ServletListadoProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Categoria> daoCategorias = new CategoriasDAO();
	private DAO<Proveedor> daoProveedores = new ProveedoresDAO();

	private ProductosDAO daoProductos = new ProductosDAOImpl();
	private List<Producto> listaProductos = new ArrayList<Producto>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletListadoProductos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		listaProductos = daoProductos.ObtenerTodos();
		request.setAttribute("listaProductos", listaProductos);
		cargarListasSelect(request);
		request.getRequestDispatcher("ListadoProductos.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnBuscar") != null) {
			String param = request.getParameter("txtBusqueda").toUpperCase();
			request.setAttribute("listaProductos", Funciones.filtrar(listaProductos, p -> p.getNombre().toUpperCase().contains(param)));
			cargarListasSelect(request);
			request.getRequestDispatcher("ListadoProductos.jsp").forward(request, response);
		}
		
		if (request.getParameter("btnFiltrar") != null) {
			List<Evaluar<Producto>> condiciones = new LinkedList<Evaluar<Producto>>();
			
			int selCategoria = Integer.valueOf(request.getParameter("selCategoria"));
			int selProveedor = Integer.valueOf(request.getParameter("selProveedor"));
			int selEstado = Integer.valueOf(request.getParameter("selEstado"));
			
			if (selCategoria != -1) {
				condiciones.add(p -> p.getCategoria().getIdCategoria() == selCategoria);
			}
			if (selEstado != -1) {
				boolean paramEstado = (selEstado == 1) ? true : false;
				condiciones.add(p -> p.getEstado() == paramEstado);
			}
			if (selProveedor != -1) {
				condiciones.add(p -> p.getProveedor().getIdProveedor() == selProveedor);
			}
			
			if (condiciones.size() != 0)
				listaProductos = Funciones.filtrar(listaProductos, condiciones);
			
			request.setAttribute("listaProductos", listaProductos);
			cargarListasSelect(request);
			request.getRequestDispatcher("ListadoProductos.jsp").forward(request, response);
		}
		
		if (request.getParameter("btnReiniciar") != null)
			doGet(request, response);

	}

	private void cargarListasSelect(HttpServletRequest request) {
		request.setAttribute("listaCategorias", daoCategorias.ObtenerTodos());
		request.setAttribute("listaProveedores", daoProveedores.ObtenerTodos());
	}

}
