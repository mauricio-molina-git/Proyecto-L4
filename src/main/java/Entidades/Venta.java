package Entidades;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ventas")
public class Venta {

	@Id
	@Column(name = "NumVenta")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int NumVenta;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumns({ @JoinColumn(name = "DNICliente", referencedColumnName = "DNI"),
			@JoinColumn(name = "TipoDNICliente", referencedColumnName = "TipoDeDNI") })
	private Usuario cliente;

	@Column(name = "FechaVenta")
	private LocalDate fechaVenta;

	@ManyToOne
	@JoinColumn(name = "IdMetodo")
	private MetodoDePago metodoPago;

	@Column(name = "ImporteTotal")
	private double importe;

	@OneToMany(mappedBy = "venta")
	private List<DetalleVenta> detalle = new ArrayList<DetalleVenta>();

	public Venta() {
		// TODO Auto-generated constructor stub
	}

	public int getNumVenta() {
		return NumVenta;
	}
	
	public void setNumVenta(int numVenta) {
		NumVenta = numVenta;
	}

	public LocalDate getFechaVenta() {
		return fechaVenta;
	}
	
	public Usuario getCliente() {
		return cliente;
	}
	
	public void setCliente(Usuario cliente) {
		this.cliente = cliente;
	}

	public void setFechaVenta(LocalDate fechaVenta) {
		this.fechaVenta = fechaVenta;
	}

	public MetodoDePago getMetodoPago() {
		return metodoPago;
	}

	public void setMetodoPago(MetodoDePago metodoPago) {
		this.metodoPago = metodoPago;
	}

	public double getImporte() {
		return importe;
	}

	public void setImporte(double importe) {
		this.importe = importe;
	}

	public List<DetalleVenta> getDetalle() {
		return detalle;
	}

	public void setDetalle(List<DetalleVenta> detalle) {
		this.detalle = detalle;
	}

}
