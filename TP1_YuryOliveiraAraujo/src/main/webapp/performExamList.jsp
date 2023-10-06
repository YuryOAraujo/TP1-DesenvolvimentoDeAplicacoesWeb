<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ExamStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Exames para serem Realizados</title>
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
    	<c:if test="${not empty requestScope.successMessage}">
            <div class="mb-3 alert alert-success">${requestScope.successMessage}</div>
        </c:if>
        
        <h5>Lista de Exames para serem Realizados</h5>
        <c:choose>            
            <c:when test="${not empty examDAO.obtainExamsByStatus(ExamStatus.WAITING_EXAM)}">                
                <table class="thead table table-bordered">
                    <thead>
                        <tr>
                            <th>Paciente</th>
                            <th>Tipo</th>
                            <th>Data do Exame</th>
                            <th>Status</th>
                            <th>Realizar Exame</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="exam" items="${examDAO.obtainExamsByStatus(ExamStatus.WAITING_EXAM)}">
                            <tr>
                                <td>${exam.patientCpf}</td>
                                <td>${exam.examType}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty exam.dateRequested}">
                                            <fmt:formatDate value="${exam.dateRequested.time}" pattern="dd/MM/yyyy"/>
                                        </c:when>
                                        <c:otherwise>Data não disponível</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${exam.status}</td>
                                <td>
                                    <a href="performExam.jsp?id=${exam.id}&patientCpf=${exam.patientCpf}&examType=${exam.examType}&hypothesis=${exam.hypothesis}&dateRequested=<fmt:formatDate value="${exam.dateRequested.time}" pattern="dd/MM/yyyy"/>&doctorCrm=${exam.doctorCrm}" class="btn btn-primary">Realizar Exame</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">Não há exames para serem realizados.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
