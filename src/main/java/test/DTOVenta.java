package test;

import java.io.Serializable;

@SuppressWarnings("serial")
public class DTOVenta implements Serializable {
	
	private String fechaVenta;
	private String DNI;
	private String nombreCliente;
	private String IDCliente;
	private double importe;
	private String metodoDePago;
	
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
	}
	public String getNombreCliente() {
		return nombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	public String getIDCliente() {
		return IDCliente;
	}
	public void setIDCliente(String iDCliente) {
		IDCliente = iDCliente;
	}
	public double getImporte() {
		return importe;
	}
	public void setImporte(double importe) {
		this.importe = importe;
	}
	public String getMetodoDePago() {
		return metodoDePago;
	}
	public void setMetodoDePago(String metodoDePago) {
		this.metodoDePago = metodoDePago;
	}
	public String getFechaVenta() {
		return fechaVenta;
	}
	public void setFechaVenta(String fechaVenta) {
		this.fechaVenta = fechaVenta;
	}
	
}
