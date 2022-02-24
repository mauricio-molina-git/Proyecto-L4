package test;

@FunctionalInterface
public interface Mutar<T, R> {
	R func (T var);
}
