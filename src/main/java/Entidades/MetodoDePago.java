package Entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "metodosdepago")
public class MetodoDePago {
	
	@Id
	@Column(name = "IdMetodo")
	private char IdMetodo;
	
	@Column(name = "Descripcion", length = 25, nullable = false)
	private String descripcion;
	
	public MetodoDePago() {
		// TODO Auto-generated constructor stub
	}
	
	public MetodoDePago(char idMetodo) {
		this.IdMetodo = idMetodo;
	}

	public char getIdMetodo() {
		return IdMetodo;
	}

	public void setIdMetodo(char idMetodo) {
		IdMetodo = idMetodo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
