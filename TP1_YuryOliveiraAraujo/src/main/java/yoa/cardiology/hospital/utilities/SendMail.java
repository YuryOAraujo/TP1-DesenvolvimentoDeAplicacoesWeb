package yoa.cardiology.hospital.utilities;

import java.text.SimpleDateFormat;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import yoa.cardiology.hospital.dao.DoctorDAO;
import yoa.cardiology.hospital.model.Doctor;
import yoa.cardiology.hospital.model.Exam;
import yoa.cardiology.hospital.model.Patient;

public class SendMail {
	public static String obtainEmailMessage(Exam exam, Patient patient) {	
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");		
		
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("Dados do Exame\n\n");
		stringBuilder.append("Paciente\n\t");
		stringBuilder.append(String.format("Nome: %s\n\tEmail: %s\n\tCPF: %s\n\tGênero: %s\n\tData de Nascimento: %s\n\tIdade: %d anos\n\n", patient.getName(), patient.getEmail(), patient.getCpf(), patient.getGender(), dateFormat.format(patient.getBirthDate().getTime()), patient.getAge()));
		stringBuilder.append(String.format("Data prevista: %s\n\n", dateFormat.format(exam.getDateRequested().getTime())));
		stringBuilder.append(String.format("Exame: %s\n\n", exam.getExamType()));
		if(!exam.getStatus().equals(ExamStatus.CANCELED_EXAM.toString()))
			stringBuilder.append(exam.getExamType() == "ecocardiograma" ? ExamRecommendations.ECHO_RECOMMENDATIONS.toString() : ExamRecommendations.ECG_RECOMMENDATIONS.toString());
		Doctor doctor = new DoctorDAO().obtainDoctorByCrm(exam.getDoctorCrm());
		stringBuilder.append(String.format("\n\nDados do Médico: %s - %s\n\n", doctor.getName(), doctor.getCrm()));
		return stringBuilder.toString();
	}
	
	@SuppressWarnings("deprecation")
	public static void sendEmail(String address, String subject, String message) {
		String addressFrom = "yuser.testing@gmail.com";
		String password = "bdww enic iops yrpa";
		
		try {
			SimpleEmail email = new SimpleEmail();			
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);			
			email.setAuthentication(addressFrom, password);
			email.setTLS(true);
			email.setSSLOnConnect(true);
			email.setFrom(addressFrom);
			email.setSubject(subject);
			email.setMsg(message);
			email.addTo(address);
			email.send();
		} catch (EmailException e) {
		}
	}
}
