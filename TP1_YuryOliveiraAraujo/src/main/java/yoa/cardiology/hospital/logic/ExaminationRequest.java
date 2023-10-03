package yoa.cardiology.hospital.logic;

import java.util.Calendar;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import yoa.cardiology.hospital.dao.ExamDAO;
import yoa.cardiology.hospital.dao.PatientDAO;
import yoa.cardiology.hospital.model.Doctor;
import yoa.cardiology.hospital.model.Exam;
import yoa.cardiology.hospital.model.Patient;
import yoa.cardiology.hospital.utilities.ExamStatus;
import yoa.cardiology.hospital.utilities.SendMail;

public class ExaminationRequest implements Logic{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cpf = request.getParameter("cpf");
		String examType = request.getParameter("examinationType");
		String url = "examinationRequest.jsp";	
		Patient patient;
		ExamDAO examDAO = new ExamDAO();
		if((patient = new PatientDAO().getPatient(cpf)) == null) {
			request.setAttribute("errorMessage", String.format("O paciente portador do cpf: (%s) não está cadastrado.", cpf));
		}
		else if(examDAO.obtainScheduleExams(cpf, examType) && patient != null) {
			request.setAttribute("errorMessage", String.format("O paciente portador do cpf: (%s) já possui um exame pendente.", cpf));
		}
		else {
			request.setAttribute("successMessage", "Nenhum exame encontrado, prossiga com o cadastro.");
			String hypothesis = request.getParameter("hypothesis");
			
			if(hypothesis != null) {
				Exam exam = new Exam();
				HttpSession session = request.getSession(false);
				Doctor doctor = (Doctor) session.getAttribute("doctor");
				exam.setPatientCpf(cpf);
				exam.setExamType(examType);
				exam.setStatus(ExamStatus.WAITING_EXAM.toString());
				exam.setHypothesis(hypothesis);
				Calendar dateRequested = Calendar.getInstance();
				dateRequested.add(Calendar.DAY_OF_MONTH, 3);
				exam.setDateRequested(dateRequested);		
				exam.setDoctorCrm(doctor.getCrm());
				String emailMessage = SendMail.obtainEmailMessage(exam, patient);				
				examDAO.add(exam);
				SendMail.sendEmail(patient.getEmail(), "Confirmação de Exame", emailMessage);
				url = "mainPage.jsp";
			}			
		}		
        return url;
	}
}
