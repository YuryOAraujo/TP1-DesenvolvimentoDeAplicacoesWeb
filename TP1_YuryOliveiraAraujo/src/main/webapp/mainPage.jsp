<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="authentication.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Página Principal</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<c:import url="logout.jsp"/>
	
	<div class="button-container">
        <c:choose>
            <c:when test="${sessionScope.doctor.doctorType == 'Geral'}">
                <a href="examinationRequest.jsp"><button class="serviceOption btn btn-primary"><h5>Solicitar Exames</h5></button></a>
                <a href="generateDefinitiveReportList.jsp"><button class="serviceOption btn btn-primary"><h5>Consultar Laudos e Exames</h5></button></a>
            </c:when>
            
            <c:when test="${sessionScope.doctor.doctorType == 'Residente'}">
                <a href="performExamList.jsp"> <button class="serviceOption btn btn-primary"><h5>Realizar Exames</h5></button></a>
                <a href="generateReportList.jsp"><button class="serviceOption btn btn-primary"><h5>Gerar Laudos dos Exames</h5></button></a>
            </c:when>
            
            <c:otherwise>
                <a href="generateTemporaryReportList.jsp"><button class="serviceOption btn btn-primary"><h5>Avaliar Laudos</h5></button></a>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>