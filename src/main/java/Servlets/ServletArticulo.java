package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatos.ProductosDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.ProductosDAOImpl;
import Entidades.Categoria;

/**
 * Servlet implementation class ServletArticulo
 */
public class ServletArticulo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Categoria> daoCategoria = new CategoriasDAO();
	private ProductosDAO daoProducto = new ProductosDAOImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletArticulo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		int IdProducto = Integer.valueOf(request.getParameter("IdProducto"));
		request.setAttribute("Producto", daoProducto.Obtener(IdProducto));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Articulo.jsp");
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
