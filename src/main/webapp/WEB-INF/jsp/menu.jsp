<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page session="true"%>
<ul>
	<li><a href="<c:url value="#/home" />">Home</a></li>
	<li><a href="<c:url value="#/books" /> ">Books</a></li>
	<li><a href="#/share">Share</a></li>
	<li><a href="<c:url value="/login" />">Sign in</a></li>
</ul>