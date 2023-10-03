<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Página Principal</title>
</head>
<body>
	<c:import url="logout.jsp"/>
	
	<br>
	<br>
	
	<c:choose>
	    <c:when test="${sessionScope.doctor.doctorType == 'Geral'}">
	        <a href="examinationRequest.jsp">Solicitar Exames</a>
	        <a href="generateDefinitiveReportList.jsp">Consultar Laudos e Exames</a>
	    </c:when>
	    
	    <c:when test="${sessionScope.doctor.doctorType == 'Residente'}">
	        <a href="performExamList.jsp">Realizar Exames</a>
	        <a href="generateReportList.jsp">Gerar Laudos dos Exames</a>
	    </c:when>
	    
	    <c:otherwise>
	    	<a href="generateTemporaryReportList.jsp">Avaliar Laudos</a>
	    </c:otherwise>
	</c:choose>
</body>
</html>