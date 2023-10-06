<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="authentication.jsp"%>
<%@ page import="yoa.cardiology.hospital.utilities.ReportStatus" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Lista de Laudos Definitivos</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <c:import url="logout.jsp"/>

    <c:if test="${sessionScope.doctor.doctorType != 'Geral' }">
        <jsp:forward page="mainPage.jsp"/>
    </c:if>
    
    <div class="container mt-4">
    	<div class="card">
    		<div class="card-body">
		        <form action="mvc" method="POST">
		            <div class="mb-3">
		                <label for="cpf" class="form-label"><b>CPF do Paciente:</b></label>
		                <div class="input-group">
		                    <input type="text" id="cpf" name="cpf" value="${param.cpf}" class="form-control" required>
		                    <span class="ml-3 input-group-btn">
		                        <input class="btn btn-primary" type="submit" value="Verificar">
		                    </span>
		                </div>
		            </div>
		            
		            <c:if test="${not empty requestScope.successMessage}">
		                <jsp:useBean id="reportDAO" class="yoa.cardiology.hospital.dao.ReportDAO"/>
		                
		                <c:choose>
		                    <c:when test="${not empty reportDAO.obtainReportsByPatient(param.cpf)}">
		                        <div class="container">
		                            <h5>Lista de Laudos para serem Realizados</h5>
		                            <table class="table table-bordered">
		                                <thead>
		                                    <tr>
		                                        <th>CRM do Médico</th>
		                                        <th>Conclusão</th>
		                                        <th>Status</th>
		                                        <th>Detalhes</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <c:forEach var="report" items="${reportDAO.obtainReportsByPatient(param.cpf)}">
		                                        <tr>
		                                            <td>${report.crm}</td>
		                                            <td>${report.conclusion}</td>
		                                            <td>${report.status}</td>
		                                            <td><a href="generateDefinitiveExam.jsp?id=${report.id}&examId=${report.examId}&crm=${report.crm}&description=${report.description}&conclusion=${report.conclusion}&status=${report.status}" class="btn btn-primary">Ver mais detalhes</a></td>
		                                        </tr>
		                                    </c:forEach>
		                                </tbody>
		                            </table>
		                        </div>
		                    </c:when>
		                    <c:otherwise>
		                        <div class="alert alert-danger"><p>O paciente portador do cpf (${param.cpf}) não possui Laudos Definitivos.</p></div>
		                    </c:otherwise>
		                </c:choose>
		            </c:if>
		            
		            <input type="hidden" name="logic" value="ViewDefinitiveReports">
		        </form>
        	</div>
        </div>
    </div>
</body>
</html>
