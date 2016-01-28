<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<section class="l-show-book">
	<h1>{{ book.book }}</h1>
	<div class="wrap-content">
		<div class="cover" style="background-image: url('<c:url  value="/book/image/{{ book.image }}" />')">
		</div>
		<div class="data">
			<ul>
				<li><strong>Author</strong>: {{ book.author }} </li>
				<li><strong>Editorial</strong>: {{ book.editorial }}</li>
				<li><strong>Isbn</strong>: {{ book.isbn }}</li>
			</ul>
		</div>
	</div>
	<div class="foot">
		<h3>Resume</h3>
		<p>{{ book.resume }}</p>
	</div>
</section>
<input type="hidden"            
				name="${_csrf.parameterName}"
				id="csrf"
				value="${_csrf.token}"/>