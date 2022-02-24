package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatosImpl.LocalidadesDAO;
import AccesoDatosImpl.ProveedoresDAO;
import AccesoDatosImpl.ProvinciasDAO;
import Entidades.Localidad;
import Entidades.Proveedor;
import Entidades.Provincia;
import Negocio.Negocio;
import test.Funciones;

/**
 * Servlet implementation class ServletProveedores
 */
public class ServletProveedores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Provincia> daoProvincias = new ProvinciasDAO();
	private DAO<Localidad> daoLocalidades = new LocalidadesDAO();

	private DAO<Proveedor> daoProveedores = new ProveedoresDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletProveedores() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		cargarListadoProvinciasLocalidades(request);

		if (request.getParameter("IdModificar") != null) {
			Proveedor proveedor = daoProveedores.Obtener(Integer.valueOf(request.getParameter("IdModificar")));
			request.setAttribute("proveedor", proveedor);
			request.getRequestDispatcher("ModificarProveedor.jsp").forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("AgregarProveedor.jsp");
			dispatcher.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnAgregar") != null) {
			int estadoOperacion = 2;
			Proveedor nuevo = new Proveedor();

			if (Negocio.CargarProveedor(request.getParameterMap(), nuevo)) 
			{
				if (daoProveedores.Guardar(nuevo))
				{
					estadoOperacion = 1;
				}
				else {
					estadoOperacion = 8;
				}
			}
			else {
				estadoOperacion = 3;
			}
			request.setAttribute("estado", estadoOperacion);
			doGet(request, response);
		}

		if (request.getParameter("btnModificar") != null) {
			int estadoOperacion = 2;
			Proveedor proveedor = daoProveedores.Obtener(Integer.valueOf(request.getParameter("IdProveedor")));
			Proveedor original = daoProveedores.Obtener(Integer.valueOf(request.getParameter("IdProveedor")));
			request.setAttribute("proveedor", original);

			if (Negocio.CargarProveedor(request.getParameterMap(), proveedor)) {
				if (daoProveedores.Guardar(proveedor))
					estadoOperacion = 1;
			} else
				estadoOperacion = 3;

			request.setAttribute("estado", estadoOperacion);
			cargarListadoProvinciasLocalidades(request);
			request.getRequestDispatcher("ModificarProveedor.jsp").forward(request, response);
		}

	}

	void cargarListadoProvinciasLocalidades(HttpServletRequest request) {
		List<Provincia> listaProv = daoProvincias.ObtenerTodos();
		List<Localidad> listaLoc = daoLocalidades.ObtenerTodos();

		List<String> idProvincias = Funciones.mapear(listaLoc, l -> String.valueOf(l.getProvincia().getIdProvincia()));
		List<String> idLocalidades = Funciones.mapear(listaLoc, l -> String.valueOf(l.getIdLocalidad()));
		List<String> nombreLocalidades = Funciones.mapear(listaLoc, l -> l.getNombre());

		request.setAttribute("listaProvincias", listaProv);
		request.setAttribute("idProvincias", Funciones.toJavaScriptArray(idProvincias));
		request.setAttribute("idLocalidades", Funciones.toJavaScriptArray(idLocalidades));
		request.setAttribute("nombreLocalidades", Funciones.toJavaScriptArray(nombreLocalidades));
	}

}
