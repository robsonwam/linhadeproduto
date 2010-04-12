<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link type="text/css" rel="stylesheet" href="style.css">
<script type="text/javascript" src="tablecloth.js"></script>
</head>
<body>
<h1><fmt:message key="campo.publicacao"/></h1>
<c:if test="${form}">
<h2><fmt:message key="campo.pesquisa"/></h2>
<form action="Publicacao.do">
	<fmt:message key="campo.titulo"/>: <input type="text" name="title" value="${param.title}">
	<fmt:message key="campo.ordem"/>: <select name="order">
				<option value="id"><fmt:message key="campo.id"/></option>
				<option value="title"><fmt:message key="campo.titulo"/></option>
				<option value="date"><fmt:message key="campo.data"/></option>
			</select>
	<input type="submit">
</form>
</c:if>
<h2><fmt:message key="campo.lista"/></h2>

<table>
	<tr>
		<td>
			<fmt:message key="campo.codigo"/>
		</td>
		<td>
			<fmt:message key="campo.titulo"/>
		</td>
		<td>
			<fmt:message key="campo.tipo"/>
		</td>
		<td>
			<fmt:message key="campo.jornal"/>
		</td>
		<td>
			<fmt:message key="campo.mes"/>
		</td>
		<td>
			<fmt:message key="campo.ano"/>
		</td>
		<td>
			<fmt:message key="campo.volume"/>
		</td>
		<td>
			<fmt:message key="campo.numero"/>
		</td>
		<td>
			<fmt:message key="campo.paginas"/>
		</td>
		<td>
			<fmt:message key="campo.conferencia"/>
		</td>
		<td> 
			<fmt:message key="campo.instituicao"/>
		</td>
		<c:if test="${initParam.linhaPesquisa eq true}">
		<td>
			<fmt:message key="campo.linha_pesquisa"/>
		</td>
		</c:if>
		<td>
			<fmt:message key="campo.pdf"/>
		</td>
		<td>
			<fmt:message key="campo.bibtex"/>
		</td>
	</tr>
	<c:forEach var="publicacao" items="${publicacoes}">
	<tr>
		<td>
			${publicacao.id}
		</td>
		<td>
			${publicacao.title}
		</td>
		<td>
			${publicacao.tipo}
		</td>
		<td>
			${publicacao.jornal}
		</td>
		<td>
			${publicacao.mes}
		</td>
		<td>
			${publicacao.ano}
		</td>
		<td>
			${publicacao.volume}
		</td>
		<td>
			${publicacao.numero}
		</td>
		<td>
			${publicacao.pages}
		</td>
		<td>
			${publicacao.conference}
		</td>
		<td>
			${publicacao.school}
		</td>
		<c:if test="${initParam.linhaPesquisa eq true}">
		<td>
			${publicacao.grupoPesquisa.descricao}
		</td>
		</c:if>
		<td>
			<c:if test="${publicacao.arquivo != null}">
				<a href="publicacao.pdf?id=${publicacao.id}">
				<fmt:message key="campo.pdf"/>
				</a>
			</c:if>
		</td>
		<td>
			<a href="BibTex.do?id=${publicacao.id}">
				<fmt:message key="campo.bibtex"/>
			</a>
		</td>
	</tr>
	</c:forEach>
</table>
<br/>
<a href="javascript:history.back(1)"><fmt:message key="campo.voltar"/></a>
<div id="rodape">
<tr>
	<td>
	<a href="MudaLingua.do?lingua=en" target="_parent">
	<img src="imagens/en-US.png" width="40" height="20" />
	</a>
	</td>
	<td>
	<a href="MudaLingua.do?lingua=pt" target="_parent">
	<img src="imagens/pt-BR.png" width="40" height="20"/>
	</a>
	</td>
</tr>
</div>
</body>
</html>