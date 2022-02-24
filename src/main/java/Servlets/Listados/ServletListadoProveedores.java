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
import AccesoDatosImpl.ProveedoresDAO;
import AccesoDatosImpl.ProvinciasDAO;
import Entidades.Proveedor;
import Entidades.Provincia;
import test.Evaluar;
import test.Funciones;

/**
 * Servlet implementation class ServletListadoProveedores
 */
public class ServletListadoProveedores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Proveedor> daoProveedores = new ProveedoresDAO();
	private DAO<Provincia> daoProvincias = new ProvinciasDAO();

	private List<Proveedor> listaProveedores = new ArrayList<Proveedor>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletListadoProveedores() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		listaProveedores = daoProveedores.ObtenerTodos();
		request.setAttribute("listaProveedores", listaProveedores);
		request.setAttribute("listaProvincias", daoProvincias.ObtenerTodos());
		request.getRequestDispatcher("ListadoProveedores.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnBuscar") != null) {
			String param = request.getParameter("txtBusqueda").toUpperCase();
			request.setAttribute("listaProveedores",
					Funciones.filtrar(listaProveedores, p -> p.getNombre().toUpperCase().contains(param)));
			request.setAttribute("listaProvincias", daoProvincias.ObtenerTodos());
			request.getRequestDispatcher("ListadoProveedores.jsp").forward(request, response);
		}

		if (request.getParameter("btnFiltrar") != null) {
			List<Evaluar<Proveedor>> condiciones = new LinkedList<Evaluar<Proveedor>>();

			int selProvincia = Integer.valueOf(request.getParameter("selProvincia")); 
			int selEstado = Integer.valueOf(request.getParameter("selEstado"));

			if (selProvincia != -1) {
				condiciones.add(p -> p.getLocalidad().getProvincia().getIdProvincia() == selProvincia);
			}
			if (selEstado != -1) {
				boolean paramEstado = (selEstado == 1) ? true : false;
				condiciones.add(p -> p.getEstado() == paramEstado);
			}

			if (condiciones.size() != 0)
				listaProveedores = Funciones.filtrar(listaProveedores, condiciones);

			request.setAttribute("listaProveedores", listaProveedores);
			request.setAttribute("listaProvincias", daoProvincias.ObtenerTodos());
			request.getRequestDispatcher("ListadoProveedores.jsp").forward(request, response);
		}

		if (request.getParameter("btnReiniciar") != null)
			doGet(request, response);

	}

}
