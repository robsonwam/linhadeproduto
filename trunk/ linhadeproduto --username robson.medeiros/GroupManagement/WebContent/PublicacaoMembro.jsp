<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link type="text/css" rel="stylesheet" href="style.css">
<script type="text/javascript" src="tablecloth.js"></script>
</head>
<body>
<h1><fmt:message key="campo.membros"/></h1>
<form action="PublicacaoMembro.do" method="post">
<table>
	<tr>
		<td>
			<fmt:message key="campo.codigo"/>
		</td>
		<td>
			<fmt:message key="campo.nome"/>
		</td>
		<td>
			
		</td>
	</tr>
	<c:forEach var="membro" items="${membros}">
	<tr>
		<td>
			${membro.codigo}
		</td>
		<td>
			${membro.nome}
		</td>
		<td>
			<input type="checkbox" name="membros" value="${membro.idMembro}">
		</td>
	</tr>
	</c:forEach>
</table>
<input type="submit" value="<fmt:message key="campo.enviar"/>">
</form>
</body>
</html>