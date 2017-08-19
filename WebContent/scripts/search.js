$(function(){
	
	$(":input[name=submit]").click(function(){
		var val = $(":input[name=keyword]").val();
		val = $.trim(val);
		var url = "user-search";
		var args = {"keyword":val,"time":new Date()};
		$.post(url, args, function(data){
			
		});
	});
})