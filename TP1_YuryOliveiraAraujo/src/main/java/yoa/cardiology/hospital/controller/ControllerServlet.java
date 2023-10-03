package yoa.cardiology.hospital.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import yoa.cardiology.hospital.logic.Logic;

public class ControllerServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String parametro= request.getParameter("logic");
		String nomeDaClasse = "yoa.cardiology.hospital.logic." + parametro; 
		String url="";
		Class<?> classe;
		try {
			classe = Class.forName(nomeDaClasse);
			@SuppressWarnings("deprecation")
			Logic logica = (Logic)classe.newInstance();
			url = logica.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
