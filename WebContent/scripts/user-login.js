$(function(){
	
	$(":input[name=submit]").click(function(){
		
		var val1 = $(":input[name=userID]").val();
		var val2 = $(":input[name=password]").val();
		val1 = $.trim(val1);
		val2 = $.trim(val2);
		$this = $(this);
		
		if(val1 != "" && val2 !=""){
			$(":input[name=password]").nextAll("font").remove();
			
			var url = "user-validateUser";
			var args = {"userID":val1, "password":val2, "time":new Date()};
			$.post(url, args, function(data){
				
				//表示可用
				if(data == "1"){
					location.href = "user-lgsuccess";
				}
				//不可用
				else if(data == "0"){
					$(":input[name=userID]").after("<font color='red'>用户名或密码错误!</font>");
					$(":input[name=userID]").val("");
					$(":input[name=password]").val("");
					$(":input[name=userID]").focus();
				}
				//服务器错误
				else{
					alert("服务器错误!");
				}
			});
		}else{
			alert("用户名或密码不能为空！");
		}
		
	});
	
})