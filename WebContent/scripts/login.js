$(function(){

	$(":input[name=submit]").click(function(){
		var val1 = $(":input[name=userID]").val();
		var val2 = $(":input[name=password]").val();
		val1 = $.trim(val1);
		val2 = $.trim(val2);
		
		if(val1 != "" && val2 != ""){
			//把当前节点后面的所有 font 兄弟节点删除
			$this.nextAll("font").remove();
			
			var url = "user-validateUser";
			var args = {"userID":val1,"password":val2,"time":new Date()};
			$.post(url, args, function(data){
				//表示可用
				if(data == "1"){
					alert("登录成功！");
				}
				//不可用
				else if(data == "0"){
					alert("登录失败！");						
				}
				//服务器错误
				else{
					alert("服务器错误!");
				}
			});
		}else{
			alert("用户名或密码为空");
			$(":input[name=userID]").val("");
			$(":input[name=password]").val("");
		}
	});
	
})
    