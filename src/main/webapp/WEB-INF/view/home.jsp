<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Welcome</title>
	</head>
	
	<body>
	
		<h2>Welcome to Nacu's Home Page!</h2>
		
		<hr>
		
		<p>User: <security:authentication property="principal.username"/></p>
		<p>Role(s): <security:authentication property="principal.authorities"/></p>
		
		<hr>
		
		<security:authorize access="hasRole('MANAGER')">
			<!-- Only for managers -->
			<p>
				<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
				(Only for Managers)
			</p>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
			<!-- Only for admins -->
			<p>
				<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
				(Only for Admins)
			</p>
		</security:authorize>
		
		<hr>
		
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="logut" />
		</form:form>
		
	</body>
</html>
