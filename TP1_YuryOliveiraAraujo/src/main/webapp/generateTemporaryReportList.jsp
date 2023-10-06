<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ReportStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Laudos Provisórios</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <c:import url="logout.jsp"/>

    <c:if test="${sessionScope.doctor.doctorType != 'Docente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <jsp:useBean id="reportDAO" class="yoa.cardiology.hospital.dao.ReportDAO"/>

    <br><br>

    <div class="container">
    	<c:if test="${not empty requestScope.successMessage}">
	        <div class="alert alert-success">${requestScope.successMessage}</div>
	    </c:if>
    	
    	<h5>Lista de Laudos Provisórios</h5>
    	<c:choose>
        <c:when test="${not empty reportDAO.obtainReportsByStatus(ReportStatus.TEMPORARY)}">
            
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>CRM do Médico</th>
                        <th>Conclusão</th>
                        <th>Status</th>
                        <th>Detalhes</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="report" items="${reportDAO.obtainReportsByStatus(ReportStatus.TEMPORARY)}">
                        <tr>
                            <td>${report.crm}</td>
                            <td>${report.conclusion}</td>
                            <td>${report.status}</td>
                            <td><a href="generateDefinitiveReport.jsp?id=${report.id}&examId=${report.examId}&crm=${report.crm}&description=${report.description}&conclusion=${report.conclusion}&status=${report.status}">Ver mais detalhes</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
                <div class="alert alert-info">Não há laudos provisórios.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
