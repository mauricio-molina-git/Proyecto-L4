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

import AccesoDatos.DAO;
import AccesoDatos.VentasDAO;
import AccesoDatosImpl.CategoriasDAO;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Categoria;
import Entidades.DetalleVenta;
import Entidades.Producto;
import Entidades.Venta;
import test.Diccionario;
import test.Funciones;
import test.Par;
import test.ProductoVendido;

/**
 * Servlet implementation class ServletReporteCategorias
 */
public class ServletReporteCategorias extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private VentasDAO daoVentas = new VentasDAOImpl(); 
	private DAO<Categoria> daoCategorias = new CategoriasDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletReporteCategorias() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		Diccionario<String, Integer> totalesXCategoria = new Diccionario<String, Integer>();

		agruparDatos(productosVendidos, totalesXCategoria, fechaInicio, fechaFin);

		List<ProductoVendido> productosMasVendidos = calcularProductosMasVendidosXCategoria(productosVendidos);
		totalesXCategoria = calcularPorcentajesXCategoria(totalesXCategoria, 4);

		request.setAttribute("productos", productosMasVendidos);
		request.setAttribute("categorias", Funciones.toJavaScriptArray(totalesXCategoria.getLlaves()));
		request.setAttribute("porcentajes", Funciones.toJavaScriptArray(totalesXCategoria.getValores()));

		System.out.println("CATEGORIAS: " + Funciones.toJavaScriptArray(totalesXCategoria.getLlaves()));
		System.out.println("PORCENTAJES: " + Funciones.toJavaScriptArray(totalesXCategoria.getValores()));

		request.getRequestDispatcher("ReporteCategorias.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void agruparDatos(List<ProductoVendido> productosVendidos, Diccionario<String, Integer> totalesXCategoria,
			LocalDate fechaInicio, LocalDate fechaFin) {

		List<Venta> ventas = daoVentas.ObtenerPorPeriodo(fechaInicio, fechaFin);
		List<Categoria> categorias = daoCategorias.ObtenerTodos();

		for (Categoria c : categorias)
			totalesXCategoria.add(c.getDescripcion(), 0);

		for (Venta v : ventas) {
			for (DetalleVenta det : v.getDetalle()) {
				Producto producto = det.getProducto();

				ProductoVendido prodVendido = new ProductoVendido();
				prodVendido.id = producto.getCategoria().getIdCategoria();
				prodVendido.nombre = producto.getCategoria().getDescripcion();
				prodVendido.cantVendida = det.getCantidad();

				int index = productosVendidos.indexOf(prodVendido);
				if (index == -1)
					productosVendidos.add(prodVendido);
				else
					productosVendidos.get(index).cantVendida += det.getCantidad();
			}
		}
		
		for(ProductoVendido v : productosVendidos) {
			totalesXCategoria.add(v.getNombre(), v.getCantVendida());
		}

	}

	private List<ProductoVendido> calcularProductosMasVendidosXCategoria(List<ProductoVendido> productosVendidos) {

		LinkedList<ProductoVendido> masVendidos = new LinkedList<ProductoVendido>();

		while (productosVendidos.isEmpty() == false) {
			ProductoVendido max = productosVendidos.get(0);
			String categoria = max.nombre;

			LinkedList<ProductoVendido> descartados = new LinkedList<ProductoVendido>();
			for (int i = 1; i < productosVendidos.size(); ++i) {
				ProductoVendido prod = productosVendidos.get(i);
				if (prod.nombre == categoria) {
					if (max.cantVendida < prod.cantVendida) {
						ProductoVendido aux = max;
						max = prod;
						descartados.add(aux);
					} else
						descartados.add(prod);
				}
			}
			masVendidos.add(max);
			descartados.add(max);
			productosVendidos.removeAll(descartados);
		}

		return masVendidos;
	}

	private Diccionario<String, Integer> calcularPorcentajesXCategoria(Diccionario<String, Integer> totalesXCategoria,
			int cantMejores) {

		int total = 0;
		for (Par<?, ?> par : totalesXCategoria)
			total += (Integer) par.getValor();

		for (Par<?, Integer> par : totalesXCategoria) {
			Integer percent = 0;
			if (total != 0)
				percent = ((Integer) par.getValor()) * 100 / total;
			par.setValor(percent);
		}

		totalesXCategoria.sort((p1, p2) -> {
			if (p1.getValor().equals(p2.getValor()))
				return 0;
			else
				return (p1.getValor() > p2.getValor()) ? -1 : 1;
		});

		Diccionario<String, Integer> mejoresPorcentajes = new Diccionario<String, Integer>();

		if (total == 0)
			mejoresPorcentajes.add("Sin resultados", 0);
		else {
			for (int i = 0; i < cantMejores; ++i) {
				if (totalesXCategoria.get(i).getValor() != 0)
					mejoresPorcentajes.add(totalesXCategoria.get(i));
			}

			int otros = 100;
			for (Par<?, Integer> par : mejoresPorcentajes)
				otros -= par.getValor();

			mejoresPorcentajes.add("Otros", otros);
		}

		return mejoresPorcentajes;
	}

}
