package Servlets.Listados;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AccesoDatos.DAO;
import AccesoDatos.VentasDAO;
import AccesoDatosImpl.VentasDAOImpl;
import Entidades.Venta;
import test.Funciones;

/**
 * Servlet implementation class ServletListadoVentas
 */
public class ServletListadoVentas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAO<Venta> daoVentas = new VentasDAOImpl();
	private ArrayList<Venta> listaVentas = new ArrayList<Venta>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletListadoVentas() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		listaVentas = (ArrayList<Venta>) daoVentas.ObtenerTodos();
		Funciones.invertirArray(listaVentas);
		request.setAttribute("listaVentas", listaVentas);
		request.getRequestDispatcher("ListadoVentas.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("btnBuscar") != null) {
			String dni = request.getParameter("txtBusquedaDNI");
			String campoEmail = request.getParameter("txtBusquedaEmail");
			String email = (campoEmail.isEmpty()) ? "-" : campoEmail.toUpperCase();

			List<Venta> resultadoBusqueda = Funciones.filtrar(listaVentas,
					v -> v.getCliente().getIdUsuario().getDNI().equals(dni)
							|| v.getCliente().geteMail().toUpperCase().contains(email));
			
			request.setAttribute("listaVentas", resultadoBusqueda);
			request.getRequestDispatcher("ListadoVentas.jsp").forward(request, response);
		}

		if (request.getParameter("btnFiltrar") != null) {
			String fechaInicial = request.getParameter("FechaInicial");
			String fechaFinal = request.getParameter("FechaFinal");

			if (!fechaInicial.isEmpty() && !fechaFinal.isEmpty()) {
				LocalDate dateIni = LocalDate.parse(fechaInicial);
				LocalDate dateFin = LocalDate.parse(fechaFinal);

				listaVentas = Funciones.filtrar(listaVentas,
						v -> v.getFechaVenta().isAfter(dateIni) && v.getFechaVenta().isBefore(dateFin));
			}

			request.setAttribute("listaVentas", listaVentas);
			request.getRequestDispatcher("ListadoVentas.jsp").forward(request, response);
		}

		if (request.getParameter("btnReiniciar") != null)
			doGet(request, response);

	}

}
