package Entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "categorias")
public class Categoria {

	@Id
	@Column(name = "IdCategoria")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdCategoria;
	
	@Column(name = "Descripcion", length = 30, nullable = false, unique = true)
	private String descripcion;
	
	@Column(name = "Estado", nullable = false)
	private boolean estado;
	
	public Categoria() {
		// TODO Auto-generated constructor stub
	}

	public Categoria(int idCategoria, String descripcion) {
		IdCategoria = idCategoria;
		this.descripcion = descripcion;
	}
	
	public int getIdCategoria() {
		return IdCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		IdCategoria = idCategoria;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public boolean getEstado() {
		return estado;
	}
	
	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public boolean equals(Object obj) {
		Categoria aux = (Categoria) obj;
		return this.IdCategoria == aux.IdCategoria;
	}
}
