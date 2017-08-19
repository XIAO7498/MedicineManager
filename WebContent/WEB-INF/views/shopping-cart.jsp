<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<link rel="stylesheet" type="text/css" href="templet/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="templet/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="templet/css/style.css">
<link rel="stylesheet" type="text/css" href="templet/css/responsive.css">
<title>医药销售管理平台</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="templet/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="templet/js/jquery.sticky.js"></script>
<script type="text/javascript" src="templet/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="templet/js/main.js"></script>
<script type="text/javascript" src="templet/js/bxslider.min.js"></script>
<script type="text/javascript" src="templet/js/script.slider.js"></script>
<script type="text/javascript">
	
	$(function(){
		var cost = 0.00;
		
		$("#cost").text(cost.toFixed(2));
		
		$("#checkedAll_1").click(function(){
			var flag = this.checked;
			$(":checkbox[name='items']").prop("checked", flag);
			$("#checkedAll_2").prop("checked", flag);
			if(flag){
				var id = document.getElementsByName("items");
				for(var i = 0; i < id.length; i++){
					var val = id[i].value;
			    	var s1 = val.split(" ");
			    	cost += parseFloat(s1[1]);
			    	$("#cost").text(cost.toFixed(2)); 
			    } 
			}else{
				cost = 0.00;
				$("#cost").text(cost.toFixed(2));
			}
			
		});
		
		$("#checkedAll_2").click(function(){
			var flag = this.checked;
			$(":checkbox[name='items']").prop("checked", flag);
			$("#checkedAll_1").prop("checked", flag);
			if(flag){
				var id = document.getElementsByName("items");
				for(var i = 0; i < id.length; i++){
					var val = id[i].value;
			    	var s1 = val.split(" ");
			    	cost += parseFloat(s1[1]);
			    	$("#cost").text(cost.toFixed(2)); 
			    } 
			}else{
				cost = 0.00;
				$("#cost").text(cost.toFixed(2));
			}
		});
		
		$(":checkbox[name='items']").click(function(){
			if(this.checked){
				var val = $(this).val();
		    	var s1 = val.split(" ");
		    	cost += parseFloat(s1[1]);
		    	$("#cost").text(cost.toFixed(2));
			}else{
				var val = $(this).val();
		    	var s1 = val.split(" ");
		    	cost -= parseFloat(s1[1]);
		    	$("#cost").text(cost.toFixed(2));
			}
			
			$("#checkedAll_1").prop("checked", 
					$(":checkbox[name='items']").length == 
						$(":checkbox[name='items']:checked").length);
			
			$("#checkedAll_2").prop("checked", 
					$(":checkbox[name='items']").length == 
						$(":checkbox[name='items']:checked").length);
		});
		
		$(".checkout").click(function(){
			if($(":checkbox[name='items']:checked").length == 0){
				alert("请至少选中一件商品！");
			}else{
				var items = document.getElementsByName("items");
			    var value = new Array();
			    for(var i = 0; i < items.length; i++){
				    if(items[i].checked){
				    	var val = items[i].value;
				    	var s1 = val.split(" ");
				    	var id = parseInt(s1[0]);
				    	value.push(id);
				    }
			    }
			    location.href = "user-toOrder?items=" + value.toString() +"&cost=" + cost;
			}
			return false;
		})
		
		$(".delete").click(function(){
			if($(":checkbox[name='items']:checked").length == 0){
				alert("请至少选中一件商品！");
			}else{
				var items = document.getElementsByName("items");
			    var value = new Array();
			    for(var i = 0; i < items.length; i++){
				    if(items[i].checked){
				    	var val = items[i].value;
				    	var s1 = val.split(" ");
				    	var id = parseInt(s1[0]);
				    	value.push(id);
				    }
			    }
			    location.href = "user-deleteItems?items=" + value.toString();
			}
			return false;
		})
		
		$(":input[name=minus]").click(function(){
			var id = $(this).next(":hidden").val();
			var val = $(this).next().next(":hidden").val();
			val--;
			if(val == 0){
				var flag = confirm("确认不购买该商品吗?");
				if(flag){
					location.href = "user-deleteItem?id=" + id;
				}
			}else{
				var url = "user-change_quantity";
				var args = {"id":id, "quantity":val};
				$.post(url,args,function(data){
					if(data == "1"){
						location.reload();
					}
					else if(data == "0"){
					    alert("商品数量修改失败！");							
					}
					else{
						alert("服务器错误!");
					}
				})
			}
		})
		
		$(":input[name=plus]").click(function(){
			var id = $(this).next(":hidden").val();
			var val = $(this).next().next(":hidden").val();
			val++;
			var url = "user-change_quantity";
			var args = {"id":id, "quantity":val};
			$.post(url,args,function(data){
				if(data == "1"){
					location.reload();
				}
				else if(data == "0"){
				    alert("商品数量修改失败！");							
				}
				else{
					alert("服务器错误!");
				}
			})
		})
		$(":input[name=quantity]").change(function(){
			var val = $(this).val();
			var id = $(this).next(":hidden").val();
			if(val == 0){
				var flag = confirm("确认不购买该商品吗?");
				if(flag){
					location.href = "user-deleteItem?id=" + id;
				}
			}else if(val < 0){
				alert("输入格式有误！");
				location.reload();
			}else{
				var url = "user-change_quantity";
				var args = {"id":id, "quantity":val};
				$.post(url,args,function(data){
					if(data == "1"){
						location.reload();
					}
					else if(data == "0"){
					    alert("商品数量修改失败！");							
					}
					else{
						alert("服务器错误!");
					}
				})
			}
		})
	})
	
</script>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="row">
            <div class="header-right" style="float: right;">
	                         欢迎您,${session.userID}!
	          <a href="user-logout" style="color: orange;"> 注销</a>
	          <em>|</em>
	          <a href="user-order">我的订单</a>
	          <em>|</em>
              <a href="#">关于我们</a>
              <em>|</em>
                                    客服电话：4001-400-400
            </div>
        </div>
      </div>
    </nav>
  
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-3" style="float: left;">
                    <div class="logo">
                        <h1><a href="user-toIndex"><img src="templet/img/logo.png"></a></h1>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	<s:if test="#request.sci == null || #request.sci.size() == 0">
	  <div class="container">
    	<div class="row">
    		<div>
    		    <h3>我的购物车</h3>
    		    <hr/>
   		    </div>
   		    <div>
   		        <p>购物车是空的，快<a href="user-toIndex">去首页>></a>挑选需要的商品吧！</p>
   		    </div>
	    </div>
      </div>
	</s:if>
	<s:else>
	    <div class="container">
	    	<div class="row">
	    		<div>
	    		    <h3>我的购物车</h3>
	    		    <hr/>
	    		    <table class="table">
					  <caption></caption>
					  <thead class="navbar-default">
					    <tr>
					      <th>
					        <div style="float: left;width: 20px;">
				   		      <input type="checkbox" id="checkedAll_1">
				   			</div>
				   			<div style="float: left;">
				   		                全选
				   			</div>
					      </th>
					      <th style="text-align: center;">商品信息</th>
					      <th style="text-align: center;">单价</th>
					      <th style="text-align: center;">数量</th>
					      <th style="text-align: center;">小计</th>
					      <th style="text-align: center;">操作</th>
					    </tr>
					  </thead>
					  <tbody>
					    <s:iterator value="#request.sci">
					        <tr>
						      <td><input type="checkbox" name="items" value="${id } ${totalMoney }"></td>
						      <td style="text-align: center;">${medicine.medName }</td>
						      <td style="text-align: center;">￥${medicine.price }</td>
						      <td style="text-align: center;">
						        <div style="height: 35px;display: inline;">
							        <button type="button" name="minus" class="btn btn-default" style="height: 35px;">
									    <span>-</span>
									</button>
									<input type="hidden" value="${id }"/>
									<input type="hidden" value="${quantity }"/>
						        </div>
						        <div style="height: 35px;display: inline;">
						          <input type="text" name="quantity" value="${quantity }" style="width: 50px;height: 43px;text-align: center;"/>
						          <input type="hidden" value="${id }"/>
						        </div>
						        <div style="height: 35px;display: inline;">
							        <button type="button" name="plus" class="btn btn-default" style="height: 35px;">
									    <span>+</span>
									</button>
									<input type="hidden" value="${id }"/>
									<input type="hidden" value="${quantity }"/>
						        </div>
						        
						      </td>
						      <td style="color: red;text-align: center;">￥${totalMoney }</td>
						      <td style="text-align: center;"><a href="user-deleteItem?id=${id }">删除</a></td>
						    </tr>
					    </s:iterator>
					  </tbody>
					</table>
	    		</div>
	    	</div> 
	    </div>
	    
	    <div class="container navbar-default">
	   		<div class="row">
	   			<div style="float: left;margin-top: 22px;height: 50px;width: 30px;text-align: center;">
	   		      <input type="checkbox" id="checkedAll_2">
	   			</div>
	   			<div style="float: left;margin-top: 22px;height: 50px;width: 30px;text-align: center;">
	   		                全选
	   			</div>
	   			<div style="float: left;margin-top: 22px;height: 50px;width: 60px;text-align: center;">
	   		      <a href="user-deleteItems" class="delete">删除</a>
	   			</div>
	   			<div style="float: left;margin-top: 22px;height: 50px;width: 70px;text-align: center;">
	   		      <a href="user-clearCart">清空购物车</a>
	   			</div>
	   			
	   			<div style="float: right;margin-top: 22px;height: 50px;width: 200px;text-align: center;">
	   		      <a href="user-toOrder" class="checkout">去结算</a>
	   			</div>
	   			<div style="float: right;margin-top: 22px;height: 50px;width: 200px;text-align: center;">
	   		      <a href="user-toIndex">继续购物</a>
	   			</div>
	   			<div style="float: right;margin-top: 22px;height: 50px;width: 200px;text-align: center;">
	   		      <p>
	   		                    商品总价 &nbsp
	   		        <b style="color: red;">￥</b>
	   		        <span style="color: red;" id="cost"></span>
	   		      </p>
	   			</div>
	   		</div>
	    </div>
	</s:else>
    
    
   
</body>
</html>