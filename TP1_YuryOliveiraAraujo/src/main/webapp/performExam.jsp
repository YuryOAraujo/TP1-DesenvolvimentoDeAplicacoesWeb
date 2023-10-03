<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Realizar Exame</title>
</head>
<body>
	<c:import url="logout.jsp"/>
	
	<c:if test="${sessionScope.doctor.doctorType != 'Residente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>
	
	<p>CPF do Paciente: <%= request.getParameter("patientCpf")%></p>
	<p>Tipo do Exame: <%= request.getParameter("examType")%></p>
	<p>Hipótese Inicial: <%= request.getParameter("hypothesis")%></p>
	<p>Data Prevista: <%= request.getParameter("dateRequested")%></p>
	<p>CRM do Médico: <%= request.getParameter("doctorCrm")%></p>
	
	<form action="mvc" method="POST">
		<input type="hidden" name="id" value=<%= request.getParameter("id")%>>
		<input type="hidden" name="logic" value="PerformExam">
        <input type="submit" value="Realizar Exame">
	</form>
</body>
</html>