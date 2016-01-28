<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
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
		<div ng-view class="l-content"></div>
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
		<script src="<c:url value="/resources/js/app/app.router.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/app/menu.directive.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/sign-up.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/register-book.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/form-book.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/upload-image.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/search-books.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/controllers/show-book.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/directives/repeat.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/directives/username.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/services/book-image.js" /> " type="text/javascript"></script>
		<script src="<c:url value="/resources/js/services/user.js" /> " type="text/javascript"></script>
	</body>
</html>