/**
 * 
 */
app.controller('ShowBook', ['$scope','$routeParams', '$http', function($scope,$routeParams, $http, book){
	$http.post(contextPath+'/book/findById', {id: $routeParams.id}, {
		headers: {
            'X-CSRF-TOKEN': angular.element(document.querySelector('#csrf')).val()
        }
	}).then(function success(response){
		$scope.book = response.data.content;
	}, function error(response){
		console.log(response);
	});
	
}]);