package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

public class MainTest {

	public static void main(String[] args) {
		
		ArrayList<Integer> numeros = new ArrayList<Integer>();
		
		numeros.add(1);
		numeros.add(2);
		numeros.add(3);
		numeros.add(4);
		numeros.add(5);
		
		numeros.forEach(n -> System.out.println(n));
		Funciones.invertirArray(numeros);
		numeros.forEach(n -> System.out.println(n));
	}

}
