package yoa.cardiology.hospital.logic;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import yoa.cardiology.hospital.dao.ExamDAO;
import yoa.cardiology.hospital.dao.ReportDAO;
import yoa.cardiology.hospital.model.Doctor;
import yoa.cardiology.hospital.model.Exam;
import yoa.cardiology.hospital.model.Report;
import yoa.cardiology.hospital.utilities.ExamStatus;
import yoa.cardiology.hospital.utilities.ReportStatus;

public class GenerateReport implements Logic{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    Long id = Long.parseLong(request.getParameter("id"));
	    String url = "generateReportList.jsp";
	    ExamDAO examDAO = new ExamDAO();
	    Exam exam = examDAO.obtainExamById(id);
	    if (exam != null) {
	        exam.setStatus(ExamStatus.REPORT_DONE.toString());
	        examDAO.update(exam);
	        HttpSession session = request.getSession();
		    Doctor sessionDoctor = (Doctor) session.getAttribute("doctor");
		    
		    Report report = new Report();
		    report.setExamId(exam.getId());
		    report.setCrm(sessionDoctor.getCrm());
		    report.setDescription(request.getParameter("description"));
		    report.setConclusion(request.getParameter("hypothesis"));
		    report.setStatus(ReportStatus.TEMPORARY.toString());
		    
		    ReportDAO reportDAO = new ReportDAO();
		    reportDAO.add(report);	        
	        
	        request.setAttribute("successMessage", "O Laudo foi realizado com sucesso!");
	    }
	    return url;
	}
}
