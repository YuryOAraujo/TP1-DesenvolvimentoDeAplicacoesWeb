package yoa.cardiology.hospital.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseFactory {
	public static Connection getConnection() {
		try {
			Class.forName("org.postgresql.Driver");
			return DriverManager.getConnection("jdbc:postgresql://localhost/cardiology", "aluno", "aluno");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;		
	}
}
