/**
 * 
 */
app.controller("SearchBooks",["$http","$scope", function($http, $scope){
	$scope.listBooks = {};
	
	$http.post(contextPath+"/book/consultAll", { page: 0 }, {
		headers: {
            'X-CSRF-TOKEN': angular.element(document.querySelector('#csrf')).val()
        }
	}).then(function success(response){
		$scope.listBooks = response.data.content.listBooks;
	}, function error(response){
		console.log(response);
	});
}]);