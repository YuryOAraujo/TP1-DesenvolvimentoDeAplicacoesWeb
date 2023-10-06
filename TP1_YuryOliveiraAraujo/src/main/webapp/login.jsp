<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hospital de Cardiologia - Login</title>
    <!-- Include Bootstrap CSS and JavaScript from a CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="css/style.css">
</head>
<body class="loginForm">
    <div class="container form-container">
        <c:if test="${sessionScope.status == true }">
            <jsp:forward page="mainPage.jsp"/>
        </c:if>
        <h3 class="text-center text-primary">Hospital de Cardiologia</h3>
        <form action="mvc" method="POST">
            <div class="mb-3">
                <label for="crm" class="form-label text-primary">CRM:</label>
                <input type="text" class="form-control" id="crm" name="crm">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label text-primary">Senha:</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <input type="hidden" name="logic" value="ValidateLogin">
            <div class="d-grid">
                <button class="btn btn-primary" type="submit">Entrar</button>
            </div>
        </form>
    </div>
</body>
</html>
