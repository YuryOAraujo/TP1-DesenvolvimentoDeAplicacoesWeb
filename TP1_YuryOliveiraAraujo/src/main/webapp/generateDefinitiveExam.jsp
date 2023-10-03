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

    <c:if test="${sessionScope.doctor.doctorType != 'Geral' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <c:set var="examId" value="${param.examId}" />
    <jsp:useBean id="examDAO" class="yoa.cardiology.hospital.dao.ExamDAO" />
    <c:set var="exam" value="${examDAO.obtainExamById(examId)}" />

    <p>Paciente: ${exam.patientCpf }</p>
    <p>Exame: ${exam.examType }</p>
    <p>Hipótese: ${exam.hypothesis }</p>
    <p>Data prevista: <fmt:formatDate value="${exam.dateRequested.time}" pattern="dd/MM/yyyy" /></p>
    <p>Exame realizado em: <fmt:formatDate value="${exam.datePerformed.time}" pattern="dd/MM/yyyy" /></p>
    <p>Médico: ${exam.doctorCrm }</p>
    <a href="mvc?logic=DownloadPDF&id=${examId}" target="blank">Baixar exame</a>

    <p>Médico que realizou o exame: ${param.crm}</p>
	<textarea id="description" name="description" rows="4" cols="50">${param.description}</textarea><br>
	<p>Status: ${param.status}</p>
	<p>Conclusão: ${param.conclusion}</p>

	<a href="javascript:history.back()">Voltar</a>
</body>
</html>
