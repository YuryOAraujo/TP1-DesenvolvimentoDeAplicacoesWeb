<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Solicitação de Exame</title>
<link rel="stylesheet" href="css/style.css">
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

    <div class="container mt-4">
        <div class="card mx-auto" style="max-width: 400px;"> <!-- Adjust max-width as needed -->
            <form action="mvc" method="POST">
                <div class="card-body">
                    <h5 class="card-title">Solicitação de Exame</h5>
                    <div class="mb-3">
                        <label for="cpf" class="form-label"><b>CPF do Paciente:</b></label>
                        <input type="text" id="cpf" name="cpf" value="${param.cpf}" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="examinationType" class="form-label"><b>Exame:</b></label>
                        <select id="examinationType" name="examinationType" class="form-select">
                            <option value="ecocardiograma" ${param.examinationType == 'ecocardiograma' ? 'selected' : ''}>Ecocardiograma</option>
                            <option value="eletrocardiograma" ${param.examinationType == 'eletrocardiograma' ? 'selected' : ''}>Eletrocardiograma</option>
                        </select>
                    </div>
                    <c:if test="${not empty requestScope.errorMessage}">
                        <div class="alert alert-danger">${requestScope.errorMessage}</div>
                    </c:if>
                    
                    <div class="mb-3">                        
                        <c:if test="${not empty requestScope.successMessage}">
                        	<label for="hypothesis" class="form-label"><b>Hipótese:</b></label>
                            <select id="hypothesis" name="hypothesis" class="form-select">
                                <option value="I46 - Parada cardíaca" ${param.hypothesis == 'I46 - Parada cardíaca' ? 'selected' : ''}>I46 - Parada cardíaca</option>
                                <option value="I47 - Taquicardia paroxística" ${param.hypothesis == 'I47 - Taquicardia paroxística' ? 'selected' : ''}>I47 - Taquicardia paroxística</option>
                                <option value="I48 - Flutter e fibrilacao atrial" ${param.hypothesis == 'I48 - Flutter e fibrilacao atrial' ? 'selected' : ''}>I48 - Flutter e fibrilacao atrial</option>
                                <option value="I49 - Outras arritmias cardíacas" ${param.hypothesis == 'I49 - Outras arritmias cardíacas' ? 'selected' : ''}>I49 - Outras arritmias cardíacas</option>
                                <option value="I42 - Cardiomiopatias" ${param.hypothesis == 'I42 - Cardiomiopatias' ? 'selected' : ''}>I42 - Cardiomiopatias</option>
                            </select>
                        </c:if>
                    </div>
                    
                    <input type="hidden" name="logic" value="ExaminationRequest">
                    <input class="btn btn-primary" type="submit" value="${submitButtonLabel}">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
