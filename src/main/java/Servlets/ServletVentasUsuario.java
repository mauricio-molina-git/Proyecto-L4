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
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Categoria;
import Entidades.Venta;
import Entidades.Claves.ClaveUsuario;

/**
 * Servlet implementation class ServletVentasUsuario
 */
public class ServletVentasUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Categoria> daoCategoria = new CategoriasDAO();
	private DAO<Venta> daoVentas = new VentasDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletVentasUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		ClaveUsuario claveUsuario = new ClaveUsuario();
		claveUsuario = (ClaveUsuario) session.getAttribute("usuario");
		
		List<Venta> listaVen = ((VentasDAOImpl) daoVentas).ObtenerPorCliente(claveUsuario.getTipoDNI(),claveUsuario.getDNI());
		request.setAttribute("listaVentas", listaVen);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/VentasUsuario.jsp");
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
