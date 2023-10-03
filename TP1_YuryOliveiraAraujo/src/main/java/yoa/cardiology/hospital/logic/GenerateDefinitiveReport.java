package yoa.cardiology.hospital.logic;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import yoa.cardiology.hospital.dao.ReportDAO;
import yoa.cardiology.hospital.model.Report;
import yoa.cardiology.hospital.utilities.ReportStatus;

public class GenerateDefinitiveReport implements Logic{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    Long id = Long.parseLong(request.getParameter("id"));
	    String url = "generateTemporaryReportList.jsp";
	    ReportDAO reportDAO = new ReportDAO();
	    Report report = reportDAO.obtainReportById(id);
	    if (report != null) {
		    report.setId(id);
		    report.setStatus(ReportStatus.DEFINITIVE.toString());
		    
		    reportDAO.update(report);	      
	        request.setAttribute("successMessage", "O Laudo foi definido como definitivo com sucesso!");
	    }
	    return url;
	}
}
