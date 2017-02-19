<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sec:authorize access="isAuthenticated()">
	<%
		response.sendRedirect("secure/home");
	%>
</sec:authorize>
<style>
.fixed-input {
	width: 150px;
}
</style>
<html>
<head>
<title>Spring 4 Security Example</title>
</head>
<body>
	<h3 align="center">Spring 4 Security Example</h3>
	<font color="red"> ${SPRING_SECURITY_LAST_EXCEPTION.message} </font>
	<c:if test="${param.logout != null}">
		<p>You have been logged out.</p>
	</c:if>
	<div align="center">

		<form action="<%=request.getContextPath()%>/appLogin" method="POST">
			<table>
				<tr>
					<td>Enter UserName:</td>
					<td><input type="text" name="app_username" class="fixed-input" /></td>
				</tr>
				<tr>
					<td>Enter Password:</td>
					<td><input type="password" name="app_password"
						class="fixed-input" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Login" />&nbsp;&nbsp;<a
						href="register">Register</a></td>

				</tr>
				<tr>
					<td><input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /></td>
				</tr>
			</table>
		</form>

	</div>
<body>
</html>
