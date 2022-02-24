package test;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Funciones {

	public static <T> ArrayList<T> filtrar(List<T> lista, Evaluar<T> exp) {
		ArrayList<T> aux = new ArrayList<T>();
		for (T i : lista)
			if (exp.func(i))
				aux.add(i);
		return aux;
	}

	@SafeVarargs
	public static <T> ArrayList<T> filtrar(List<T> lista, Evaluar<T>... expressions) {
		ArrayList<T> aux = new ArrayList<T>();
		for (T i : lista) {
			boolean bandera = true;
			for (Evaluar<T> l : expressions) {
				if (!l.func(i)) {
					bandera = false;
					break;
				}
			}
			if (bandera)
				aux.add(i);
		}
		return aux;
	}

	public static <T> ArrayList<T> filtrar(List<T> lista, List<Evaluar<T>> expressions) {
		ArrayList<T> aux = new ArrayList<T>();
		for (T i : lista) {
			boolean bandera = true;
			for (Evaluar<T> l : expressions) {
				if (!l.func(i)) {
					bandera = false;
					break;
				}
			}
			if (bandera)
				aux.add(i);
		}
		return aux;
	}

	public static <T, R> ArrayList<R> mapear(List<T> lista, Mutar<T, R> exp) {
		ArrayList<R> aux = new ArrayList<R>(lista.size());
		for (T i : lista)
			aux.add(exp.func(i));
		return aux;
	}

	public static <T> int buscarMaximo(List<T> lista, Comparator<T> exp) {
		if (lista.isEmpty())
			return -1;
		int maxIndex = 0;
		T max = lista.get(0);
		for (int i = 1; i < lista.size(); ++i) {
			if (exp.compare(max, lista.get(i)) < 0) {
				max = lista.get(i);
				maxIndex = i;
			}
		}
		return maxIndex;
	}

	public static <T> int buscarMinimo(List<T> lista, Comparator<T> exp) {
		if (lista.isEmpty())
			return -1;
		int minIndex = 0;
		T min = lista.get(0);
		for (int i = 1; i < lista.size(); ++i) {
			if (exp.compare(min, lista.get(i)) > 0) {
				min = lista.get(i);
				minIndex = i;
			}
		}
		return minIndex;
	}

	public static <T> void invertirArray(ArrayList<T> array) {
		final int tam = array.size();
		for (int i = 0; i < tam / 2; ++i) {
			T aux = array.get(tam - (i + 1));
			array.set(tam - (i + 1), array.get(i));
			array.set(i, aux);
		}
	}

	public static String toJavaScriptArray(List<? extends Object> arr) {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (int i = 0; i < arr.size(); i++) {
			sb.append("\"").append(arr.get(i)).append("\"");
			if (i + 1 < arr.size())
				sb.append(",");
		}
		sb.append("]");
		return sb.toString();
	}
	
	public static String toJavaScriptObjectArray(List<Serializable> lista) {
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (int i = 0; i < lista.size(); i++) {
			sb.append(toJavaScriptObject(lista.get(i)));
			if (i + 1 < lista.size())
				sb.append(",");
		}
		sb.append("]");
		return sb.toString();
	}
	
	public static String toJavaScriptObject(Serializable obj) {
		StringBuffer sb = new StringBuffer();
		
		Diccionario<String, Object> campos = Reflec.ObtenerCampos(obj);
		if (campos.isEmpty() == false) {
			sb.append("{");
			
			for (Par<String, Object> par : campos) {
				sb.append("\"" + par.getLlave() + "\":");
				if (par.getValor().getClass().equals(String.class)) sb.append("\"" + par.getValor() + "\", ");
				else sb.append(par.getValor().toString() + ", ");
			}
			sb.replace(sb.length()-2, sb.length(), "}");
		}
		
		return sb.toString();
	}
}
