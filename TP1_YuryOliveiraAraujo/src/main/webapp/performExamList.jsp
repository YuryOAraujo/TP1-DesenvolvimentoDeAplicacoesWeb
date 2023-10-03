<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ExamStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Exames para serem Realizados</title>
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

    <c:forEach var="exam" items="${examDAO.obtainExamsByStatus(ExamStatus.WAITING_EXAM)}">
        Paciente: ${exam.patientCpf} Tipo: ${exam.examType } 
        Data do Exame: 
        <c:choose>
            <c:when test="${not empty exam.dateRequested}">
                <fmt:formatDate value="${exam.dateRequested.time}" pattern="dd/MM/yyyy"/>
            </c:when>
            <c:otherwise>
                Data não disponível
            </c:otherwise>
        </c:choose>
        Status: ${exam.status }
        <a href="performExam.jsp?id=${exam.id}&patientCpf=${exam.patientCpf}&examType=${exam.examType}
            &hypothesis=${exam.hypothesis}&dateRequested=
            <fmt:formatDate value="${exam.dateRequested.time}" pattern="dd/MM/yyyy"/> &doctorCrm=${exam.doctorCrm}">Realizar Exame</a><br>    
    </c:forEach>
</body>
</html>
