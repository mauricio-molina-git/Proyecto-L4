package AccesoDatos;

import java.util.List;

import Entidades.Usuario;

public interface UsuariosDAO extends DAO<Usuario> {
	
	Usuario ObtenerPorEmail(String eMail);
	public List<Usuario> ObtenerActivos();
}
