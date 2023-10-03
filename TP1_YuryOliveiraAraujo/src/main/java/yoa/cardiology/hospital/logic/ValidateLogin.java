package yoa.cardiology.hospital.logic;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import yoa.cardiology.hospital.dao.DoctorDAO;
import yoa.cardiology.hospital.dao.ExamDAO;
import yoa.cardiology.hospital.model.Doctor;

public class ValidateLogin implements Logic{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String crm = request.getParameter("crm");
		String password = request.getParameter("password");
		String url = "login.jsp";
		
		Doctor doctor = new DoctorDAO().obtainCredentials(crm, password);
		
		if(doctor != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(300);
			session.setAttribute("status", true);
			session.setAttribute("doctor", doctor);
			new ExamDAO().verifyOlderExams();
			url = "mainPage.jsp";
		}		
		return url;
	}

}
