package AccesoDatosImpl;

import java.time.LocalDate;
import java.util.List;

import AccesoDatos.VentasDAO;
import AccesoDatos.jpaDAO;
import Entidades.DetalleVenta;
import Entidades.Venta;

public class VentasDAOImpl extends jpaDAO implements VentasDAO {

	@Override
	public boolean Guardar(Venta entidad) {
		boolean resultado = false;
		try {
			manager.getTransaction().begin();
			manager.persist(entidad);
			List<DetalleVenta> detalle = entidad.getDetalle();
			detalle.forEach(d -> {
				d.setVenta(entidad);
				manager.persist(d);
			});
			manager.getTransaction().commit();
			manager.clear();
			resultado = true;
		} catch (Exception e) {
			manager.getTransaction().rollback();
		}
		return resultado;
	}

	@Override
	public Venta Obtener(Object clavePrimaria) {
		return manager.find(Venta.class, clavePrimaria);
	}

	@Override
	public List<Venta> ObtenerTodos() {
		return manager.createQuery("FROM Venta", Venta.class).getResultList();
	}

	@Override
	public List<Venta> ObtenerPorPeriodo(LocalDate fechaInicio, LocalDate fechaFin) {
		return manager.createQuery("FROM Venta where FechaVenta between ('" + fechaInicio.toString() + "') AND ('"
				+ fechaFin.toString() + "')", Venta.class).getResultList();
	}

	@Override
	public List<Venta> ObtenerPorAnioMes(int anio, int mes) {
		return manager.createQuery("FROM Venta where year(FechaVenta) = " + anio + " AND month(FechaVenta) = " + mes,
				Venta.class).getResultList();
	}

	@Override
	public List<Venta> ObtenerPorAnio(int anio) {
		return manager.createQuery("FROM Venta where year(FechaVenta) = " + anio, Venta.class).getResultList();
	}
	
	@Override
	public List<Venta> ObtenerPorCliente(String tipodni, String dni) {
		return manager.createQuery("FROM Venta where DNICliente = '" + dni + "' AND TipoDNICliente = '" + tipodni + "'", Venta.class).getResultList();
	}

}
