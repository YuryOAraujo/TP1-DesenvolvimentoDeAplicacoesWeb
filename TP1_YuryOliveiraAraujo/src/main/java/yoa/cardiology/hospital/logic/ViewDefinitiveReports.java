package yoa.cardiology.hospital.logic;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import yoa.cardiology.hospital.dao.PatientDAO;

public class ViewDefinitiveReports implements Logic{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cpf = request.getParameter("cpf");
		String url = "generateDefinitiveReportList.jsp";	
		if((new PatientDAO().getPatient(cpf)) == null)
			request.setAttribute("errorMessage", String.format("O paciente portador do cpf: (%s) não está cadastrado.", cpf));
		else 
			request.setAttribute("successMessage", String.format("O paciente portador do cpf: (%s) está cadastrado.", cpf));
        return url;
	}
}
