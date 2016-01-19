/**
 * 
 */
app.controller('SignUp', ['$scope','$http', function($scope,$http){
	$scope.messages="";
	$scope.signUp = function(){
		$scope.messages="";
		$http({
			  method: 'POST',
			  url: contextPath+'signUp',
			  data: { email: $scope.email, password: $scope.password }
			}).then(function successCallback(response) {
			    // this callback will be called asynchronously
			    // when the response is available
				alert(response.data.code)
				if(response.data.code==0){
					$scope.messages="Registro Éxitoso";
					$scope.reset();
				}
				else
					$scope.messages="No se ha podido registrar, intentelo nuevamente"
			  }, function errorCallback(response) {
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
				  alert(response.data);
			  });
	};
	$scope.reset =  function() {
		$scope.email = "";
		$scope.password = "";
		$scope.confirm = "";
		
		$scope.form.$setPristine();
		$scope.form.$setUntouched();

      };
}]);