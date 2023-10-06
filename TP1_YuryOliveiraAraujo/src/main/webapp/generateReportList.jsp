<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ExamStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Laudos para serem Realizados</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <c:import url="logout.jsp"/>

    <c:if test="${sessionScope.doctor.doctorType != 'Residente' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>

    <jsp:useBean id="examDAO" class="yoa.cardiology.hospital.dao.ExamDAO"/>

    <br><br>

    <div class="container">
        <h5>Lista de Laudos para serem Realizados</h5>

        <c:choose>
            <c:when test="${not empty requestScope.successMessage}">
                <div class="alert alert-success">${requestScope.successMessage}</div>
            </c:when>
            <c:when test="${not empty examDAO.obtainExamsByStatus(ExamStatus.WAITING_REPORT)}">
                <table class="thead table table-bordered">
                    <thead>
                        <tr>
                            <th>Paciente</th>
                            <th>Tipo</th>
                            <th>Exame realizado em</th>
                            <th>Status</th>
                            <th>Realizar Laudo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="exam" items="${examDAO.obtainExamsByStatus(ExamStatus.WAITING_REPORT)}">
                            <tr>
                                <td>${exam.patientCpf}</td>
                                <td>${exam.examType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty exam.datePerformed}">
                                            <fmt:formatDate value="${exam.datePerformed.time}" pattern="dd/MM/yyyy"/>
                                        </c:when>
                                        <c:otherwise>Data não disponível</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${exam.status}</td>
                                <td>
                                    <a href="generateReport.jsp?id=${exam.id}&patientCpf=${exam.patientCpf}&examType=${exam.examType}&hypothesis=${exam.hypothesis}&datePerformed=<fmt:formatDate value="${exam.datePerformed.time}" pattern="dd/MM/yyyy"/>&doctorCrm=${exam.doctorCrm}" class="btn btn-primary">Realizar Laudo</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">Não há laudos para serem realizados.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
