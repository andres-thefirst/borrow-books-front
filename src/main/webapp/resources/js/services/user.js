(function (app){
	app.factory('user', User);
	
	User.$inject = ['$http','$q'];
	
	function User($http, $q){
		
		var existUser = function(email){
			var def = $q.defer();
			console.log(email);
			$http.post(contextPath+'/user/isUserExist', { email: email}, {method: 'POST'}).then(
					  function(response){
						  if(response.data.content!=null && !response.data.content){
							  def.resolve(response.data.content);
						  }else
							  def.reject();
					  },
					  function(response){
						  def.reject()
					  }
			  )
			  return def.promise;
		}
		
		return {
			existUser: existUser
		};
	}
})(app);