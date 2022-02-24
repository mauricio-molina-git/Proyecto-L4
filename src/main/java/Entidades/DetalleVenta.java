package Entidades;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import Entidades.Claves.ClaveDetalleVenta;

@Entity
@Table(name = "detalles")
public class DetalleVenta {
	
	@EmbeddedId
	private ClaveDetalleVenta ID;
	
	@ManyToOne
	@JoinColumn(name = "NumVenta", insertable = false, updatable = false)
	private Venta venta;
	
	@ManyToOne
	@JoinColumn(name = "IdProducto", insertable = false, updatable = false)
	private Producto producto;
	
	@Column(name = "Cantidad")
	private short cantidad;
	
	@Column(name = "PrecioVenta")
	private double precioVenta;
	
	public DetalleVenta() {
		ID = new ClaveDetalleVenta();
	}

	public Venta getVenta() {
		return venta;
	}

	public void setVenta(Venta venta) {
		this.venta = venta;
		ID.setNumVenta(venta.getNumVenta());
	}

	public Producto getProducto() {
		return producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
		ID.setIdProducto(producto.getIdProducto());
	}

	public short getCantidad() {
		return cantidad;
	}

	public void setCantidad(short cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(double precioVenta) {
		this.precioVenta = precioVenta;
	}
	
}
