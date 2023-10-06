<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Validar Laudo</title>
</head>
<body>
	<c:import url="logout.jsp"/>
	
	<c:if test="${sessionScope.doctor.doctorType != 'Docente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>
	
	<div class="container mt-4">
        <div class="card">
            <div class="card-body">
            	<h5 class="card-title">Validar Laudo</h5>
				<p class="card-text"><b>Médico:</b> <%= request.getParameter("crm")%></p>
				<p><b>Descrição:</b></p>
				<textarea id="description" name="description" rows="4" cols="50" readonly="readonly"><%= request.getParameter("description")%></textarea><br>
				<p class="card-text"><b>Status:</b> <%= request.getParameter("status")%></p>
				<p class="card-text"><b>Conclusão:</b> <%= request.getParameter("conclusion")%></p>
				
				<a href="mvc?logic=DownloadPDF&id=<%= request.getParameter("examId")%>" target="blank"><button class="mb-3 btn btn-primary">Baixar exame</button></a>
				<form action="mvc" method="POST">
					<input type="hidden" name="id" value=<%= request.getParameter("id")%>>
					<input type="hidden" name="logic" value="GenerateDefinitiveReport">
			        <input class="btn btn-primary" type="submit" value="Tornar Definitivo">
				</form>
			</div>
        </div>
    </div>
</body>
</html>