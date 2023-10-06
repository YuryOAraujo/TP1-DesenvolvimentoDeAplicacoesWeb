<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Exame Definitivo</title>
</head>
<body>
    <c:import url="logout.jsp"/>

    <c:if test="${sessionScope.doctor.doctorType != 'Geral' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <c:set var="examId" value="${param.examId}" />
    <jsp:useBean id="examDAO" class="yoa.cardiology.hospital.dao.ExamDAO" />
    <c:set var="exam" value="${examDAO.obtainExamById(examId)}" />

	<div class="container mt-4">
	    <div class="card">
	        <div class="card-body">
	            <h5 class="card-title">Informações do Exame</h5>
	            <p><b>Paciente:</b> ${exam.patientCpf }</p>
	            <p><b>Exame:</b> ${exam.examType }</p>
	            <p><b>Hipótese:</b> ${exam.hypothesis }</p>
	            <p><b>Data prevista:</b> <fmt:formatDate value="${exam.dateRequested.time}" pattern="dd/MM/yyyy" /></p>
	            <p><b>Exame realizado em:</b> <fmt:formatDate value="${exam.datePerformed.time}" pattern="dd/MM/yyyy" /></p>
	            <p><b>Médico:</b> ${exam.doctorCrm }</p>
	            <a href="mvc?logic=DownloadPDF&id=${examId}" target="blank"><button class="btn btn-primary">Baixar exame</button></a>
	
	            <h5 class="mt-3 card-title">Informações do Laudo</h5>
	            <p><b>Médico que realizou o exame:</b> ${param.crm}</p>
	            <textarea readonly="readonly" id="description" name="description" rows="4" cols="50">${param.description}</textarea><br>
	            <p><b>Status:</b> ${param.status}</p>
	            <p><b>Conclusão:</b> ${param.conclusion}</p>
	
	            <a href="javascript:history.back()"><button class="btn btn-primary">Voltar</button></a>
	        </div>
	    </div>
	</div>

</body>
</html>
