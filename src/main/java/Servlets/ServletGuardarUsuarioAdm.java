package Servlets;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ServletGuardarUsuarioAdm
 */
public class ServletGuardarUsuarioAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();
	private DAO<Provincia> daoProvincias = new ProvinciasDAO();
	private DAO<Localidad> daoLocalidades = new LocalidadesDAO();
	private DAO<TipoDeUsuario> daoTipoUser = new TiposDeUsuarioDAO();
	
    public ServletGuardarUsuarioAdm() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		cargarListadoProvinciasLocalidades(request);
		request.setAttribute("listaTiposUser", daoTipoUser.ObtenerTodos());

		if (request.getParameter("IdModificar") != null) {
			Usuario usuario = daoUsuarios.ObtenerPorEmail(request.getParameter("IdModificar"));
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("ModificarUsuario.jsp").forward(request, response);
		} else
		{
			request.getRequestDispatcher("AgregarUsuario.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if (request.getParameter("btnAgregar") != null) {
			String pwd = null;
			String pwd2 = null;
			pwd = request.getParameter("Contraseña");
			pwd2 = request.getParameter("Contraseña2");
			int estadoOperacion = 2;
			
			try {			
				if(!pwd.equals(pwd2)) {
					estadoOperacion = 4;
					request.setAttribute("estado", estadoOperacion);	
					doGet(request, response);
				}
				else {
					Usuario nuevo = new Usuario();
					if (Negocio.CargarUsuario(request.getParameterMap(), nuevo)) 
					{
						if (daoUsuarios.Guardar(nuevo))
						{
							estadoOperacion = 1;
						}						
						else {
							estadoOperacion = 6;
						}			
					}
					else
					{
						estadoOperacion = 7;
					}	
					request.setAttribute("estado", estadoOperacion);
					cargarListadoProvinciasLocalidades(request);
					request.setAttribute("listaTiposUser", daoTipoUser.ObtenerTodos());
					request.getRequestDispatcher("AgregarUsuario.jsp").forward(request, response);
				}
			}

			catch(NumberFormatException e) {
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
