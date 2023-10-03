package yoa.cardiology.hospital.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import yoa.cardiology.hospital.db.DatabaseFactory;
import yoa.cardiology.hospital.model.Exam;
import yoa.cardiology.hospital.model.Patient;
import yoa.cardiology.hospital.utilities.ExamStatus;
import yoa.cardiology.hospital.utilities.SendMail;

public class ExamDAO {
	private Connection connection;

	public ExamDAO() {
		this.connection = DatabaseFactory.getConnection();
	}

	//	public Exam obtainScheduleExams(String cpf, String examType) {
	//		String sql = "SELECT * FROM exams WHERE patient_cpf = ? AND exam_type = ? AND status = 'Aguardando Exame'";
	//		Exam exam = null;
	//		
	//		try(PreparedStatement statement = connection.prepareStatement(sql)){
	//			statement.setString(1, cpf);
	//			statement.setString(2, examType);
	//			ResultSet resultSet = statement.executeQuery();
	//			while(resultSet.next()) {
	//				  exam = new Exam();
	//                exam.setId(resultSet.getLong("id"));
	//                exam.setPatientCpf(resultSet.getString("patient_cpf"));
	//                exam.setExamType(resultSet.getString("exam_type"));
	//                exam.setStatus(resultSet.getString("status"));
	//                exam.setHypothesis(resultSet.getString("hypothesis"));
	//                Calendar date = Calendar.getInstance();
	//				  date.setTime(resultSet.getDate("date_requested"));
	//                exam.setDateRequested(date);
	//                date.setTime(resultSet.getDate("date_performed"));
	//                exam.setDatePerformed(date);
	//                exam.setDoctorCrm(resultSet.getString("crm"));
	//                exam.setPdfData(resultSet.getBytes("pdf"));
	//			}
	//		} catch (SQLException e) {
	//			e.printStackTrace();
	//		}		
	//		return exam;		
	//	}

	public boolean obtainScheduleExams(String cpf, String examType) {
		String sql = "SELECT * FROM exams WHERE patient_cpf = ? AND exam_type = ? AND status = 'Aguardando Exame'";

		try(PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, cpf);
			statement.setString(2, examType);
			ResultSet resultSet = statement.executeQuery();
			return resultSet.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}

	public void add(Exam exam) {
		String sql = "INSERT INTO exams (patient_cpf, exam_type, status, hypothesis, date_requested, crm, pdf) " +
				"VALUES (?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, exam.getPatientCpf());
			statement.setString(2, exam.getExamType());
			statement.setString(3, exam.getStatus());
			statement.setString(4, exam.getHypothesis());
			Calendar dateRequested = Calendar.getInstance();
	        dateRequested.add(Calendar.DATE, 3);
	        statement.setDate(5, new java.sql.Date(dateRequested.getTimeInMillis()));
			statement.setString(6, exam.getDoctorCrm());
			statement.setBytes(7, exam.getPdfData());

			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Exam exam) {
	    String sql = "UPDATE exams SET patient_cpf = ?, exam_type = ?, status = ?, hypothesis = ?, date_requested = ?, date_performed = ?, crm = ?, pdf = ? WHERE id = ?";

	    try (PreparedStatement statement = connection.prepareStatement(sql)) {
	        statement.setString(1, exam.getPatientCpf());
	        statement.setString(2, exam.getExamType());
	        statement.setString(3, exam.getStatus());
	        statement.setString(4, exam.getHypothesis());
	        if(exam.getDateRequested() != null)
	        	statement.setTimestamp(5, new Timestamp(exam.getDateRequested().getTimeInMillis()));
	        else
	        	statement.setNull(5, Types.TIMESTAMP);	        
	        if(exam.getDatePerformed() != null)
	            statement.setTimestamp(6, new Timestamp(exam.getDatePerformed().getTimeInMillis()));
	        else 
	            statement.setNull(6, Types.TIMESTAMP); 
	        statement.setString(7, exam.getDoctorCrm());
	        statement.setBytes(8, exam.getPdfData());
	        statement.setLong(9, exam.getId());

	        statement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	
	public List<Exam> obtainExamsByCpf(String cpf) {
		List<Exam> examList = new ArrayList<Exam>();

		String sql = "select * from exams where patient_cpf = ?";

		try(PreparedStatement statement = connection.prepareStatement(sql)){
			statement.setString(1, cpf);
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				Exam exam = new Exam();
				exam.setId(resultSet.getLong("id"));
				exam.setPatientCpf(resultSet.getString("patient_cpf"));
				exam.setExamType(resultSet.getString("exam_type"));
				exam.setStatus(resultSet.getString("status"));
				exam.setHypothesis(resultSet.getString("hypothesis"));
				Calendar date = Calendar.getInstance();
				Date dateSQL = resultSet.getDate("date_requested");
				if(dateSQL != null) {
					date.setTime(dateSQL);
					exam.setDateRequested(date);
				}					
				dateSQL = resultSet.getDate("date_performed");
				if(dateSQL != null) {
					date.setTime(dateSQL);
					exam.setDatePerformed(date);
				}					
				exam.setDoctorCrm(resultSet.getString("crm"));
				exam.setPdfData(resultSet.getBytes("pdf"));
				examList.add(exam);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return examList;
	}


	public List<Exam> obtainExamsByStatus(ExamStatus status) {
		List<Exam> examList = new ArrayList<Exam>();

		String sql = "select * from exams where status = '" + status.toString() + "'";

		try(PreparedStatement statement = connection.prepareStatement(sql)){
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				Exam exam = new Exam();
				exam.setId(resultSet.getLong("id"));
				exam.setPatientCpf(resultSet.getString("patient_cpf"));
				exam.setExamType(resultSet.getString("exam_type"));
				exam.setStatus(resultSet.getString("status"));
				exam.setHypothesis(resultSet.getString("hypothesis"));
				Calendar date = Calendar.getInstance();
				Date dateSQL = resultSet.getDate("date_requested");
				if(dateSQL != null) {
					date.setTime(dateSQL);
					exam.setDateRequested(date);
				}					
				dateSQL = resultSet.getDate("date_performed");
				if(dateSQL != null) {
					date.setTime(dateSQL);
					exam.setDatePerformed(date);
				}					
				exam.setDoctorCrm(resultSet.getString("crm"));
				exam.setPdfData(resultSet.getBytes("pdf"));
				examList.add(exam);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return examList;
	}
	
	public Exam obtainExamById(Long id) {
		String sql = "select * from exams where id = '" + id + "'";
		Exam exam = null;
		try(PreparedStatement statement = connection.prepareStatement(sql)){
			ResultSet resultSet = statement.executeQuery();
			while(resultSet.next()) {
				exam = new Exam();
				exam.setId(resultSet.getLong("id"));
				exam.setPatientCpf(resultSet.getString("patient_cpf"));
				exam.setExamType(resultSet.getString("exam_type"));
				exam.setStatus(resultSet.getString("status"));
				exam.setHypothesis(resultSet.getString("hypothesis"));
				Calendar date = Calendar.getInstance();
				Date dateSQL = resultSet.getDate("date_requested");
				if(dateSQL != null) {
					date.setTime(dateSQL);
					exam.setDateRequested(date);
				}					
				dateSQL = resultSet.getDate("date_performed");
				if(dateSQL != null) {
					date.setTime(dateSQL);
					exam.setDatePerformed(date);
				}					
				exam.setDoctorCrm(resultSet.getString("crm"));
				exam.setPdfData(resultSet.getBytes("pdf"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exam;
	}
	
	public void verifyOlderExams() {
		List<Exam> examList = obtainExamsByStatus(ExamStatus.WAITING_EXAM);
		Calendar today = Calendar.getInstance();
		ExamDAO examDAO = new ExamDAO();
		
		for(var exam:examList) {
			Calendar requestedDate = exam.getDateRequested();
			
			if(requestedDate != null && today.after(requestedDate)) {
				Patient patient = new PatientDAO().getPatient(exam.getPatientCpf());
				exam.setStatus(ExamStatus.CANCELED_EXAM.toString());
				String emailMessage = SendMail.obtainEmailMessage(exam, patient);				
				SendMail.sendEmail(patient.getEmail(), "Cancelamento de Exame", emailMessage);				
				examDAO.update(exam);
			}
		}
	}
}
