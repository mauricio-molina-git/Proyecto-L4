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
import AccesoDatos.UsuariosDAO;
import AccesoDatosImpl.TiposDeUsuarioDAO;
import AccesoDatosImpl.UsuariosDAOImpl;
import Entidades.TipoDeUsuario;
import Entidades.Usuario;
import test.Evaluar;
import test.Funciones;

/**
 * Servlet implementation class ServletListadoUsuarios
 */
public class ServletListadoUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();
	private DAO<TipoDeUsuario> daoTiposUser = new TiposDeUsuarioDAO();
	
	private List<Usuario> listaUsuarios = new ArrayList<Usuario>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletListadoUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		listaUsuarios = daoUsuarios.ObtenerTodos();
		request.setAttribute("listaUsuarios", listaUsuarios);
		request.setAttribute("listaTiposUsuario", daoTiposUser.ObtenerTodos());
		request.getRequestDispatcher("ListadoUsuarios.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnBuscar") != null) {
			String param = request.getParameter("txtBusqueda").toUpperCase();
			request.setAttribute("listaUsuarios",
					Funciones.filtrar(listaUsuarios, u -> u.getNombres().toUpperCase().contains(param)));
			request.setAttribute("listaTiposUsuario", daoTiposUser.ObtenerTodos());
			request.getRequestDispatcher("ListadoUsuarios.jsp").forward(request, response);
		}

		if (request.getParameter("btnFiltrar") != null) {
			List<Evaluar<Usuario>> condiciones = new LinkedList<Evaluar<Usuario>>();

			char selTipo = request.getParameter("selTipoUsuario").charAt(0);
			int selEstado = Integer.valueOf(request.getParameter("selEstado"));

			if(selTipo != '-') {
				condiciones.add(u -> u.getTipoUsuario().getTipo() == selTipo);
			}
			if (selEstado != -1) {
				boolean paramEstado = (selEstado == 1) ? true : false;
				condiciones.add(p -> p.getEstado() == paramEstado);
			}

			if (condiciones.size() != 0)
				listaUsuarios = Funciones.filtrar(listaUsuarios, condiciones);

			request.setAttribute("listaUsuarios", listaUsuarios);
			request.setAttribute("listaTiposUsuario", daoTiposUser.ObtenerTodos());
			request.getRequestDispatcher("ListadoUsuarios.jsp").forward(request, response);
		}

		if (request.getParameter("btnReiniciar") != null)
			doGet(request, response);
		
	}

}
