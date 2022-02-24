package Entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tiposusuarios")
public class TipoDeUsuario {

	@Id
	@Column(name = "TipoDeUsuario")
	private char Tipo;
	
	@Column(name = "Descripcion", length = 45, nullable = false)
	private String descripcion;
	
	public TipoDeUsuario() {
		// TODO Auto-generated constructor stub
	}
	
	public TipoDeUsuario(char tipo, String descripcion) {
		Tipo = tipo;
		this.descripcion = descripcion;
	}

	public TipoDeUsuario(char tipo) {
		this.Tipo = tipo;
	}

	public char getTipo() {
		return Tipo;
	}

	public void setTipo(char tipo) {
		Tipo = tipo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@Override
	public boolean equals(Object obj) {
		TipoDeUsuario aux = (TipoDeUsuario) obj;
		return this.Tipo == aux.Tipo;
	}
	
}

