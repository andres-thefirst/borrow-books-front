<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
		<title>My library</title>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/lib/jquery-ui-1.11.4.custom/jquery-ui.min.css"/> "/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/styles.css" />" />
	</head>
	<body>
		<header>
			<nav>
				<div id="right-bar">

				</div>	
				<div id="left-bar">
						<img src="<c:url value="/resources/images/book_icon.png" />" width="30px" height="30px"/>
						<h3>I will borrow you books</h3>
				</div>
			</nav>
		</header>
		<section>
			<c:if test="${success}">
				<p>Registro exitoso</p>
				<a href="<c:url value="/login" />" >Login</a>
			</c:if>
			<c:if test="${!success}">
				<p>No se ha podido registrar, intenete nuevamente</p>
				<a href="<c:url value="/" />" >Home</a>
			</c:if>
		</section>
		<footer>
			&copy; Andres-TheFirst
		</footer>
		<input type="hidden"            
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
		<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<script src="<c:url value="/resources/js/index.js" /> " type="text/javascript"></script>
	</body>
</html>