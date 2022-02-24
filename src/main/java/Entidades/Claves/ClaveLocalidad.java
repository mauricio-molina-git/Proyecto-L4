package Entidades.Claves;

import java.io.Serializable;

public class ClaveLocalidad implements Serializable {
	private static final long serialVersionUID = 1L;
	
	protected int IdProvincia;
	
	protected int IdLocalidad;

	public ClaveLocalidad() {
		// TODO Auto-generated constructor stub
	}
	
	public ClaveLocalidad(int idProvincia, int idLocalidad) {
		IdProvincia = idProvincia;
		IdLocalidad = idLocalidad;
	}
	
	public int getIdProvincia() {
		return IdProvincia;
	}

	public void setIdProvincia(int idProvincia) {
		IdProvincia = idProvincia;
	}

	public int getIdLocalidad() {
		return IdLocalidad;
	}

	public void setIdLocalidad(int idLocalidad) {
		IdLocalidad = idLocalidad;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + IdLocalidad;
		result = prime * result + IdProvincia;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof ClaveLocalidad))
			return false;
		ClaveLocalidad other = (ClaveLocalidad) obj;
		if (IdLocalidad != other.IdLocalidad)
			return false;
		if (IdProvincia != other.IdProvincia)
			return false;
		return true;
	}
	
}
