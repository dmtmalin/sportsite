$(function(){
	$.get('/sport/city', { city_id: $("#cities").val() } );

	$("#cities").on("change", function(){
		$.get('/sport/city', { city_id: this.value } );
	});
});