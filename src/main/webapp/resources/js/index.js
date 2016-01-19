(function (){
	$(document).ready(function(){
		$("input[type=submit], input[type=button], button" ).button();
		loadMenu();
	});

	function loadMenu(){
		$.get( "/front/menu", function( data ) {
  			$( "#right-bar" ).html( data );
		});
	}
})();