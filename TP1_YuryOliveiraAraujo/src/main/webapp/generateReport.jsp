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
	<p>Exame Realizado em: <%= request.getParameter("datePerformed")%></p>
	<p>CRM do Médico: <%= request.getParameter("doctorCrm")%></p>
	
	<a href="mvc?logic=DownloadPDF&id=<%= request.getParameter("id")%>" target="blank">Baixar exame</a>
	<form action="mvc" method="POST">
		<textarea id="description" name="description" rows="4" cols="50"></textarea><br>
		<select name="hypothesis">
                <option value="I46 - Parada cardíaca" ${param.hipothesis == 'I46 - Parada cardíaca' ? 'selected' : ''}>I46 - Parada cardíaca</option>
                <option value="I47 - Taquicardia paroxística" ${param.hipothesis == 'I47 - Taquicardia paroxística' ? 'selected' : ''}>I47 - Taquicardia paroxística</option>
                <option value="I48 - Flutter e fibrilacao atrial" ${param.hipothesis == 'I48 - Flutter e fibrilacao atrial' ? 'selected' : ''}>I48 - Flutter e fibrilacao atrial</option>
                <option value="I49 - Outras arritmias cardíacas" ${param.hipothesis == 'I49 - Outras arritmias cardíacas' ? 'selected' : ''}>I49 - Outras arritmias cardíacas</option>
                <option value="I42 - Cardiomiopatias" ${param.hipothesis == 'I42 - Cardiomiopatias' ? 'selected' : ''}>I42 - Cardiomiopatias</option>
            </select><br>
		<input type="hidden" name="id" value=<%= request.getParameter("id")%>>
		<input type="hidden" name="logic" value="GenerateReport">
        <input type="submit" value="Realizar Laudo">
	</form>
</body>
</html>