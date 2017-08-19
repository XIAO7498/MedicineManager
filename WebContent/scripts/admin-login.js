$(function(){
		
	$(":input[name=submit2]").click(function(){
		
		var val1 = $(":input[name=adminID]").val();
		var val2 = $(":input[name=adminPassword]").val();
		val1 = $.trim(val1);
		val2 = $.trim(val2);
		$this = $(this);
		
		if(val1 != "" && val2 !=""){
			$(":input[name=password]").nextAll("font").remove();
			
			var url = "admin-validateAdmin";
			var args = {"adminID":val1, "adminPassword":val2, "time":new Date()};
			$.post(url, args, function(data){
				
				//表示可用
				if(data == "1"){
					location.href = "admin-lgsuccess";
				}
				//不可用
				else if(data == "0"){
					$(":input[name=adminPassword]").after("<font color='red'>用户名或密码错误!</font>");
					$(":input[name=adminID]").val("");
					$(":input[name=adminPassword]").val("");
					$(":input[name=adminID]").focus();
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