package test;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ProductoVendido implements Serializable {
	public int id;				// id de Categoria o Proveedor según corresponda
	public String nombre;		// nombre de Categoria o Proveedor según corresponda
	public int cantVendida;		// cantidad vendida
	
	public ProductoVendido() { }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getCantVendida() {
		return cantVendida;
	}

	public void setCantVendida(int cantVendida) {
		this.cantVendida = cantVendida;
	}

	@Override
	public boolean equals(Object obj) {
		return id == ((ProductoVendido) obj).id;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", nombre=" + nombre + ", cantVendida=" + cantVendida + "]";
	}
	
}
