<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<title>医药销售管理平台</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/distpicker.data.js"></script>
<script type="text/javascript" src="scripts/distpicker.js"></script>
<script type="text/javascript" src="scripts/main.js"></script>
<script type="text/javascript">
$(function(){

	$("#distpicker5").distpicker({
	  autoSelect: false
	});
	
	$("#add_new").click(function(){
		$("#div_1").hide();
		$("#div_2").show();
		return false;
	});
	
	$("#cancel").click(function(){
		$("#div_2").hide();
		$("#div_1").show();
		return false;
	});	
	
	$(":input[name=shipping_address]").click(function(){
		$("#addr").text($(this).val());
	})
	
	$(":input[name=order_submit]").click(function(){
		if($(":radio[name=shipping_address]:checked").length == 0){
			alert("请先选择收货地址！");
		}else{
			var val1 = $(":radio[name=shipping_address]:checked").val();
			var val2 = $(":radio[name=payMethod]:checked").val();
			var val3 = $(":radio[name=invoice]:checked").val();
			var value = new Array();
			$("input:hidden").each(function(){
				if(this.type == "hidden"){
					value.push(this.value);
				}
			})
			location.href = "user-orderSuccess?addr=" + encodeURI(encodeURI(val1)) + 
					"&payMethod=" + encodeURI(encodeURI(val2)) + "&invoice=" + encodeURI(encodeURI(val3))
					+ "&items=" + value.toString();
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
    
    <div class="container">
        <div class="row">
            <div class="col-sm-3" style="float: left;">
                <div class="logo">
                    <h1><a href="user-toIndex"><img src="templet/img/logo.png"></a></h1>
                </div>
            </div>
        </div>
    </div>
    
     <div class="container">
    	<div class="row">
    		<div>
    		    <h4>填写核对订单信息</h4>
    		    <hr/>
   		    </div>
   		    <div>
   		    	<h4>收货地址</h4>
   		    	
   		    	<div>
   		    	  <s:iterator value="#request.shipping_address">
   		    	    <input type="radio" name="shipping_address" value="${province }${address } ${receiver } ${phone }"/>${receiver } &nbsp ${phone } &nbsp ${province } &nbsp ${address }
   		    	    <br>
   		    	  </s:iterator>
   		    	</div>
   		    	
   		    	<div id="div_1" style="display: block;">
   		    	  <br>
   		    	  <a id="add_new" href="#">+新增收货地址</a>
   		    	</div>
   		    	<div id="div_2" style="display: none;background-color: #F4F5F3">
   		    	    <br>
   		    	    <form class="form-horizontal" action="user-saveAdress" method="post">
				      <div class="form-group">
				        <div id="distpicker5" >
					      	<label class="col-sm-2 control-label">收货地址：</label>
					      	<div class="col-sm-9">
					      	  <div class="col-sm-3">
					      	    <select class="form-control" name="province" data-province="---- 选择省 ----"></select>
					      	  </div>
					      	  <div class="col-sm-3">
					      	    <select class="form-control" name="city" data-city="---- 选择市 ----"></select>
					      	  </div>
					      	  <div class="col-sm-3">
					      	    <select class="form-control" name="district" data-district="---- 选择区 ----"></select>
					      	  </div>
					      	</div>
				      	</div>
			          </div>
			          	<div class="form-group">
				        	<label class="col-sm-2 control-label">详细地址：</label>
				        	<div class="col-sm-4">
							  <input name="address" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
				        	<label class="col-sm-2 control-label">收货人：</label>
				        	<div class="col-sm-4">
							  <input name="receiver" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
				        	<label class="col-sm-2 control-label">手机号码：</label>
				        	<div class="col-sm-4">
							  <input name="phone" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
				        	<label class="col-sm-2 control-label"></label>
				  			<div class="col-sm-6">
				  			  <div style="float: left;">
				  			    <input id="cancel" type="button" value="取消" class="btn btn-default">
				  			  </div>
				  			  <div style="float: left;" class="col-sm-4">
				  			    <input type="submit" value="保存地址" class="btn btn-primary btn-block">
				  			  </div>
				        	</div>
						</div>
				    </form>
				    <br>  
   		    	</div>
   		        <hr/>
   		    </div>
   		    
   		    <div>
   		    	<h4>支付信息</h4>
   		    	<div style="background-color: #F4F5F3">
   		    	  <br>
   		    	  <form class="form-horizontal" action="#" method="post">
   		    	    <div class="form-group">
   		    	    <label class="col-sm-1 control-label"></label>
   		    	      <input type="radio" name="payMethod" value="支付宝" checked="checked">支付宝
   		    	    </div>
   		    	    <div class="form-group">
   		    	    <label class="col-sm-1 control-label"></label>
   		    	      <input type="radio" name="payMethod" value="货到现金支付">货到现金支付
   		    	    </div>
   		    	    <div class="form-group">
   		    	    <label class="col-sm-1 control-label"></label>
   		    	      <input type="radio" name="payMethod" value="货到刷卡">货到刷卡
   		    	    </div>
   		    	    <div class="form-group">
   		    	    <label class="col-sm-1 control-label"></label>
   		    	      <input type="radio" name="payMethod" value="银行转账">银行转账
   		    	    </div>
   		    	  </form>
   		    	  <br>
   		    	</div>
   		    	<hr/>
   		    </div>
   		    
   		    <div>
   		    	<h4>发票信息</h4>
   		    	<div style="background-color: #F4F5F3">
   		    	  <br>
   		    	  <form class="form-horizontal" action="#" method="post">
   		    	    <div class="form-group">
   		    	    <label class="col-sm-1 control-label"></label>
   		    	      <input type="radio" name="invoice" value="暂不要发票" checked="checked">暂不要发票
   		    	    </div>
   		    	    <div class="form-group">
   		    	    <label class="col-sm-1 control-label"></label>
   		    	      <input type="radio" name="invoice" value="普通发票">普通发票
   		    	    </div>
   		    	    
   		    	  </form>
   		    	  <br>
   		    	</div>
   		    	<hr/>
   		    </div>
   		    
   		    <div>
   		    	<h4>商品信息</h4>
   		    	<hr/>
    		    <table class="table">
				  <caption></caption>
				  <thead class="navbar-default">
				    <tr>
				      <th>商品信息</th>
				      <th>数量</th>
				      <th>金额</th>
				    </tr>
				  </thead>
				  <tbody>
				    <s:iterator value="#session.sci">
				        <tr>
					      <td>${medicine.medName }</td>
					      <td>${quantity }</td>
					      <td>￥${totalMoney }</td>
					    </tr>
					    <input type="hidden" value="${id }"> 
				    </s:iterator>
				  </tbody>
				</table>
				<hr/>
				<div style="float: right;">
				  <span>￥${session.cost }</span>
				</div>
				<div style="float: right;width: 150px">
			      <span>总商品金额：</span>
				</div>
   		    </div>
   		    
   		    <br><br>
   		    
   		    <div>
   		      <div style="background-color: #FFFF99;height: 100px;">
   		      	  <div style="height: 20px;"></div>
	   		      <div style="text-align: right;margin-right: 50px;">
	   		        <h4>应付金额：<span style="color: red;">￥${session.cost }</span></h4>
	   		      </div>
	   		      <div style="text-align: right;margin-right: 50px;">
	   		        <p><b>送货至：</b><span id="addr"></span></p>
	   		      </div>
   		      </div>
   		      <div style="float: right;margin-top: 10px;">
   		        <input type="button" class="btn btn-primary btn-lg" name="order_submit" value="提交订单">
   		        <!--  
   		        <button name="order_submit" class="btn btn-primary btn-lg" type="submit">提交订单</button>
   		        -->
   		      </div>
   		      
   		    </div>
   		    
	    </div>
      </div>

	 

</body>
</html>