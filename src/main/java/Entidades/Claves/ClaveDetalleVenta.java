package Entidades.Claves;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ClaveDetalleVenta implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "NumVenta")
	private int NumVenta;
	
	@Column(name = "IdProducto")
	private int IdProducto;

	public ClaveDetalleVenta() {
		// TODO Auto-generated constructor stub
	}
	
	public ClaveDetalleVenta(int numVenta, int idProducto) {
		NumVenta = numVenta;
		IdProducto = idProducto;
	}

	public int getNumVenta() {
		return NumVenta;
	}

	public void setNumVenta(int numVenta) {
		NumVenta = numVenta;
	}

	public int getIdProducto() {
		return IdProducto;
	}

	public void setIdProducto(int idProducto) {
		IdProducto = idProducto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + IdProducto;
		result = prime * result + NumVenta;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof ClaveDetalleVenta))
			return false;
		ClaveDetalleVenta other = (ClaveDetalleVenta) obj;
		if (IdProducto != other.IdProducto)
			return false;
		if (NumVenta != other.NumVenta)
			return false;
		return true;
	}
	
}

