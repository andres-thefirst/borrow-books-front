/**
 * 
 */
(function(app){
	app.directive('username', Username);
	
	Username.$inject = ['user'];
	
	function Username(user){
		return {
		    require: 'ngModel',
		    link: function(scope, elm, attrs, ctrl) {
		      ctrl.$asyncValidators.username = function(modelValue, viewValue) {
		    	 return user.existUser(modelValue);
		      };
		    }
		  };
	}
})(app);