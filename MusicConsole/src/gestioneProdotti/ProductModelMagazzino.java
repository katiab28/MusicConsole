package gestioneProdotti;

import java.sql.SQLException;
import java.util.Collection;

public interface ProductModelMagazzino<T> {

	public Magazzino doRetrieveByKey(int cod) throws SQLException;
	
	public Collection<T> doRetrieveAll() throws SQLException;
	
	public void doSave(T item) throws SQLException;
	
	public void doUpdate(int quantit�, int cod) throws SQLException;

	public boolean doDelete(int cod) throws SQLException;

}
