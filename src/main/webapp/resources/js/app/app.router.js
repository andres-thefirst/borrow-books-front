'use strict';

app.config(function ($routeProvider)
		{
	$routeProvider
	.when('/', {
      templateUrl: 'home'
    })
    .when('/share', {
      controller: 'RegisterBook',
      templateUrl: 'share'
    })
    .when('/books', {
      controller: 'SearchBooks',
      templateUrl: 'books'
    })
    .when('/book/:id', {
      controller: 'ShowBook',
      controllerAs: 'vm',
      templateUrl: 'book', 
    })
      .otherwise({
      redirectTo: '/'
    });
});