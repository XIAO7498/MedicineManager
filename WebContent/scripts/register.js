/**
 * 
 */
$(function(){
	
	$('.form_date').datetimepicker({
	    language:  'zh-CN',
	    weekStart: 1,
	    todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
	
	$(":input[name=userID]").change(function(){
		var val = $(this).val();
		val = $.trim(val);
		var $this = $(this);
		
		if(val != ""){
			//把当前节点后面的所有 font 兄弟节点删除
			$this.nextAll("font").remove();
			
			var url = "user-validateUserID";
			var args = {"userID":val, "time":new Date()};
			$.post(url, args, function(data){
				//表示可用
				if(data == "1"){
					$this.after("<font color='green'>UserID可用!</font>");
				}
				//不可用
				else if(data == "0"){
					$this.after("<font color='red'>UserID不可用!</font>");						
				}
				//服务器错误
				else{
					alert("服务器错误!");
				}
			});
		}else{
			alert("UserID 不能为空");
			$(this).val("");
			$this.focus();
		}
	});
	
	$(":input[name=validatePassword]").change(function(){
		var val1 = $(this).val();
		var val2 = $(":input[name=password]").val();
		var $this = $(this);
		if(val1 != val2){
			//把当前节点后面的所有 font 兄弟节点删除
			$this.nextAll("font").remove();
			$this.after("<font color='red'>两次输入密码不相同，请重新输入!</font>");
			$(":input[name=password]").val("");
			$(":input[name=validatePassword]").val("");
			$(":input[name=password]").focus();
		}else{
			$this.nextAll("font").remove();
		}
	});
	
})