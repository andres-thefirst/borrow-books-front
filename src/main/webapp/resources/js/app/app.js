/**
 * 
 */

var app = angular.module('books', ['ngRoute']);


app.directive('menu', function() {
  return {
	restrict: 'E',
    templateUrl: contextPath+'/menu'
  };
});

app.config(function ($routeProvider)
		{
	$routeProvider
	.when('/',{
      templateUrl: 'home'
    })
    .when('/share',{
      controller: 'RegisterBook',
      templateUrl: 'share'
    })
    .when('/books',{
      controller: 'SearchBooks',
      templateUrl: 'books'
    })
      .otherwise({
      redirectTo: '/'
    });
});