package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AccesoDatos.UsuariosDAO;
import AccesoDatosImpl.UsuariosDAOImpl;
import Entidades.Usuario;
import Entidades.Claves.ClaveUsuario;

/**
 * Servlet implementation class ServletUsuario
 */
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		session.removeAttribute("Nickname");
		session.removeAttribute("nombreusuario");
		session.removeAttribute("usuario");

		RequestDispatcher dispatcher = request.getRequestDispatcher("ServletPrincipal");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		boolean administrador = false;
		if (request.getParameter("btnIniciarSesion") != null) {

			//List<Usuario> listaUsu = daoUsuarios.ObtenerTodos();
			List<Usuario> listaUsu = daoUsuarios.ObtenerActivos();

			String nickname = request.getParameter("email");
			String password = request.getParameter("password");

			for (Usuario usuario : listaUsu) {
				if (nickname.equals(usuario.geteMail()) && password.equals(usuario.getPassword())) {
					session.setAttribute("Nickname", usuario.geteMail());
					session.setAttribute("nombreusuario", usuario.getNombres());
					ClaveUsuario claveUsuario = new ClaveUsuario();
					claveUsuario = usuario.getIdUsuario();
					session.setAttribute("usuario", claveUsuario);
					if (usuario.getTipoUsuario().getTipo() == 'A') {
						administrador = true;
					}
					break;
				}
			}
		}
		RequestDispatcher dispatcher;

		if (administrador == true) {
			dispatcher = request.getRequestDispatcher("AgregarProductos.jsp");
		} else {
			dispatcher = request.getRequestDispatcher("ServletPrincipal");
		}
		dispatcher.forward(request, response);
	}

}
