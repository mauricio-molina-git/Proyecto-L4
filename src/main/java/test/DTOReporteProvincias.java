package test;

import java.io.Serializable;

public class DTOReporteProvincias implements Serializable {
	
	private static final long serialVersionUID = -5427529689496040138L;
	private int idProvincia;
	private int mes;
	private double importe;
	
	public int getIdProvincia() {
		return idProvincia;
	}
	public void setIdProvincia(int idProvincia) {
		this.idProvincia = idProvincia;
	}
	public int getMes() {
		return mes;
	}
	public void setMes(int mes) {
		this.mes = mes;
	}
	public double getImporte() {
		return importe;
	}
	public void setImporte(double importe) {
		this.importe = importe;
	}
	
}
