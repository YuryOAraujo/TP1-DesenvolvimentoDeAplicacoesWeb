<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital de Cardiologia</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="mainPage.jsp">Hospital de
                Cardiologia</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link"
                        href="mvc?logic=Logout">Sair</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Informações do Médico</h5>
                <p class="card-text"><b>CRM:</b> ${sessionScope.doctor.crm}</p>
                <p class="card-text"><b>Nome:</b> ${sessionScope.doctor.name}</p>
                <p class="card-text"><b>Tipo:</b> ${sessionScope.doctor.doctorType}</p>
                <c:choose>
                    <c:when test="${sessionScope.doctor.doctorType != 'Geral'}">
                        <c:choose>
                            <c:when test="${sessionScope.doctor.doctorType == 'Docente'}">
                                <p class="card-text"><b>Título:</b> ${sessionScope.doctor.title}</p>
                            </c:when>
                            <c:otherwise>
                                <p class="card-text"><b>Ano de Residência:</b> ${sessionScope.doctor.residencyYear}</p>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</body>
</html>
