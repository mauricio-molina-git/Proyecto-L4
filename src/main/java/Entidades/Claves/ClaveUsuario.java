package Entidades.Claves;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ClaveUsuario implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "DNI", length = 8)
	private String DNI;
	
	@Column(name = "TipoDeDNI", length = 8)
	private String TipoDNI;

	public ClaveUsuario() {
		// TODO Auto-generated constructor stub
	}

	public ClaveUsuario(String DNI, String tipoDNI) {
		this.DNI = DNI;
		this.TipoDNI = tipoDNI;
	}

	public String getDNI() {
		return DNI;
	}

	public void setDNI(String dNI) {
		DNI = dNI;
	}

	public String getTipoDNI() {
		return TipoDNI;
	}

	public void setTipoDNI(String tipoDNI) {
		TipoDNI = tipoDNI;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((DNI == null) ? 0 : DNI.hashCode());
		result = prime * result + ((TipoDNI == null) ? 0 : TipoDNI.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof ClaveUsuario))
			return false;
		ClaveUsuario other = (ClaveUsuario) obj;
		if (DNI == null) {
			if (other.DNI != null)
				return false;
		} else if (!DNI.equals(other.DNI))
			return false;
		if (TipoDNI == null) {
			if (other.TipoDNI != null)
				return false;
		} else if (!TipoDNI.equals(other.TipoDNI))
			return false;
		return true;
	}
	
}

