package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AccesoDatos.DAO;
import AccesoDatos.ProductosDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.ProductosDAOImpl;
import Entidades.Categoria;
import Entidades.Producto;

/**
 * Servlet implementation class ServletMenuPrincipal
 */
public class ServletPrincipal extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAO<Categoria> daoCategoria = new CategoriasDAO();
	private ProductosDAO daoProducto = new ProductosDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPrincipal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		int paginaActual = 1;
		int RegistrosPorPagina = 2;
		try {
			paginaActual = Integer.valueOf(request.getParameter("paginaActual"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		int RegistrosASaltar = RegistrosPorPagina * (paginaActual - 1);
		
		List<Producto> listaPro = new ArrayList<Producto>();
		int filas;
		
		if(request.getParameter("btnBorrarFiltro") != null) {
			session.removeAttribute("minimo");
			session.removeAttribute("maximo");
			session.removeAttribute("ordenfiltro");
		}
		
		String precioFiltro = " ";
		String ordenfiltro = " ";

		if (request.getParameter("maximo") != null && request.getParameter("minimo") != null
			&& request.getParameter("btnFiltrar")!=null) {
			try {
				int minimo = Integer.valueOf(request.getParameter("minimo"));
				int maximo = Integer.valueOf(request.getParameter("maximo"));
				precioFiltro = " where PrecioUnitario > " + minimo + " AND PrecioUnitario < " + maximo + " ";
				session.setAttribute("minimo", minimo);
				session.setAttribute("maximo", maximo);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		if(session.getAttribute("minimo") != null && session.getAttribute("minimo") != null) {
			int minimo = (int) session.getAttribute("minimo");
			int maximo = (int) session.getAttribute("maximo");
			precioFiltro = " where PrecioUnitario > " + minimo + " AND PrecioUnitario < " + maximo + " ";
		}

		
		if (request.getParameter("Filtrolista") != null) {
			ordenfiltro = request.getParameter("Filtrolista");
			session.setAttribute("ordenfiltro", ordenfiltro);
		}
		
		if (session.getAttribute("ordenfiltro") != null) {
			ordenfiltro = (String) session.getAttribute("ordenfiltro");
		}
		
		
		if (request.getParameter("Categoria") == null) {
			listaPro = daoProducto.ObtenerPorFragmento(RegistrosPorPagina, RegistrosASaltar, ordenfiltro, precioFiltro);
			filas = daoProducto.ObtenerCantidadRegistros();
		} else {
			int IdCategoria = Integer.valueOf(request.getParameter("Categoria"));
			String filtroCategoria = " ";
			if (precioFiltro != " ") {
				filtroCategoria = " AND IdCategoria = " + IdCategoria + " ";
			} else {
				filtroCategoria = " where IdCategoria = " + IdCategoria + " ";
			}
			listaPro = daoProducto.ObtenerPorFragmento(RegistrosPorPagina, RegistrosASaltar, ordenfiltro, precioFiltro,
					filtroCategoria);
			filas = daoProducto.ObtenerCantidadRegistrosPorCategoria(IdCategoria);
	        request.setAttribute("Categoria", IdCategoria);
	        Categoria cat = new Categoria();
	        cat = daoCategoria.Obtener(IdCategoria);
	        request.setAttribute("NombreCategoria", cat.getDescripcion());
		}
		
		int numeroDePaginas = filas / RegistrosPorPagina;
		
		if (filas % RegistrosPorPagina > 0) {
			numeroDePaginas++;
        }
		
		
		request.setAttribute("listaProductos", listaPro);
		request.setAttribute("numeroDePaginas", numeroDePaginas);
        request.setAttribute("paginaActual", paginaActual);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Principal.jsp");
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
