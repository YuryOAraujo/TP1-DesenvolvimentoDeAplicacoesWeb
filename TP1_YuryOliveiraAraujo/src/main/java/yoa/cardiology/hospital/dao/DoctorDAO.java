package yoa.cardiology.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import yoa.cardiology.hospital.db.DatabaseFactory;
import yoa.cardiology.hospital.model.Doctor;

public class DoctorDAO {
	private Connection connection;

	public DoctorDAO() {
		this.connection = DatabaseFactory.getConnection();
	}
	
	public Doctor obtainCredentials(String crm, String password) {
		String sql = "select * from doctors where crm=? and password=?";
		Doctor doctor = null;
		
		try(PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, crm);
			statement.setString(2, password);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				doctor = new Doctor();
				doctor.setCrm(resultSet.getString("crm"));
				doctor.setName(resultSet.getString("name"));
				doctor.setDoctorType(resultSet.getString("doctor_type"));
				doctor.setPassword(resultSet.getString("password"));
				doctor.setTitle(resultSet.getString("title"));
				doctor.setResidencyYear(resultSet.getString("residency_year"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return doctor;		
	}
	
	public Doctor obtainDoctorByCrm(String crm) {
		String sql = "select * from doctors where crm=?";
		Doctor doctor = null;
		
		try(PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, crm);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				doctor = new Doctor();
				doctor.setCrm(resultSet.getString("crm"));
				doctor.setName(resultSet.getString("name"));
				doctor.setDoctorType(resultSet.getString("doctor_type"));
				doctor.setPassword(resultSet.getString("password"));
				doctor.setTitle(resultSet.getString("title"));
				doctor.setResidencyYear(resultSet.getString("residency_year"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return doctor;		
	}
}
