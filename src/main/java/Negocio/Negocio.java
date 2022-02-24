package Negocio;

import java.util.Map;
import Entidades.Categoria;
import Entidades.Localidad;
import Entidades.Producto;
import Entidades.Proveedor;
import Entidades.TipoDeUsuario;
import Entidades.Usuario;
import Entidades.Claves.ClaveUsuario;

public class Negocio {

	public static boolean CargarProducto(Map<String, String[]> parametros, Producto producto) {
		boolean resultado = false;
		String url;
		try {
			producto.setNombre(parametros.get("txtNombre")[0]);
			producto.setDescripcion(parametros.get("txtDescripcion")[0]);
			producto.setPrecioUnitario(Double.valueOf(parametros.get("txtPrecioUnitario")[0]));
			producto.setStock(Short.valueOf(parametros.get("txtStock")[0]));

			int IdCategoria = Integer.valueOf(parametros.get("cmbCategoria")[0]);
			if (IdCategoria == -1)
				throw new Exception();
			else
				producto.setCategoria(new Categoria(IdCategoria, ""));

			int IdProveedor = Integer.valueOf(parametros.get("cmbProveedor")[0]);
			if (IdProveedor == -1)
				throw new Exception();
			else
				producto.setProveedor(new Proveedor(IdProveedor));

			url = parametros.get("File")[0];
			if (url.isEmpty() == false) {
				String directorio = "imagenes\\productos\\";
				if (url.indexOf("\\") == -1)
					url = directorio + url;
				else {
					int index = url.lastIndexOf("\\");
					url = directorio + url.substring(index + 1);
				}
			}
			//si esta vacio
			else {
				url = parametros.get("txtImagen")[0];
			}
			
			System.out.println(url);
			producto.setImagen(url);
			producto.setEstado(true);

			resultado = true;
		} catch (Exception e) {
			producto = null;
		}
		return resultado;
	}

	public static boolean CargarProveedor(Map<String, String[]> parametros, Proveedor proveedor) {
		boolean resultado = false;
		try {
			proveedor.setCuit(parametros.get("txtCuit")[0]);
			proveedor.setNombre(parametros.get("txtNombreProv")[0]);
			proveedor.setDireccion(parametros.get("txtDireccion")[0]);
			proveedor.setTelefono(parametros.get("txtTelefono")[0]);
			proveedor.setEmail(parametros.get("txtEmail")[0]);

			int idProvincia = Integer.valueOf(parametros.get("cmbProvincia")[0]);
			if (idProvincia == -1)
				throw new Exception();
			else {
				int idLocalidad = Integer.valueOf(parametros.get("cmbLocalidad")[0]);
				proveedor.setLocalidad(new Localidad(idLocalidad, idProvincia));
			}
			
			proveedor.setEstado(true);

			resultado = true;
		} catch (Exception e) {
			proveedor = null;
		}
		return resultado;
	}

	public static boolean CargarUsuario(Map<String, String[]> parametros, Usuario usuario) {
		boolean resultado = false;
		try {
			usuario.setNombres(parametros.get("Nombre")[0]);
			usuario.setApellidos(parametros.get("Apellido")[0]);
			usuario.setPassword(parametros.get("Contraseña")[0]);
			usuario.seteMail(parametros.get("Email")[0]);
			usuario.setTelefono(parametros.get("Telefono")[0]);
			
			String tipoDNI = parametros.get("TipoDeDni")[0];
			String dni = parametros.get("DNI")[0];
			usuario.setIdUsuario(new ClaveUsuario(dni, tipoDNI));
			
			usuario.setDireccion(parametros.get("Direccion")[0]);

			int idProvincia = Integer.valueOf(parametros.get("cmbProvincia")[0]);
			if (idProvincia == -1)
				throw new Exception();
			else {
				int idLocalidad = Integer.valueOf(parametros.get("cmbLocalidad")[0]);
				usuario.setLocalidad(new Localidad(idLocalidad, idProvincia));
			}
			
			char tipoUsuario = 'N';
			if (parametros.get("cmbTipoUsuario") != null)
				tipoUsuario = parametros.get("cmbTipoUsuario")[0].charAt(0);
			usuario.setTipoUsuario(new TipoDeUsuario(tipoUsuario));
			
			usuario.setEstado(true);

			resultado = true;
		} catch (Exception e) {
			usuario = null;
		}
		return resultado;
	}

}
