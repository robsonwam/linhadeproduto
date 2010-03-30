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
<h1 ALIGN=LEFT ><fmt:message key="campo.detalhe_membro"/></h1>
<c:if test="${not empty membro.fotoByte}">
<fmt:message key="campo.foto"/>:<br/>
<img src="Foto.do?id=${membro.codigo}" width="100" />
</c:if>
<br/>
<br/>
<table width="220">
			<tr>
				<td>
					<fmt:message key="campo.codigo"/>:
				</td>
				<td>
					${membro.codigo}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.nome"/>
				</td>
				<td>
					${membro.nome}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.tipo"/>:
				</td>
				<td>
					${membro.tipo.nome}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.tipo_estudante"/>
				</td>
				<td>
					${membro.tipoEstudante}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.orientador"/>
				</td>
				<td>
					${membro.orientador}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.co_orientador"/>
				</td>
				<td>
					${membro.coOrientador}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.departamento"/>
				</td>
				<td>
					${membro.departamento}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.email"/>
				</td>
				<td>
					${membro.email}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.telefone"/>
				</td>
				<td>
					${membro.telefone}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.website"/>
				</td>
				<td>
					${membro.website}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.cidade"/>
				</td>
				<td>
					${membro.cidade}
				</td>
			</tr>
			<tr>
				<td>
					<fmt:message key="campo.ativo"/>
				</td>
				<td>
					${membro.ativo}
				</td>
			</tr>
</table>
<h2><fmt:message key="campo.lista_publicacao"/></h2>
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
		<td>
			<fmt:message key="campo.pdf"/>
		</td>
		<td>
			<fmt:message key="campo.bibtex"/>
		</td>
	</tr>
	<c:forEach var="publicacao" items="${membro.publicacaoCollection}">
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
</body>
</html>