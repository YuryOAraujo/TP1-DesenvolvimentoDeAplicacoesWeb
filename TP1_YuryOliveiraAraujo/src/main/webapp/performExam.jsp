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
	<div class="container mt-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Realizar Exame</h5>
				<p class="card-text"><b>CPF do Paciente:</b> <%= request.getParameter("patientCpf")%></p>
				<p class="card-text"><b>Tipo do Exame:</b> <%= request.getParameter("examType")%></p>
				<p class="card-text"><b>Hipótese Inicial:</b> <%= request.getParameter("hypothesis")%></p>
				<p class="card-text"><b>Data Prevista:</b> <%= request.getParameter("dateRequested")%></p>
				<p class="card-text"><b>CRM do Médico:</b> <%= request.getParameter("doctorCrm")%></p>
				
				<form action="mvc" method="POST">
					<input type="hidden" name="id" value=<%= request.getParameter("id")%>>
					<input type="hidden" name="logic" value="PerformExam">
			        <input class="btn btn-primary" type="submit" value="Realizar Exame">
				</form>
			</div>
        </div>
    </div>
	
</body>
</html>