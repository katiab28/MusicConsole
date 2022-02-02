package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import Class.GenereMusicale;
import javax.sql.DataSource;

import it.unisa.utils.Utility;

public class GenereModelDS  implements ProductModelGenere<GenereMusicale> {

	private DataSource ds = null;
	
	public GenereModelDS(DataSource ds) {
		this.ds = ds;
	}
	
	@Override
	public Collection<GenereMusicale> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM  GenereMusicale";
	/*	
		if(order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		*/
		Collection<GenereMusicale> gm = new LinkedList<GenereMusicale>();
		
		try {
			connection = ds.getConnection(); //recupero connessione dal data source
			preparedStatement = connection.prepareStatement(selectSQL);
			
			Utility.print("doRetrieveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();			
		
			while(rs.next()) {
				GenereMusicale bean = new GenereMusicale();
				bean.setIdGenere(rs.getInt("idGenere"));
				bean.setCategoria(rs.getString("categoria"));
				
				
				gm.add(bean);
			}
		} finally {
			try {
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			if(connection != null)
				connection.close();
			}
		}
		return gm;
	}

	@Override
	public GenereMusicale doRetrieveByKey(String parola) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		GenereMusicale bean = new GenereMusicale();
		
		String selectSQL = " SELECT * FROM  GenereMusicale  WHERE CATEGORIA = ? ";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, parola);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setIdGenere(rs.getInt("idGenere"));
				bean.setCategoria(rs.getString("categoria"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
		}
	
	
	@Override
	public void doSave(GenereMusicale item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO GenereMusicale (IDGENERE, CATEGORIA) VALUES (?, ?)";

		try {
			connection = ds.getConnection();
			
			connection.setAutoCommit(false);
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, item.getIdGenere());
			preparedStatement.setString(2, item.getCategoria());

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

	}

	@Override
	public void doUpdate(GenereMusicale item) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM GenereMusicale WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
}
