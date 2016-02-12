<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<br/><br/>
<section ng-controll="SearchBooks" class="l-books">
	<h1>Search Books</h1>
	<div ng-repeat="book in listBooks" class="wrap-book">
		<div class="content-book">
			<div class="title">
				 <h3>{{book.book}}</h3>
			</div>
			<div class="cover" style="background: url('<c:url  value="/book/image/{{ book.image}}" />')">
				<img ng-src="<c:url  value="/book/image/{{ book.image}}" />" alt="Failed to load"/>
			</div>
			<div class="data">
				<ul>
					<li><strong>Author</strong>: {{ book.author}} </li>
					<li><strong>Editorial</strong>: {{ book.editorial}}</li>
				</ul>
			</div>
			<div class="foot">
				<a href="#/book/{{ book.id }}"> Book it </a>
			</div>
		</div>
	</div>
	<div class="pagination">
		<div class="wrap-button">
			<span ng-click="first()"> First </span>
			<span ng-click="prev()"> Prev </span>
		</div>
		<div ng-repeat="number in numbers" class="wrap-button">
			<span ng-click="goToPage(number)" ng-class="isActived(number)"> {{ number }} </span>
		</div>
		<div class="wrap-button">
			<span ng-click="next()"> Next </span>
			<span ng-click="last()"> Last </span>
		</div>
	</div>
</section>
<input type="hidden"            
				name="${_csrf.parameterName}"
				id="csrf"
				value="${_csrf.token}"/>