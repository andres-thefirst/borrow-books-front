/**
 * 
 */
app.directive('username',['$http','$q', function($http,$q) {
  return {
    require: 'ngModel',
    link: function(scope, elm, attrs, ctrl) {

      ctrl.$asyncValidators.username = function(modelValue, viewValue) {
    	 
    	  var def = $q.defer();

    	 $http.post(contextPath+'/user/isUserExist', { email: modelValue}, {method: 'POST'}).then(
    			  function(response){
    				  if(response.data.content!=null && !response.data.content)
    					  def.resolve();
    				  else
    					  def.reject()
    			  },
    			  function(response){
    				  def.reject()
    				  alert(response);
    			  }
    	  )
    	  
    	  return def.promise;
      };
    }
  };
}]);