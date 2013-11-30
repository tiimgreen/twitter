$(document).ready(function(){
	$('#txtComment').each(function(){
		var length = $(this).val().length;
		$('.letter-counter').html(140 - length);
		
		$(this).keyup(function(){
			var new_length = $(this).val().length;
			$('.letter-counter').html(140 - new_length);
		});
	});
});