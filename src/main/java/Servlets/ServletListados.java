package Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatos.ProductosDAO;
import AccesoDatos.UsuariosDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.ProductosDAOImpl;
import AccesoDatosImpl.ProveedoresDAO;
import AccesoDatosImpl.UsuariosDAOImpl;
import AccesoDatos.VentasDAO;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Categoria;
import Entidades.Producto;
import Entidades.Proveedor;
import Entidades.Usuario;
import Entidades.Venta;

/**
 * Servlet implementation class ServletListados
 */
public class ServletListados extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductosDAO daoProductos = new ProductosDAOImpl();
	private DAO<Categoria> daoCategorias = new CategoriasDAO();
	private DAO<Proveedor> daoProveedores = new ProveedoresDAO();
	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();
	private DAO<Venta> daoVentas = new VentasDAOImpl();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletListados() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("Param").equals("Productos")) {
			List<Producto> listaProd = daoProductos.ObtenerTodos();
			request.setAttribute("listaProductos", listaProd);
			request.getRequestDispatcher("ListadoProductos.jsp").forward(request, response);
		}
		if (request.getParameter("Param").equals("Categorias")) {
			List<Categoria> listaCat = daoCategorias.ObtenerTodos();
			request.setAttribute("listaCategorias", listaCat);
			request.getRequestDispatcher("ListadoCategorias.jsp").forward(request, response);
		}
		if (request.getParameter("Param").equals("Proveedores")) {
			List<Proveedor> listaProv = daoProveedores.ObtenerTodos();
			request.setAttribute("listaProveedores", listaProv);
			request.getRequestDispatcher("ListadoProveedores.jsp").forward(request, response);
		}
		if (request.getParameter("Param").equals("Usuarios")) {
			List<Usuario> listaUsu = daoUsuarios.ObtenerTodos();
			request.setAttribute("listaUsuarios", listaUsu);
			request.getRequestDispatcher("ListadoUsuarios.jsp").forward(request, response);
		}
		if (request.getParameter("Param").equals("Ventas")) {
			List<Venta> listaVen = daoVentas.ObtenerTodos();
			request.setAttribute("listaVentas", listaVen);
			request.getRequestDispatcher("ListadoVentas.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
