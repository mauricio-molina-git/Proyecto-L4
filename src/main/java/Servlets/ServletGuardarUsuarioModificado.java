package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AccesoDatos.DAO;
import AccesoDatos.UsuariosDAO;
import AccesoDatosImpl.LocalidadesDAO;
import AccesoDatosImpl.ProvinciasDAO;
import AccesoDatosImpl.TiposDeUsuarioDAO;
import AccesoDatosImpl.UsuariosDAOImpl;
import Entidades.Categoria;
import Entidades.Localidad;
import Entidades.Provincia;
import Entidades.TipoDeUsuario;
import Entidades.Usuario;
import Negocio.Negocio;
import test.Funciones;

/**
 * Servlet implementation class ServletGuardarUsuarioModificado
 */
public class ServletGuardarUsuarioModificado extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();
	private DAO<Provincia> daoProvincias = new ProvinciasDAO();
	private DAO<Localidad> daoLocalidades = new LocalidadesDAO();
	private DAO<TipoDeUsuario> daoTipoUser = new TiposDeUsuarioDAO();

    public ServletGuardarUsuarioModificado() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		cargarListadoProvinciasLocalidades(request);				
		Usuario usu = new Usuario();
		usu = daoUsuarios.ObtenerPorEmail((String) session.getAttribute("Nickname"));	
		request.setAttribute("usu", usu);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarDatosPersonales.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		if (request.getParameter("btnModificar") != null) 
		{
			int estadoOperacion = 2;
			Usuario usuario = daoUsuarios.ObtenerPorEmail(request.getParameter("IdUsuario"));
			Usuario original = daoUsuarios.ObtenerPorEmail(request.getParameter("IdUsuario"));
			
			request.setAttribute("usuario", original);
			String pwd = null;
			String pwd2 = null;
			
			pwd = request.getParameter("Contraseña");
			pwd2 = request.getParameter("Contraseña2");
			try {			
				if(!pwd.equals(pwd2)) {
					estadoOperacion = 9;
					request.setAttribute("estado", estadoOperacion);	
					doGet(request, response);
				}
				else {
					if (Negocio.CargarUsuario(request.getParameterMap(), usuario))
					{
						if (daoUsuarios.Guardar(usuario))
						{
							estadoOperacion = 1;
						}
					}
					else {
						estadoOperacion = 3;
					}
					
					request.setAttribute("estado", estadoOperacion);
					cargarListadoProvinciasLocalidades(request);
					request.setAttribute("listaTiposUser", daoTipoUser.ObtenerTodos());
					doGet(request, response);
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
