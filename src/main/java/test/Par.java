package test;

public class Par<K, V> {
	private K llave;
	private V valor;
	
	public Par() {
		super();
	}

	public Par(K llave, V valor) {
		this.llave = llave;
		this.valor = valor;
	}
	
	public K getLlave() {
		return llave;
	}
	public void setLlave(K llave) {
		this.llave = llave;
	}
	public V getValor() {
		return valor;
	}
	public void setValor(V valor) {
		this.valor = valor;
	}

	public boolean esIgual(K llave) {
		return this.llave.equals(llave);
	}
	
	@Override
	public boolean equals(Object obj) {
		return llave.equals(obj);
	}

	@Override
	public String toString() {
		return "Par [llave=" + llave + ", valor=" + valor + "]";
	}
	
}
