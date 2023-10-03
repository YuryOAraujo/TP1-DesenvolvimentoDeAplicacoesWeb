<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Solicitação de Exame</title>
</head>
<body>
	<c:import url="logout.jsp"/>
	
	<c:if test="${sessionScope.doctor.doctorType != 'Geral' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <c:set var="submitButtonLabel" value="Avançar" />
    <c:if test="${not empty requestScope.successMessage}">
        <c:set var="submitButtonLabel" value="Emitir" />
    </c:if>

    
    <form action="mvc" method="POST">
        CPF do Paciente: <input type="text" name="cpf" value="${param.cpf}"><br>
        <select name="examinationType">
            <option value="ecocardiograma" ${param.examinationType == 'ecocardiograma' ? 'selected' : ''}>Ecocardiograma</option>
            <option value="eletrocardiograma" ${param.examinationType == 'eletrocardiograma' ? 'selected' : ''}>Eletrocardiograma</option>
        </select><br>
        <c:if test="${not empty requestScope.errorMessage}">
            <div class="error-message">${requestScope.errorMessage}</div>
        </c:if>
        
        <c:if test="${not empty requestScope.successMessage}">
            <select name="hypothesis">
                <option value="I46 - Parada cardíaca" ${param.hipothesis == 'I46 - Parada cardíaca' ? 'selected' : ''}>I46 - Parada cardíaca</option>
                <option value="I47 - Taquicardia paroxística" ${param.hipothesis == 'I47 - Taquicardia paroxística' ? 'selected' : ''}>I47 - Taquicardia paroxística</option>
                <option value="I48 - Flutter e fibrilacao atrial" ${param.hipothesis == 'I48 - Flutter e fibrilacao atrial' ? 'selected' : ''}>I48 - Flutter e fibrilacao atrial</option>
                <option value="I49 - Outras arritmias cardíacas" ${param.hipothesis == 'I49 - Outras arritmias cardíacas' ? 'selected' : ''}>I49 - Outras arritmias cardíacas</option>
                <option value="I42 - Cardiomiopatias" ${param.hipothesis == 'I42 - Cardiomiopatias' ? 'selected' : ''}>I42 - Cardiomiopatias</option>
            </select><br>
        </c:if>
        
        <input type="hidden" name="logic" value="ExaminationRequest">
        <input type="submit" value="${submitButtonLabel}">
    </form>
</body>
</html>
