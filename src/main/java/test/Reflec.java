package test;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class Reflec {

	public static Diccionario<String, Object> ObtenerCampos(Object obj) {
		Diccionario<String, Object> mapeo = new Diccionario<String, Object>();
		Class<?> clase = obj.getClass();
		
		Field []fields = clase.getDeclaredFields();
		Method []methods = clase.getMethods();
		
		String prefix = "get";
		for (Field f : fields) {
			for (Method m : methods) {
				if (m.getName().toLowerCase().equals(prefix.concat(f.getName().toLowerCase()))) {
					try {
						mapeo.add(f.getName(), m.invoke(obj));
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}
		}
		
		return mapeo;
	}
	
}
