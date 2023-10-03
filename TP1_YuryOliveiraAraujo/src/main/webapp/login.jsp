<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hospital de Cardiologia - Login</title>
</head>
<body>
	<c:if test="${sessionScope.status == true }">
		<jsp:forward page="mainPage.jsp"/>
	</c:if>
	<form action="mvc" method="POST">
        CRM: <input type="text" name="crm"><br>
        Senha: <input type="password" name="password" ><br>
        <input type="hidden" name="logic" value="ValidateLogin">
        <input type="submit" value="Entrar">
	</form>
</body>
</html>