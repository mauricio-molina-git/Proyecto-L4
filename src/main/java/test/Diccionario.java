package test;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
public class Diccionario<K, V> extends ArrayList<Par<K, V>> {
	
	public Diccionario() {
	}
	
	public V getValor(K llave) {
		for (Par<K, V> par : this)
			if (par.esIgual(llave)) return par.getValor();
		return null;
	}

	private Par<K, V> getPar(K llave) {
		for (Par<K, V> par : this) {
			if (par.esIgual(llave)) return par;
		}
		return null;
	}
	
	public void add(K llave, V valor) {
		Par<K, V> par = getPar(llave);
		if(par == null) {
			par = new Par<K, V>(llave, valor);
			add(par);
		} else {
			par.setValor(valor);
		}
	}
	
	public List<K> getLlaves() {
		ArrayList<K> llaves = new ArrayList<K>(this.size());
		for (Par<K, V> par : this) llaves.add(par.getLlave());
		return llaves;
	}
	
	public List<V> getValores() {
		ArrayList<V> valores = new ArrayList<V>(this.size());
		for (Par<K, V> par : this) valores.add(par.getValor());
		return valores;
	}
}
