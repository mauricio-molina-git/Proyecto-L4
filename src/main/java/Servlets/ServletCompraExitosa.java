package Servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import AccesoDatos.DAO;
import AccesoDatos.ProductosDAO;
import AccesoDatos.UsuariosDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.ProductosDAOImpl;
import AccesoDatosImpl.UsuariosDAOImpl;
import AccesoDatos.VentasDAO;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Carrito;
import Entidades.Categoria;
import Entidades.DetalleVenta;
import Entidades.MetodoDePago;
import Entidades.Producto;
import Entidades.Usuario;
import Entidades.Venta;
import Entidades.Claves.ClaveUsuario;

/**
 * Servlet implementation class ServletCompraExitosa
 */
public class ServletCompraExitosa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAO<Categoria> daoCategoria = new CategoriasDAO();
	private DAO<Venta> daoVenta = new VentasDAOImpl();
	private UsuariosDAO daoUsuario = new UsuariosDAOImpl();
	private ProductosDAO daoProducto = new ProductosDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCompraExitosa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		List<Categoria> listaCat = daoCategoria.ObtenerTodos();
		request.setAttribute("listaCategorias", listaCat);
		
		Venta venta = new Venta();
		
		Usuario usuario = daoUsuario.Obtener((ClaveUsuario)session.getAttribute("usuario"));
		venta.setCliente(usuario);
		 
		venta.setFechaVenta(LocalDate.now());
		
		if(request.getParameter("metodoPago") != null)
		{
			String s = request.getParameter("metodoPago");
			char c = s.charAt(0);
					
			if(c == 'D')
			{
				MetodoDePago metodoPago = new MetodoDePago();
				metodoPago.setIdMetodo(c);
				metodoPago.setDescripcion("Débito");
				venta.setMetodoPago(metodoPago);
			}
			if(c == 'C')
			{
				MetodoDePago metodoPago = new MetodoDePago();
				metodoPago.setIdMetodo(c);
				metodoPago.setDescripcion("Crédito");
				venta.setMetodoPago(metodoPago);
			}
		}
			
		@SuppressWarnings("unchecked")
		List<Carrito> listaCarrito = (List<Carrito>) session.getAttribute("listaCarrito");
		LinkedList<DetalleVenta> detalle = new LinkedList<DetalleVenta>();
		
		double importe = 0;
		for (Carrito producto : listaCarrito) {
			DetalleVenta det = new DetalleVenta();
			int cantidad = producto.getCantidad();
			double precio = producto.getPrecioUnitario();
			importe += (cantidad * precio);
			
			det.setCantidad((short)cantidad);
			det.setPrecioVenta(precio);
			
			Producto prod = new Producto();
			prod = daoProducto.Obtener(producto.getIdProducto());
			det.setProducto(prod);
			
			detalle.add(det);
		}
		
		venta.setImporte(importe);
		venta.setDetalle(detalle);
		daoVenta.Guardar(venta);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/CompraExitosa.jsp");
		dispatcher.forward(request, response);
	}

}
