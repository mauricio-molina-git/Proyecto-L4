package Servlets.Reportes;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.Empty;

import AccesoDatos.DAO;
import AccesoDatos.VentasDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.ProveedoresDAO;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Categoria;
import Entidades.DetalleVenta;
import Entidades.Producto;
import Entidades.Proveedor;
import Entidades.Venta;
import test.Diccionario;
import test.Funciones;
import test.Par;
import test.ProductoVendido;
import test.ProductoVendido;

/**
 * Servlet implementation class ServletReporteProveedores
 */
public class ServletReporteProveedores extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private VentasDAO daoVentas = new VentasDAOImpl(); 
	private DAO<Proveedor> daoProveedores = new ProveedoresDAO();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReporteProveedores() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		LocalDate fechaInicio = LocalDate.of(1, 1, 1);
		LocalDate fechaFin = LocalDate.of(1, 1, 1);

		if (request.getParameter("btnAceptar") != null) {
			try {
				fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
				fechaFin = LocalDate.parse(request.getParameter("fechaFin"));
			} catch (Exception e) {
			}
		} else {
			LocalDate hoy = LocalDate.now();
			if (hoy.getMonthValue() <= 6) {
				fechaInicio = LocalDate.of(hoy.getYear(), 1, 1);
				fechaFin = LocalDate.of(hoy.getYear(), 6, 30);
			} else {
				fechaInicio = LocalDate.of(hoy.getYear(), 7, 1);
				fechaFin = LocalDate.of(hoy.getYear(), 12, 31);
			}
		}
			ArrayList<ProductoVendido> productosVendidos = new ArrayList<ProductoVendido>();
			Diccionario<String, Integer> totalesXProveedor = new Diccionario<String, Integer>();

			agruparDatos(productosVendidos, totalesXProveedor, fechaInicio, fechaFin);

			totalesXProveedor = calcularPorcentajesXProveedor(totalesXProveedor);

			request.setAttribute("proveedores", Funciones.toJavaScriptArray(totalesXProveedor.getLlaves()));
			request.setAttribute("porcentajes", Funciones.toJavaScriptArray(totalesXProveedor.getValores()));	
			
			request.getRequestDispatcher("ReporteProveedores.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	private void agruparDatos(List<ProductoVendido> productosVendidos, Diccionario<String, Integer> totalesXProveedor,
			LocalDate fechaInicio, LocalDate fechaFin) {

		List<Venta> ventas = daoVentas.ObtenerPorPeriodo(fechaInicio, fechaFin);
		List<Proveedor> proveedores = daoProveedores.ObtenerTodos();

		for (Venta v : ventas) {
			for (DetalleVenta det : v.getDetalle()) {
				Producto producto = det.getProducto();

				ProductoVendido prodVendido = new ProductoVendido();
				prodVendido.id = producto.getProveedor().getIdProveedor();
				prodVendido.nombre = producto.getProveedor().getNombre();

				int index = productosVendidos.indexOf(prodVendido);
				if (index < 0)
				{
					prodVendido.cantVendida = det.getCantidad();
					productosVendidos.add(prodVendido);
				}
				else
				{
					productosVendidos.get(index).cantVendida += det.getCantidad();
				}
			}
		}
		
		for(ProductoVendido v : productosVendidos) {
			totalesXProveedor.add(v.getNombre(), v.getCantVendida());
		}

	}
	
	private Diccionario<String, Integer> calcularPorcentajesXProveedor(Diccionario<String, Integer> totalesXProveedor) {

		int total = 0;
		for (Par<?, ?> par : totalesXProveedor)
			total += (Integer) par.getValor();

		for (Par<?, Integer> par : totalesXProveedor) {
			Integer percent = ((Integer) par.getValor()) * 100 / total;
			par.setValor(percent);
		}
		
		// retorna un valor negativo si el valor de p2 es menor que el de p1
		totalesXProveedor.sort((p1, p2) -> {
			return p2.getValor() - p1.getValor();
		});
		
		return totalesXProveedor;
	}
	
}
