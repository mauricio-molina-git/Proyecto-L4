package Servlets.Listados;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatosImpl.CategoriasDAO;
import Entidades.Categoria;
import test.Funciones;

/**
 * Servlet implementation class ServletListadoCategorias
 */
public class ServletListadoCategorias extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAO<Categoria> daoCategorias = new CategoriasDAO();
	private List<Categoria> listaCategorias = new ArrayList<Categoria>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletListadoCategorias() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		listaCategorias = daoCategorias.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCategorias);
		request.getRequestDispatcher("ListadoCategorias.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("btnBuscar") != null) {
			String param = request.getParameter("txtBusqueda").toUpperCase();
			request.setAttribute("listaCategorias", Funciones.filtrar(listaCategorias, c -> c.getDescripcion().toUpperCase().contains(param)));
			request.getRequestDispatcher("ListadoCategorias.jsp").forward(request, response);
		}
		
		if (request.getParameter("btnFiltrar") != null) {
			int selEstado = Integer.valueOf(request.getParameter("selEstado"));
			if (selEstado != -1) {
				boolean param = (selEstado == 1)? true : false;
				request.setAttribute("listaCategorias", Funciones.filtrar(listaCategorias, c -> c.getEstado()==param));
				request.getRequestDispatcher("ListadoCategorias.jsp").forward(request, response);
			}
		}
		
		if (request.getParameter("btnReiniciar") != null) 
			doGet(request, response);
		
	}

}
