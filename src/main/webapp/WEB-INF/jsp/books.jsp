<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<br/><br/>
<section ng-controll="SearchBooks">
	<div ng-repeat="book in listBooks">
		<div class="book-data">
			<div>
				<img ng-src="<c:url  value="/book/image/{{ book.image}}" />" />
			</div>
			<div>
				<ul>
					<li>Author: {{ book.author}} </li>
					<li>Book: {{book.book}}</li>
					<li>Editorial: {{ book.editorial}}</li>
				</ul>
			</div>
			<div>
				<h3>Resume</h3>
				<p>{{ book.resume }}</p>
			</div>
		</div>
	</div>
</section>
<input type="hidden"            
				name="${_csrf.parameterName}"
				id="csrf"
				value="${_csrf.token}"/>