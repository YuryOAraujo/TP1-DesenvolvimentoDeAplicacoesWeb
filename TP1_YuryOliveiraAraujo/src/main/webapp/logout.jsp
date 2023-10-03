<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1>Informações do Médico</h1>
	<p>CRM: ${sessionScope.doctor.crm}</p>
	<p>Nome: ${sessionScope.doctor.name}</p>
	<p>Tipo: ${sessionScope.doctor.doctorType}</p>
	
	<c:choose>
	    <c:when test="${sessionScope.doctor.doctorType != 'Geral'}">
	        <c:choose>
	            <c:when test="${sessionScope.doctor.doctorType == 'Docente'}">
	                <p>Título: ${sessionScope.doctor.title}</p>
	            </c:when>
	            <c:otherwise>
	                <p>Ano de Residência: ${sessionScope.doctor.residencyYear}</p>
	            </c:otherwise>
	        </c:choose>
	    </c:when>
	</c:choose>
	<a href="mvc?logic=Logout">Sair</a>
</body>
</html>
