package Servlets.Reportes;

import java.io.IOException;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatos.VentasDAO;
import AccesoDatosImpl.ProvinciasDAO;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Provincia;
import Entidades.Venta;
import test.DTOReporteProvincias;
import test.Funciones;

/**
 * Servlet implementation class ServletReporteProvincias
 */
public class ServletReporteProvincias extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private VentasDAO daoVentas = new VentasDAOImpl();
	private DAO<Provincia> daoProvincias = new ProvinciasDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletReporteProvincias() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int anio;
		if (request.getParameter("btnAceptar") != null) {
			try {
				anio = Integer.valueOf(request.getParameter("txtAnio"));
			} catch (Exception e) {
				anio = LocalDate.now().getYear();
			}
		} else
			anio = LocalDate.now().getYear();

		List<Venta> ventas = daoVentas.ObtenerPorAnio(anio);

		List<Serializable> datosVentas = Funciones.mapear(ventas, e -> {
			Venta venta = (Venta) e;
			DTOReporteProvincias registro = new DTOReporteProvincias();
			registro.setIdProvincia(venta.getCliente().getLocalidad().getProvincia().getIdProvincia());
			registro.setMes(venta.getFechaVenta().getMonthValue());
			registro.setImporte(venta.getImporte());
			return registro;
		});

		request.setAttribute("listaProvincias", daoProvincias.ObtenerTodos());
		request.setAttribute("datosVentas", Funciones.toJavaScriptObjectArray(datosVentas));
		request.getRequestDispatcher("ReporteProvincias.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
