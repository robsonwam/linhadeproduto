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
	<H1 ALIGN=LEFT ><fmt:message key="campo.lista_membro"/></H1>
	<c:forEach var="tipo" items="${tipos}">
		<H2 ALIGN=LEFT >
			${tipo.nome}
		</H2>
		<table>
			<tr>
				<c:forEach var="membro" items="${tipo.membroCollection}">
					<td align="center" width="120" height="160">
						<a href="Relatorio.do?membro=${membro.codigo}">
						<c:if test="${membro.fotoByte != null}">
							<img src="Foto.do?id=${membro.codigo}" width="120" />
						</c:if>  
						<br/>${membro.nome}
						</a>
					</td>
				</c:forEach>
			</tr>
		</table>
	</c:forEach>
</body>
</html>