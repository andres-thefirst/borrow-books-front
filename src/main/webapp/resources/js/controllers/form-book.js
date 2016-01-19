/**
 * 
 */
app.controller('FormBook', ['$http','$scope', function($http, $scope){
	$scope.id = null
	$scope.registerBook = function(){
		$http.post(contextPath+'/book/register',$scope.book,{
			headers: {
                'X-CSRF-TOKEN': angular.element(document.querySelector('#csrf')).val()
            }
		}).then(function successCallback(response){
					console.log(response.data);
					if(response.data.code==0)
						$scope.$parent.isRegister = true;
					$scope.$parent.book.id= response.data.content.id
				},function errorCallback(response){
					console.log(response.data);
				});
	}
}]);