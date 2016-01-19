/**
 * 
 */
app.factory('bookImage', ['$http', function($http) {
  httpPost = function(token){
	  return $http.post(contextPath+'/book/missingImage',{},{
		  headers: {
			  'X-CSRF-TOKEN': token
		  }
	  })
	         .success(function(response) {
	           return response.data;
	         })
	         .error(function(response) {
	           return response.data;
	         });
	 }
  return {
	  httpPost: httpPost
  };
}]);