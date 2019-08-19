$(function(){
	$(".member-add-button").on('click', function(){
		console.log("test");
		$.ajax({
			url:'/get_github_data' + '.json',
			type:'GET',
			dataType: 'json',
			success: function(response){
				console.log(response);
			}
		})
	})
});