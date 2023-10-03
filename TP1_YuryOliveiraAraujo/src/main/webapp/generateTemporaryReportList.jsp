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

    <c:if test="${sessionScope.doctor.doctorType != 'Docente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <jsp:useBean id="reportDAO" class="yoa.cardiology.hospital.dao.ReportDAO"/>

    <br><br>

    <c:if test="${not empty requestScope.successMessage}">
        <div style="color: green;">${requestScope.successMessage}</div>
    </c:if>

    <c:forEach var="report" items="${reportDAO.obtainReportsByStatus(ReportStatus.TEMPORARY)}">
	    CRM do Médico: ${report.crm} 
	    Conclusão: ${report.conclusion} 
	    Status: ${report.status }
    <a href="generateDefinitiveReport.jsp?id=${report.id}&examId=${report.examId}&crm=${report.crm}&description=${report.description}&conclusion=${report.conclusion}&status=${report.status}">Ver mais detalhes</a><br>    
	</c:forEach>

</body>
</html>
