<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ExamStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Laudos para serem Realizados</title>
</head>
<body>
    <c:import url="logout.jsp"/>

    <c:if test="${sessionScope.doctor.doctorType != 'Residente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <jsp:useBean id="examDAO" class="yoa.cardiology.hospital.dao.ExamDAO"/>

    <br><br>

    <c:if test="${not empty requestScope.successMessage}">
        <div style="color: green;">${requestScope.successMessage}</div>
    </c:if>

    <c:forEach var="exam" items="${examDAO.obtainExamsByStatus(ExamStatus.WAITING_REPORT)}">
        Paciente: ${exam.patientCpf} Tipo: ${exam.examType } 
        Exame realizado em: 
        <c:choose>
            <c:when test="${not empty exam.datePerformed}">
                <fmt:formatDate value="${exam.datePerformed.time}" pattern="dd/MM/yyyy"/>
            </c:when>
            <c:otherwise>
                Data não disponível
            </c:otherwise>
        </c:choose>
        Status: ${exam.status }
        <a href="generateReport.jsp?id=${exam.id}&patientCpf=${exam.patientCpf}&examType=${exam.examType}
            &hypothesis=${exam.hypothesis}&datePerformed=
            <fmt:formatDate value="${exam.datePerformed.time}" pattern="dd/MM/yyyy"/> &doctorCrm=${exam.doctorCrm}">Realizar Laudo</a><br>    
    </c:forEach>
</body>
</html>
