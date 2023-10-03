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
	
	<c:if test="${sessionScope.doctor.doctorType != 'Docente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>
	
	<p>Médico: <%= request.getParameter("crm")%></p>
	<textarea id="description" name="description" rows="4" cols="50"><%= request.getParameter("description")%></textarea><br>
	<p>Status: <%= request.getParameter("status")%></p>
	<p>Conclusão: <%= request.getParameter("conclusion")%></p>
	
	<a href="mvc?logic=DownloadPDF&id=<%= request.getParameter("examId")%>" target="blank">Baixar exame</a>
	<form action="mvc" method="POST">
		<input type="hidden" name="id" value=<%= request.getParameter("id")%>>
		<input type="hidden" name="logic" value="GenerateDefinitiveReport">
        <input type="submit" value="Tornar Definitivo">
	</form>
</body>
</html>