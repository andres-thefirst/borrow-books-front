/**
 * 
 */
(function(app){
	'use strict';
	
	app.controller('FormBook', FormBook);
	
	FormBook.$inject = ['book', '$scope'];
	
	function FormBook(book, $scope){
		$scope.id = null;
		$scope.registerBook = function(){
			book.register($scope.book, angular.element(document.querySelector('#csrf')).val()).then(function successCallback(data){
				if(data.code==0){
					$scope.$parent.isRegister = true;
					$scope.$parent.book.id = data.content.id;
				}
			});
		};
	}
	
})(app);