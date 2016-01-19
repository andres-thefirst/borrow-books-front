/**
 * 
 */
app.directive('repeat', function(){
	return{
		require: 'ngModel',
		link: function(scope, elm, attrs, ctrl){
			ctrl.$validators.repeat = function(modelValue, viewValue){
				return modelValue==attrs['repeat']
			};
		}
	};
});