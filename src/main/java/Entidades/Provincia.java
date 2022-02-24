package Entidades;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "provincias")
public class Provincia {

	@Id
	@Column(name = "IdProvincia")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdProvincia;

	@Column(name = "NombreProvincia", length = 30, nullable = false)
	private String nombre;
	
	@OneToMany(mappedBy = "provincia")
	private List<Localidad> localidades = new ArrayList<Localidad>();

	public Provincia() {
		// TODO Auto-generated constructor stub
	}
	
	public Provincia(int idProvincia, String nombre) {
		IdProvincia = idProvincia;
		this.nombre = nombre;
	}


	public int getIdProvincia() {
		return IdProvincia;
	}

	public void setIdProvincia(int idProvincia) {
		IdProvincia = idProvincia;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return "Provincia [IdProvincia=" + IdProvincia + ", nombre=" + nombre + "]";
	}

	public List<Localidad> getLocalidades() {
		return localidades;
	}

	public void setLocalidades(List<Localidad> localidades) {
		this.localidades = localidades;
	}

	@Override
	public boolean equals(Object obj) {
		Provincia aux = (Provincia) obj;
		return this.IdProvincia == aux.IdProvincia;
	}
	
}
