package Entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "productos")
public class Producto {

	@Id
	@Column(name = "IdProducto")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdProducto;
	
	@Column(name = "Nombre", length = 45, nullable = false)
	private String nombre;
	
	@Column(name = "Descripcion", length = 400)
	private String descripcion;
	
	@Column(name = "PrecioUnitario", precision = 2, nullable = false)
	private double precioUnitario;
	
	@Column(name = "Stock")
	private short stock;
	
	@Column(name = "Imagen")
	private String imagen;
	
	@Column(name = "Estado", nullable = false)
	private boolean estado;
	
	@ManyToOne
	@JoinColumn(name = "IdCategoria", nullable = false)
	private Categoria categoria;
	
	@ManyToOne
	@JoinColumn(name = "IdProveedor", nullable = false)
	private Proveedor proveedor;
	
	public Producto() {
		// TODO Auto-generated constructor stub
	}

	public int getIdProducto() {
		return IdProducto;
	}

	public void setIdProducto(int idProducto) {
		IdProducto = idProducto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	public short getStock() {
		return stock;
	}

	public void setStock(short stock) {
		this.stock = stock;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Proveedor getProveedor() {
		return proveedor;
	}

	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}
	
	public boolean getEstado() {
		return estado;
	}
	
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
}
