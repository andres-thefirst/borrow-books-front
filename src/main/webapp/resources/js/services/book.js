(function (app){
	'use strict';
	
	app.factory("book", Book);
	
	Book.$inject = ['$http'];
	
	function Book($http){
		return {
			register: register,
			searchBooks: searchBooks
		}
		
		function register(dataBook, csrf){ 
			return $http.post(contextPath+'/book/register',dataBook,{
				headers: {
	                'X-CSRF-TOKEN': csrf
	            }
			}).then(function successCallback(response){
				if(response.data.code==0)
					return response.data;
			},function errorCallback(response){
				console.log(response.data);
			});
		}
		
		function searchBooks(page, csrf){
			return $http.post(contextPath+"/book/consultAll", { page: page }, {
				headers: {
		            'X-CSRF-TOKEN': csrf
		        }
			}).then(function success(response){
				return response.data;
			}, function error(response){
				console.log(response);
			});
		}
	}
	
})(app);