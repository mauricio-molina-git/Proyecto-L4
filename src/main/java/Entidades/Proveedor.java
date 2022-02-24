package Entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "proveedores")
public class Proveedor {

	@Id
	@Column(name = "IdProveedor")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IdProveedor;
	
	@Column(name = "Nombre", length = 45, nullable = false)
	private String nombre;
	
	@Column(name = "Telefono", length = 13, nullable = false)
	private String telefono;
	
	@Column(name = "Email", length = 45, nullable = false)
	private String eMail;
	
	@Column(name = "Direccion", length = 45, nullable = false)
	private String direccion;
	
	@Column(name = "Cuit", length = 45, nullable = false)
	private String Cuit;
	
	
	@ManyToOne
	@JoinColumns({
		@JoinColumn(name = "IdLocalidad", referencedColumnName = "IdLocalidad", nullable = false),
		@JoinColumn(name = "IdProvincia", referencedColumnName = "IdProvincia", nullable = false)
	})
	private Localidad localidad;
	
	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getCuit() {
		return Cuit;
	}

	public void setCuit(String cuit) {
		Cuit = cuit;
	}

	@Column(name = "Estado", nullable = false)
	private boolean estado;
	
	public Proveedor() {
		// TODO Auto-generated constructor stub
	}
	
	public Proveedor(int idProveedor) {
		this.IdProveedor = idProveedor;
	}

	public int getIdProveedor() {
		return IdProveedor;
	}

	public void setIdProveedor(int idProveedor) {
		IdProveedor = idProveedor;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return eMail;
	}

	public void setEmail(String email) {
		this.eMail = email;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Localidad getLocalidad() {
		return localidad;
	}

	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	
	public boolean getEstado() {
		return estado;
	}
	
	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	@Override
	public boolean equals(Object obj) {
		Proveedor aux = (Proveedor) obj;
		return this.IdProveedor == aux.IdProveedor;
	}
	
}
