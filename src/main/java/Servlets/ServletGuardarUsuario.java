package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatos.UsuariosDAO;
import AccesoDatosImpl.LocalidadesDAO;
import AccesoDatosImpl.ProvinciasDAO;
import AccesoDatosImpl.TiposDeUsuarioDAO;
import AccesoDatosImpl.UsuariosDAOImpl;
import Entidades.Localidad;
import Entidades.Provincia;
import Entidades.TipoDeUsuario;
import Entidades.Usuario;
import Negocio.Negocio;
import test.Funciones;

/**
 * Servlet implementation class ServletGuardarUsuario
 */
public class ServletGuardarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();

	private DAO<Provincia> daoProvincias = new ProvinciasDAO();
	private DAO<Localidad> daoLocalidades = new LocalidadesDAO();
	
	private DAO<TipoDeUsuario> daoTipoUser = new TiposDeUsuarioDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletGuardarUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		cargarListadoProvinciasLocalidades(request);
		request.setAttribute("listaTiposUser", daoTipoUser.ObtenerTodos());

		if (request.getParameter("IdModificar") != null) {
			Usuario usuario = daoUsuarios.ObtenerPorEmail(request.getParameter("IdModificar"));
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("ModificarUsuario.jsp").forward(request, response);
		} else
		{
			request.getRequestDispatcher("Registro.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("btnCrearCuenta") != null) {
			String pwd = null;
			String pwd2 = null;
			int estado = 0;
			
			pwd = request.getParameter("Contraseña");
			pwd2 = request.getParameter("Contraseña2");
			try {			
				if(!pwd.equals(pwd2)) {
					estado = 4;
					request.setAttribute("estado", estado);	
					doGet(request, response);
				}
				  else {
					Usuario nuevo = new Usuario();
					if (Negocio.CargarUsuario(request.getParameterMap(), nuevo)) {
						if(daoUsuarios.Guardar(nuevo))
						{
							estado = 5;
							request.setAttribute("estado", estado);	
							RequestDispatcher dispatcher = request.getRequestDispatcher("ServletLogin");
							dispatcher.forward(request, response);
						}
						else {
							estado = 6;
						}
					}
					else {
						estado = 7;	
					}
					request.setAttribute("estado", estado);	
					doGet(request, response);
				}
			} catch(NumberFormatException e) {
				request.setAttribute("error", "formato");	
			}
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
