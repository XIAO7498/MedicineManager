<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript">
    
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
					$(":input[name=password]").after("<font color='red'>用户名或密码错误!</font>");
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
    
</script>
</head>
<body>
    
    <h4>用户登录页面</h4>
    
    <br><br>
    <div>
        <s:textfield name="userID" label="用户编号："></s:textfield><br><br>
        <s:password name="password" label="登录密码："></s:password><br><br>
        <input type="button" name="submit" value="登录">
    </div>
</body>
</html>