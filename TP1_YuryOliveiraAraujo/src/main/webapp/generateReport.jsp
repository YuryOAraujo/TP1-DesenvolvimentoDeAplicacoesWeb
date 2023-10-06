<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Realizar Laudo</title>
</head>
<body>
	<c:import url="logout.jsp"/>
	
	<c:if test="${sessionScope.doctor.doctorType != 'Residente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>
    
	<div class="container mt-4">
        <div class="card">
            <div class="card-body">
            	<h5 class="card-title">Realizar Laudo</h5>
				<p class="card-text"><b>CPF do Paciente:</b> <%= request.getParameter("patientCpf")%></p>
				<p class="card-text"><b>Tipo do Exame:</b> <%= request.getParameter("examType")%></p>
				<p class="card-text"><b>Hipótese Inicial:</b> <%= request.getParameter("hypothesis")%></p>
				<p class="card-text"><b>Exame Realizado em:</b> <%= request.getParameter("datePerformed")%></p>
				<p class="card-text"><b>CRM do Médico:</b> <%= request.getParameter("doctorCrm")%></p>
				
				<a href="mvc?logic=DownloadPDF&id=<%= request.getParameter("id")%>" target="blank"><button class="mb-3 btn btn-primary">Baixar exame</button></a>
				<form action="mvc" method="POST">
					<p><b>Descrição:</b></p>
					<textarea id="description" name="description" rows="4" cols="50"></textarea><br>
					<p><b>Conclusão:</b></p>
					<select name="hypothesis">
			                <option value="I46 - Parada cardíaca" ${param.hipothesis == 'I46 - Parada cardíaca' ? 'selected' : ''}>I46 - Parada cardíaca</option>
			                <option value="I47 - Taquicardia paroxística" ${param.hipothesis == 'I47 - Taquicardia paroxística' ? 'selected' : ''}>I47 - Taquicardia paroxística</option>
			                <option value="I48 - Flutter e fibrilacao atrial" ${param.hipothesis == 'I48 - Flutter e fibrilacao atrial' ? 'selected' : ''}>I48 - Flutter e fibrilacao atrial</option>
			                <option value="I49 - Outras arritmias cardíacas" ${param.hipothesis == 'I49 - Outras arritmias cardíacas' ? 'selected' : ''}>I49 - Outras arritmias cardíacas</option>
			                <option value="I42 - Cardiomiopatias" ${param.hipothesis == 'I42 - Cardiomiopatias' ? 'selected' : ''}>I42 - Cardiomiopatias</option>
			            </select><br>
					<input type="hidden" name="id" value=<%= request.getParameter("id")%>>
					<input type="hidden" name="logic" value="GenerateReport">
			        <input class="mt-3 btn btn-primary" type="submit" value="Realizar Laudo">
				</form>
			</div>
        </div>
    </div>
</body>
</html>