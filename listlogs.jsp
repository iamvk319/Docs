<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="title.webapp"></spring:message></title>
<style>
body {
	font-family: arial, sans-serif;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

.red {
	color: red;
}
</style>
</head>
<body>
	<h1>
		<spring:message code="webapp.name"></spring:message>
	</h1>
	<hr />
	<p>Download log files</p>
	<form:form method="POST" modelAttribute="logsModel">
		<label>Path: <form:input type="text" path="logPath"
				id="logPath" /></label>
		<div class="has-error">
			<form:errors path="logPath" class="help-inline, red" />
		</div>
		<br>
		<input type="submit" value="List Files">
	</form:form>
	<p>Path: ${path}</p>
	<c:if test="${not empty fileList}">
		<ul>
			<c:forEach var="fileListVar" items="${fileList}">
				<li>File : <a href="download/${fileListVar}?path=${path}">${fileListVar}</a></li>
			</c:forEach>
		</ul>

	</c:if>
	<c:if test="${not empty dirList}">
		<ul>
			<c:forEach var="dirListVar" items="${dirList}">
				<li>Directory : ${dirListVar}</li>
			</c:forEach>
		</ul>

	</c:if>
</body>
</html>