/**
 * 
 */
(function (app){
	'use strict';
	
	app.factory("paginator", Paginator);
	
	function Paginator(){
		this.totalRecords;
		this.totalPages;
		this.currentPage;
		
		var self = this;
		
		return {
			getCurrent: getCurrent,
			nextPage: nextPage,
			prevPage: prevPage,
			firstPage: firstPage,
			lastPage: lastPage,
			reset: reset,
			update: update,
			goToPage: goToPage,
			numbersToShow: numbersToShow
		}
		
		function getCurrent(){
			return self.currentPage;
		}
		
		function nextPage(){
			var current = self.currentPage + 1;
			if(current >= 1  && current <= self.totalPages)
				self.currentPage = current;
		}
		
		function prevPage(){
			var current = self.currentPage - 1;
			if(current >= 1  && current <= self.totalPages)
				self.currentPage = current;
		}
		
		function firstPage(){
			self.currentPage = 1;
		}
		
		function lastPage(){
			self.currentPage = self.totalPages;
		}
		
		function reset(totalRecords, totalPages){
			self.totalRecords = totalRecords;
			self.totalPages = totalPages;
			self.currentPage = 1;
		}
		
		function update(totalRecords, totalPages){
			self.totalRecords = totalRecords;
			self.totalPages = totalPages;
		}
		
		function goToPage(page){
			if(page >= 1 && page <= self.totalPages)
				self.currentPage = page;
		}
		
		function numbersToShow(){
			var initialPoint;
			var endPoint;
			var ph;
			
			if(self.totalPages <= 5){
				initialPoint = 1;
				endPoint = self.totalPages;
			}
			else			
				if(self.currentPage >= (ph = (self.totalPages - 2))){
					initialPoint = ph - 2;
					endPoint = self.totalPages;
				}
				else
					if(self.currentPage <= 3){
						initialPoint = 1;
						endPoint = 5;
					}
					else{
						initialPoint = self.currentPage - 2;
						endPoint = self.currentPage + 2;
					}
			
			var result = [];
			for(var i = initialPoint; i<= endPoint; i++)
				result.push(i);
			return result;
		}
	}
	
})(app);