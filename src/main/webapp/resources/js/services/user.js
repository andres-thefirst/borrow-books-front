(function (app){
	app.factory('user', User);
	
	User.$inject = ['$http','$q'];
	
	function User($http, $q){
		
		this.existUser = function(email){
			var def = $q.defer();
			
			$http.post(contextPath+'/user/isUserExist', { email: email}, {method: 'POST'}).then(
					  function(response){
						  if(response.data.content!=null && !response.data.content)
							  def.resolve();
						  else
							  def.reject()
					  },
					  function(response){
						  def.reject()
						  console.log(response);
					  }
			  )
			  
			  return def.promise;
		}
		
		return this;
	}
})(app);