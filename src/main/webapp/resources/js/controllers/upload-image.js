/**
 * 
 */
app.controller("UploadImage", ['$http','$scope', function($http,$scope){

	$scope.uploadImage = function(form){ 
    	var fd = new FormData();
    	console.log(document.querySelector('input[name="image"]').files[0]);
    	fd.append("image", document.querySelector('input[name="image"]').files[0]);
    	fd.append("id", $scope.book.id)
    	
    	$http.post(contextPath+"/book/uploadImage", fd,{
    	  transformRequest: angular.identity,
		  headers: {
			  'X-CSRF-TOKEN': angular.element(document.querySelector('#csrf')).val(),
			  'Content-Type' : undefined
		  }
	  }).then(function successCallback(response) {
	           if(response.data.code==0){
	        	   $scope.$parent.isComplete=true; 
	           }
	         }, function errorCallback(response) {
	               
	         });
	}
}]);