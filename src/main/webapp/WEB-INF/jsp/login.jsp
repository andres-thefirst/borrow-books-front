<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Borrow you books</title>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
		<script src="https://code.angularjs.org/1.2.28/angular-route.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css" />" charset="utf-8"/>
	</head>
	<body ng-app="books">
		<header class="header">
			<nav>
				<div class="left-bar">
					<div class="wrap-image">
						<img src="<c:url value="/resources/images/book_icon.png" />"/>
					</div>
					<div class="wrap-title">
						<h3>Borrow you Books</h3>
					</div>
				</div>
				<div class="right-bar">
					<menu class="menu"></menu>
				</div>	
			</nav>
		</header>
		<div class="l-content l-login">
			<h1>Log in</h1>
			<form action="<c:url value='/login' />" class="m-form" method="post">
				<c:if test="${param.error != null}">
					<span>
						Invalid username and password.
					</span>
				</c:if>
				<c:if test="${param.logout != null}">
					<span>
						You have been logged out.
					</span>
				</c:if>
				<div class="e-field">
					<div>
						<label for="username">Username</label>
					</div>
					<div>
						<input type="text" id="username" name="username"/>
					</div>
				</div>
				<div class="e-field">
					<div>
						<label for="password">Password</label>
					</div>
					<div>
						<input type="password" id="password" name="password"/>
					</div>
				</div>
				<input type="hidden"            
					name="${_csrf.parameterName}"
					value="${_csrf.token}"/>
				<button type="submit" class="btn">Log in</button>
			</form>
		</div>
		<footer>
			&copy; Andres-TheFirst
		</footer>
		<script type="text/javascript">
			var contextPath = "<c:url value="/" />"
		</script>
		<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<!--  <script src="<c:url value="/resources/js/index.js" /> " type="text/javascript"></script> -->
		<script src="<c:url value="/resources/js/app/app.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/sign-up.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/register-book.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/form-book.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/upload-image.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/search-books.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/directives/repeat.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/directives/username.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/services/book-image.js" /> " type="text/javascript"></script>
	</body>
</html>