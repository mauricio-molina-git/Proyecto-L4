package Entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import Entidades.Claves.ClaveLocalidad;

@Entity
@IdClass(value = ClaveLocalidad.class)
@Table(name = "localidades")
public class Localidad {
	
	@Id
	@Column(name = "IdProvincia")
	private int IdProvincia;
	
	@Id
	@Column(name = "IdLocalidad")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int IdLocalidad;
	
	@Column(name = "NombreLocalidad", length = 80, nullable = false)
	private String nombre;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "IdProvincia", insertable = false, updatable = false)
	private Provincia provincia;

	public Localidad() {
	}
	
	public Localidad(String nombre) {
		this.nombre = nombre;
	}
	
	public Localidad(int idLocalidad, int idProvincia) {
		this.IdLocalidad = idLocalidad;
		this.IdProvincia = idProvincia;
	}
	
	public Localidad(int idLocalidad, String nombre, Provincia provincia) {
		IdLocalidad = idLocalidad;
		this.nombre = nombre;
		this.provincia = provincia;
	}

	public int getIdLocalidad() {
		return IdLocalidad;
	}
	
	public void setIdLocalidad(int idLocalidad) {
		IdLocalidad = idLocalidad;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
		this.IdProvincia = provincia.getIdProvincia();
	}
	
}
