<div class="l-home">
	<section class="welcome">
		<div>
			<p>You are here to <strong>share your books</strong> with us and you are going to get a <strong>borrowed books</strong>, how it works? it's easy:
				<ol>
					<li>Sign up</li>
					<li>Add your books to share</li>
					<li>Search books that you would like reading</li>
					<li>Ask the request to the owner lend you the book</li>
					<li>He has to choose a book of you</li>
					<li>Schedule a day to exchange the book</li>
					<li>Read the book</li>
					<li>Return the book to the owner</li>
				</ol>
			</p>
	
		</div>
	</section>
	<section class="m-sign-up">
		<h1>Sign up!</h1>
		<form novalidate  name="form" class="m-form" ng-controller="SignUp">
			<div>{{ messages }}</div>
			<div class="e-field">
				<div>
					<label for="email">E-mail:</label>
				</div>
				<div>
					<input type="email" name="email" ng-model="email" required username/>
				</div>
				<div>
					<span ng-show="form.email.$pending.username">Verificando si el usuario se encuentra disponible</span>
				</div>
				 <div ng-show="form.$submitted || form.email.$touched">
			      <span ng-show="form.email.$error.required">Escribe tu e-mail</span>
			      <span ng-show="form.email.$error.email">No es un correo valido</span>
			      <span ng-show="form.email.$error.username">El usuario ya existe</span>
			    </div>
			</div>	
			<div class="e-field">
				<div>
					<label for="password">Password:</label>
				</div>
				<div>
					<input type="password" name="password" ng-model="password" required />
				</div>
				<div ng-show="form.$submitted || form.password.$touched">
			      <span ng-show="form.password.$error.required">Escribe tu password</span>
			    </div>
			</div>
			<div class="e-field">
				<div>
					<label for="confirm">Confirm Password:</label>
				</div>
				<div>
					<input type="password" ng-model="confirm" name="confirm" required repeat="{{ password }}"/>
				</div>
				<div ng-show="form.$submitted || form.confirm.$touched || form.password.$touched">
			      <span ng-show="form.confirm.$error.required">Reescribe tu password</span>
			      <span ng-show="form.confirm.$error.repeat">No coinciden</span>
			    </div>
			</div>
			<input type="submit" value="Sign" class="btn" ng-click="signUp()" 
			ng-disabled="form.$invalid"/>
		</form>
	</section>
</div>