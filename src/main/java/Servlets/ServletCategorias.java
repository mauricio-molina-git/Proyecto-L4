package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatosImpl.CategoriasDAO;
import Entidades.Categoria;

/**
 * Servlet implementation class ServletCategorias
 */
public class ServletCategorias extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAO<Categoria> daoCategoria = new CategoriasDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCategorias() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("IdModificar") != null) {
			Categoria categoria = daoCategoria.Obtener(Integer.valueOf(request.getParameter("IdModificar")));
			request.setAttribute("categoria", categoria);
			request.getRequestDispatcher("ModificarCategoria.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnAgregar") != null) {
			System.out.println(request.getParameter("txtDescripcion"));
			int estadoOperacion = 2;
			
		Categoria nuevo = new Categoria();
			nuevo.setDescripcion(request.getParameter("txtDescripcion"));
			nuevo.setEstado(true);
			
			if (daoCategoria.Guardar(nuevo)) estadoOperacion = 1;
			
			request.setAttribute("estado", estadoOperacion);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/AgregarCategoria.jsp");
			dispatcher.forward(request, response);
		}
		
		if (request.getParameter("btnModificar") != null) {
			int estadoOperacion = 2;
			Categoria categoria = daoCategoria.Obtener(Integer.valueOf(request.getParameter("IdCategoria")));
			Categoria original = daoCategoria.Obtener(Integer.valueOf(request.getParameter("IdCategoria")));
			request.setAttribute("categoria", original);
			
			categoria.setDescripcion(request.getParameter("txtDescripcion"));
			categoria.setEstado(true);
			
			if (daoCategoria.Guardar(categoria)) estadoOperacion = 1;

			request.setAttribute("estado", estadoOperacion);
			request.getRequestDispatcher("ModificarCategoria.jsp").forward(request, response);
		}
	}

}
