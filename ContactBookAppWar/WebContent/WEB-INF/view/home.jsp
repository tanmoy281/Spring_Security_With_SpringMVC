<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Spring 4 Security Example</title>
</head>
<body>
	Welcome!
	<sec:authentication property="principal.username" />
	<div align="center">
		<h1>Contact List</h1>
		<h3>
			<a href="newContact">New Contact</a>
		</h3>
		<table border="1">
		<tr>
			<th>No</th>
			<th>Name</th>
			<th>Email</th>
			<th>Address</th>
			<th>Telephone</th>
			<th>Action</th>
		</tr>
			<c:forEach var="contact" items="${listContact}" varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>${contact.name}</td>
					<td>${contact.email}</td>
					<td>${contact.address}</td>
					<td>${contact.telephone}</td>
					<td><a href="editContact?contact_id=${contact.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a href="deleteContact?contact_id=${contact.id}">Delete</a>
					</td>

				</tr>
			</c:forEach>
		</table>
	</div>
	<form action="<%=request.getContextPath()%>/appLogout" method="POST">
		<input type="submit" value="Logout" /> <input type="hidden"
			name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
</html>
