package Entidades;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import Entidades.Claves.ClaveUsuario;

@Entity
@Table(name = "usuarios")
public class Usuario {
	
	@EmbeddedId
	private ClaveUsuario IdUsuario;

	@Column(name = "Nombres", length = 30, nullable = false)
	private String nombres;

	@Column(name = "Apellidos", length = 30, nullable = false)
	private String apellidos;

	@Column(name = "Email", length = 45, nullable = false, unique = true)
	private String eMail;

	@Column(name = "Telefono", length = 13, nullable = false)
	private String telefono;

	@Column(name = "Direccion", length = 45, nullable = false)
	private String direccion;

	@ManyToOne
	@JoinColumns({ @JoinColumn(name = "IdLocalidad", nullable = false, referencedColumnName = "IdLocalidad"),
			@JoinColumn(name = "IdProvincia", nullable = false, referencedColumnName = "IdProvincia") })
	private Localidad localidad;

	@ManyToOne
	@JoinColumn(name = "TipoDeUsuario", nullable = false)
	private TipoDeUsuario tipoUsuario;

	@Column(name = "Contraseña", length = 30, nullable = false)
	private String password;

	@Column(name = "Estado", nullable = false)
	private boolean estado;
	
	@OneToMany(mappedBy = "cliente")
	private List<Venta> compras;

	public Usuario() {
		// TODO Auto-generated constructor stub
	}
	
	public ClaveUsuario getIdUsuario() {
		return IdUsuario;
	}
	
	public void setIdUsuario(ClaveUsuario idUsuario) {
		IdUsuario = idUsuario;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
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

	public TipoDeUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(TipoDeUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	public List<Venta> getCompras() {
		return compras;
	}
	
	public void setCompras(List<Venta> compras) {
		this.compras = compras;
	}
	
}

