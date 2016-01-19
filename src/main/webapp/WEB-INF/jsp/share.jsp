<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<br/><br/>
<section ng-hide="isRegister">
	<form name="form" ng-controller="FormBook" novalidate>
		<div>
			<label for="Book">Book</label>
		</div>
		<div>
			<input type="text" name="book" ng-model="book.book"/>
		</div>
		<div>
			<label for="author">Author</label>
		</div>
		<div>
			<input type="text" name="author" ng-model="book.author"/>
		</div>
		<div>
			<label for="editorial">Editorial</label>
		</div>
		<div>
			<input type="editorial" name="editorial" ng-model="book.editorial"/>
		</div>
		<div>
			<label for="isbn">ISBN</label>
		</div>
		<div>
			<input type="text" name="isbn" ng-model="book.isbn"/>
		</div>
		<div>
			<label for="resume">Resume</label>
		</div>
		<div>
			<textarea rows=8" cols="3" ng-model="book.resume" name="resume"></textarea>
		</div>
		<div>
			<input type="submit" ng-click="registerBook()" value="Register"/>
		</div>
	</form>
</section>

<section ng-show="isRegister && !isComplete">
	<form name="form" novalidate ng-controller="UploadImage" enctype="multipart/form-data">
		<div>
			<label for="image">Image</label>
		</div>
		<div>
			<input type="file" name="image"/>
		</div>
		<input type="hidden" ng-model="book.id" name="id"/>
		<input type="hidden"            
				name="${_csrf.parameterName}"
				id="csrf"
				value="${_csrf.token}"/>
		<div>
			<input type="submit"  ng-click="uploadImage(form)" value="Upload"/>
		</div>
	</form>
</section>

<section ng-show="isComplete">
	<p>Register complete successfully</p>
	<div>
		<input type="button" ng-click="addOneMore();" value="Add One More"/>
	</div>
</section>