package AccesoDatos;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public abstract class jpaDAO {

	protected static EntityManager manager;
	
	public jpaDAO() {
		manager = Persistence.createEntityManagerFactory("app").createEntityManager();
	}

}
