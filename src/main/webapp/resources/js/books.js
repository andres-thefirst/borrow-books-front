(function (){
	var books = {};
	$(document).ready(function(){
		$.ajax({
			method:'GET',
			url:"books.json",
			dataType: "json",
			success: function(data){
				books = data.books;
				var content = "";
				$.each(books, function(index, value){
					content += toHtml(value);
				});
				$("#books").html(content);
				$("input[type=submit], input[type=button], button" ).button();
			},
			error:function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR);
			},
			complete: function(){
				console.log(books);
			}
		});
	});

	var toHtml = function(data){
		console.log(data)
		var codeHtml = '<div class="show-book">'+
			'<div>'+
				'<img src="'+ data.image +'" width="90px" height="140px">'+
			'</div>'+
			'<ul>'+
				'<li><strong> Title: </strong>' + data.title + '</li>'+
				'<li><strong> Authors: </strong>' + data.authors + '</li>'+
				'<li><strong> ISBN: </strong>' + data.isbn + '</li>'+
				'<li><input type="button" id="book_'+ data.id +'" value="Book"> </li>'+
			'</ul>'+
		'</div>';

		return codeHtml;
	} 
})();