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
import AccesoDatosImpl.MetodoPagoDAOImpl;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.DetalleVenta;
import Entidades.Producto;
import Entidades.MetodoDePago;
import Entidades.Venta;
import test.Diccionario;
import test.Funciones;
import test.Par;
import test.ProductoVendido;

/**
 * Servlet implementation class ServletReportePagos
 */
public class ServletReportePagos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private VentasDAO daoVentas = new VentasDAOImpl(); 
	private DAO<MetodoDePago> daoMetodos = new MetodoPagoDAOImpl();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReportePagos() {
        super();
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

		Diccionario<String, Integer> totalesXMetodo = new Diccionario<String, Integer>();

		agruparDatos(totalesXMetodo, fechaInicio, fechaFin);

		totalesXMetodo = calcularPorcentajesXProveedor(totalesXMetodo);

		request.setAttribute("metodos", Funciones.toJavaScriptArray(totalesXMetodo.getLlaves()));
		request.setAttribute("porcentajes", Funciones.toJavaScriptArray(totalesXMetodo.getValores()));	
		
		System.out.println("metodos: " + Funciones.toJavaScriptArray(totalesXMetodo.getLlaves()));
		System.out.println("porcentajes: " + Funciones.toJavaScriptArray(totalesXMetodo.getValores()));
		
		request.getRequestDispatcher("ReportePagos.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	private void agruparDatos(Diccionario<String, Integer> totalesXMetodo, LocalDate fechaInicio, LocalDate fechaFin) {

		List<Venta> ventas = daoVentas.ObtenerPorPeriodo(fechaInicio, fechaFin);
		if(ventas == null)
		{
			System.out.println("Ventas es NULL");
		}
		
		List<MetodoDePago> metodos = daoMetodos.ObtenerTodos();
		
		for(MetodoDePago metodo : metodos) {
			String key = String.copyValueOf(new char[] {metodo.getIdMetodo() });
			totalesXMetodo.add(key, 0);
		}

		for (Venta v : ventas) {
			String key = String.copyValueOf(new char[] {v.getMetodoPago().getIdMetodo() });
			int cant = totalesXMetodo.getValor(key);
			totalesXMetodo.add(key, cant+1);
		}

	}
	
	private Diccionario<String, Integer> calcularPorcentajesXProveedor(Diccionario<String, Integer> totalesXMetodo) {

		int total = 0;
		for (Par<?, ?> par : totalesXMetodo)
			total += (Integer) par.getValor();

		if(total > 0)
		{
			for (Par<?, Integer> par : totalesXMetodo) {
				Integer percent = ((Integer) par.getValor()) * 100 / total;
				par.setValor(percent);
			}
		}
		
		return totalesXMetodo;
	}
	
}
