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
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.LocalidadesDAO;
import AccesoDatosImpl.ProvinciasDAO;
import AccesoDatosImpl.TiposDeUsuarioDAO;
import AccesoDatosImpl.UsuariosDAOImpl;
import Entidades.Categoria;
import Entidades.Localidad;
import Entidades.Provincia;
import Entidades.TipoDeUsuario;
import Entidades.Usuario;
import test.Funciones;

/**
 * Servlet implementation class ServletModificarDatosPersonales
 */
public class ServletModificarDatosPersonales extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Categoria> daoCategoria = new CategoriasDAO();
	private UsuariosDAO daoUsuario = new UsuariosDAOImpl();

	private DAO<Provincia> daoProvincias = new ProvinciasDAO();
	private DAO<Localidad> daoLocalidades = new LocalidadesDAO();
	private DAO<TipoDeUsuario> daoTipoUser = new TiposDeUsuarioDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModificarDatosPersonales() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();	
		cargarListadoProvinciasLocalidades(request);
		
		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		Usuario usu = new Usuario();
		usu = daoUsuario.ObtenerPorEmail((String) session.getAttribute("Nickname"));
		
		request.setAttribute("usu", usu);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarDatosPersonales.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
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
