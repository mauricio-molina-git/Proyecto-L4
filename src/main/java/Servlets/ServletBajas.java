package Servlets;

import java.io.IOException;
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
import Entidades.Categoria;
import Entidades.Producto;
import Entidades.Proveedor;
import Entidades.Usuario;

/**
 * Servlet implementation class ServletBajas
 */
public class ServletBajas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAO<Categoria> daoCategorias = new CategoriasDAO();
	private ProductosDAO daoProductos = new ProductosDAOImpl();
	private UsuariosDAO daoUsuarios = new UsuariosDAOImpl();
    private DAO<Proveedor> daoProveedores = new ProveedoresDAO();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBajas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("IdCategoria") != null) {
			Categoria categoria = daoCategorias.Obtener(Integer.valueOf(request.getParameter("IdCategoria")));
			categoria.setEstado(false);
			daoCategorias.Guardar(categoria);
			request.getRequestDispatcher("ServletListadoCategorias").forward(request, response);
		}
		if (request.getParameter("IdProducto") != null) {
			Producto producto = daoProductos.Obtener(Integer.valueOf(request.getParameter("IdProducto")));
			producto.setEstado(false);
			daoProductos.Guardar(producto);
			request.getRequestDispatcher("ServletListadoProductos").forward(request, response);
		}
		if (request.getParameter("IdProveedor") != null) {
			Proveedor proveedor = daoProveedores.Obtener(Integer.valueOf(request.getParameter("IdProveedor")));
			proveedor.setEstado(false);
			daoProveedores.Guardar(proveedor);
			request.getRequestDispatcher("ServletListadoProveedores").forward(request, response);
		}
		if (request.getParameter("IdUsuario") != null) {
			Usuario usuario = daoUsuarios.ObtenerPorEmail(request.getParameter("IdUsuario"));
			usuario.setEstado(false);
			daoUsuarios.Guardar(usuario);
			request.getRequestDispatcher("ServletListadoUsuarios").forward(request, response);
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
