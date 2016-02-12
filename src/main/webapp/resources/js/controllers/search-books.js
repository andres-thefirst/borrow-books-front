/**
 * 
 */
(function(app){
	'use strict';
	
	app.controller("SearchBooks", SearchBooks);
		
	SearchBooks.$inject = ["$scope","book", "paginator"];
	
	function SearchBooks($scope, book, paginator){
		$scope.listBooks = {};
		$scope.numbers = [];
		$scope.current = 1;
		
		console.log(paginator);
		
		book.searchBooks(0, angular.element(document.querySelector('#csrf')).val()).then(function success(data){
			$scope.listBooks = data.content.listBooks;
			paginator.reset(data.content.total, data.content.pages);
			$scope.numbers = paginator.numbersToShow();
		});
		
		$scope.next = function(){
			paginator.nextPage();
			$scope.pagination();
		};
		
		$scope.prev = function(){
			paginator.prevPage();
			$scope.pagination();
		}
		
		$scope.first = function(){
			paginator.firstPage();
			$scope.pagination();
		}
		
		$scope.last = function(){
			paginator.lastPage();
			$scope.pagination();
		}
		
		$scope.goToPage = function(page){
			paginator.goToPage(page);
			$scope.pagination();
		}
		
		$scope.pagination = function(){
			book.searchBooks(paginator.getCurrent()-1, angular.element(document.querySelector('#csrf')).val()).then(function success(data){
				$scope.listBooks = data.content.listBooks;
				paginator.update(data.content.total, data.content.pages);
				$scope.current = paginator.getCurrent();
				$scope.numbers = paginator.numbersToShow();
			});
		}
		
		$scope.isActived = function(number){
			if($scope.current===number)
				return "button-actived";
			else
				return "";	
		}
	}
	
})(app);