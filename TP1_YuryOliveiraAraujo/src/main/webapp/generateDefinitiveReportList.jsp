<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ReportStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Laudos para serem Realizados</title>
</head>
<body>
    <c:import url="logout.jsp"/>

    <c:if test="${sessionScope.doctor.doctorType != 'Geral' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>
    
    <form action="mvc" method="POST">
        CPF do Paciente: <input type="text" name="cpf" value="${param.cpf}"><br>
        <c:if test="${not empty requestScope.errorMessage}">
            <div class="error-message">${requestScope.errorMessage}</div>
        </c:if>
        
        <c:if test="${not empty requestScope.successMessage}">
            <jsp:useBean id="reportDAO" class="yoa.cardiology.hospital.dao.ReportDAO"/><br><br>
		    <c:forEach var="report" items="${reportDAO.obtainReportsByPatient(param.cpf)}">
			    CRM do Médico: ${report.crm} 
			    Conclusão: ${report.conclusion} 
			    Status: ${report.status }
		    <a href="generateDefinitiveExam.jsp?id=${report.id}&examId=${report.examId}&crm=${report.crm}&description=${report.description}&conclusion=${report.conclusion}&status=${report.status}">Ver mais detalhes</a><br>    
			</c:forEach>
        </c:if>
        
        <input type="hidden" name="logic" value="ViewDefinitiveReports">
        <input type="submit" value="Verificar">
    </form>

  

</body>
</html>
