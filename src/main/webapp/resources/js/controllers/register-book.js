/**
 * 
 */
app.controller('RegisterBook', ['$scope', 'bookImage', '$route', function($scope, bookImage, $route){
	$scope.isRegister = false;
	$scope.book = { id: null};
	$scope.isComplete = false;

	console.log(bookImage);
	bookImage.httpPost(angular.element(document.querySelector('#csrf')).val()).success(function(data){
		if(data.code==0){
			if(data.content!=null){
				console.log(data);
				$scope.isRegister=true;
				$scope.book.id=data.content.id;
			}
		}
	});
	
	$scope.addOneMore = function(){
		$route.reload();
	}
}]);