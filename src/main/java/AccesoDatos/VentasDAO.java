package AccesoDatos;

import java.time.LocalDate;
import java.util.List;

import Entidades.Venta;

public interface VentasDAO extends DAO<Venta> {

	List<Venta> ObtenerPorPeriodo(LocalDate fechaInicio, LocalDate fechaFin);
	
	List<Venta> ObtenerPorAnioMes(int anio, int mes);
	
	List<Venta> ObtenerPorAnio(int anio);
	
	List<Venta> ObtenerPorCliente(String tipodni, String dni);
	
}
