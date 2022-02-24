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
import Entidades.Carrito;
import Entidades.Categoria;
import Entidades.Producto;

/**
 * Servlet implementation class ServletCarrito
 */
public class ServletCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Categoria> daoCategoria = new CategoriasDAO();
	private ProductosDAO daoProductos = new ProductosDAOImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCarrito() {
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
		
		List<Carrito> listaCarrito = new ArrayList<Carrito>();
		
		
		if (session.getAttribute("listaCarrito")!=null) {
			listaCarrito = (List<Carrito>) session.getAttribute("listaCarrito");
		}
		
		if(request.getParameter("IdBaja")!=null) {
			int IdBaja = Integer.valueOf(request.getParameter("IdBaja"));
			
			Carrito car = new Carrito();
			
			for (Carrito items : listaCarrito) {
				if(items.getIdProducto()==IdBaja) {
					car = items;
					break;
				}
			}
			
			listaCarrito.remove(car);
		}
		
		int resultado = 0;
		for (Carrito carrito : listaCarrito) {
			resultado += (int) (carrito.getPrecioUnitario() * carrito.getCantidad());
		}
		
		session.setAttribute("listaCarrito", listaCarrito);
		request.setAttribute("Resultado", resultado);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Carrito.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		List<Carrito> listaCarrito = new ArrayList<Carrito>();
		
		
		if (session.getAttribute("listaCarrito")!=null) {
			listaCarrito = (List<Carrito>) session.getAttribute("listaCarrito");
		}
		
		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		
		if(request.getParameter("btnAgregar") != null) {
			int cantidad = Integer.valueOf(request.getParameter("Cantidad"));
			int id = Integer.valueOf(request.getParameter("IdProducto"));
			
			Producto producto = new Producto();
			producto = daoProductos.Obtener(id);
			
			Carrito car = new Carrito();
			car.setIdProducto(producto.getIdProducto());
			car.setNombre(producto.getNombre());
			car.setPrecioUnitario(producto.getPrecioUnitario());
			car.setCantidad(cantidad);
			car.setImagen(producto.getImagen());
			
			listaCarrito.add(car);
			
			session.setAttribute("listaCarrito", listaCarrito);
		}
		
		int resultado = 0;
		for (Carrito carrito : listaCarrito) {
			resultado += (int) (carrito.getPrecioUnitario() * carrito.getCantidad());
		}
		
		request.setAttribute("Resultado", resultado);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Carrito.jsp");
		dispatcher.forward(request, response);
	}

}

