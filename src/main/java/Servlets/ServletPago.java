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
import AccesoDatosImpl.CategoriasDAO;
import Entidades.Categoria;

/**
 * Servlet implementation class ServletPago
 */
public class ServletPago extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Categoria> daoCategoria = new CategoriasDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPago() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		if(session.getAttribute("Nickname")==null) {
			request.setAttribute("Carrito", "true");
			RequestDispatcher dispatcher = request.getRequestDispatcher("ServletLogin");
			dispatcher.forward(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Pago.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

