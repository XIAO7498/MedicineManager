/**
 * 
 */
$(function(){
	
	$(".add_to_cart_button").click(function(){
		var flag = $(this).next(":hidden").val();
		if(flag == "true"){
			var url = this.href;
			var args = {"quantity":1,"time":new Date()};
			$.post(url, args, function(data){
				if(data == "1"){
					location.reload();
				}else{
					alert("加入购物车失败!");
				}
			});	
		}else{
			location.href = "user-login";
		}
		
		//取消超链接的默认行为
		return false;
	});	
	
	$(".add-to-cart-link").click(function(){
		var flag = $(this).next(":hidden").val();
		if(flag == "true"){
			var url = this.href;
			var args = {"quantity":1,"time":new Date()};
			$.post(url, args, function(data){
				if(data == "1"){
					location.href = "user-toIndex";
				}else{
					alert("加入购物车失败!");
				}
			});	
		}else{
			location.href = "user-login";
		}
		
		//取消超链接的默认行为
		return false;
	});		
	
	$("button[name=add_to_cart]").click(function(){
		var flag = $(this).next(":hidden").val();
		var id = $(this).next().next(":hidden").val();
		var quantity = $(":input[name=quantity]").val();
		if(quantity <= 0){
			alert("数量格式不正确,请重新输入！");
		}else{
			if(flag == "true"){
				var url = "user-addToCart";
				var args = {"id":id,"quantity":quantity,"time":new Date()};
				$.post(url, args, function(data){
					if(data == "1"){
						location.reload();
					}else{
						alert("加入购物车失败!");
					}
				});	
			}else{
				location.href = "user-login";
			}
		}
		
		//取消超链接的默认行为
		return false;
	})
	
})