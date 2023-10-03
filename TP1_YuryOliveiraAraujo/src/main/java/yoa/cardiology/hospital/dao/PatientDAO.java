package yoa.cardiology.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import yoa.cardiology.hospital.db.DatabaseFactory;
import yoa.cardiology.hospital.model.Patient;

public class PatientDAO {
	private Connection connection;

	public PatientDAO() {
		this.connection = DatabaseFactory.getConnection();
	}

	public Patient getPatient(String cpf) {
		String sql = "select * from patients where cpf=?";
		Patient patient = null;

		try(PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, cpf);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				patient = new Patient();
				patient.setCpf(resultSet.getString("cpf"));
				patient.setName(resultSet.getString("name"));
				patient.setEmail(resultSet.getString("email"));
				patient.setGender(resultSet.getString("gender"));
				Calendar date = Calendar.getInstance();
				date.setTime(resultSet.getDate("birthdate"));
				patient.setBirthDate(date);
				patient.setAge(resultSet.getInt("age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return patient;		
	}
}
