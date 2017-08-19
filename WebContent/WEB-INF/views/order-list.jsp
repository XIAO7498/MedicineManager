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

	<s:if test="#request.orderItems == null || #request.orderItems.size() == 0">
	  <div class="container">
    	<div class="row">
    		<div>
    		    <h3>我的订单</h3>
    		    <hr/>
   		    </div>
   		    <div>
   		        <p>您没有任何订单，请先<a href="user-toIndex">去首页>></a>挑选需要的商品吧！</p>
   		    </div>
	    </div>
      </div>
	</s:if>
	<s:else>
	    <div class="container">
	    	<div class="row">
	    		<div>
	    		    <h3>我的订单</h3>
	    		    <hr/>
	    		    <table class="table">
					  <caption></caption>
					  <thead class="navbar-default">
					    <tr>
					      <th>商品名称</th>
					      <th>价格</th>
					      <th>数量</th>
					      <th>实付款</th>
					      <th>配送信息</th>
					      <th>支付方式</th>
					      <th>发票信息</th>
					      <th>状态</th>
					      <th>操作</th>
					    </tr>
					  </thead>
					  <tbody>
					    <s:iterator value="#request.orderItems">
					        <tr>
						      <td>${medName }</td>
						      <td>${price }</td>
						      <td>${quantity }</td>
						      <td>￥${totalMoney }</td>
						      <td>${orders.deliveryInfo }</td>
						      <td>${orders.payMethod }</td>
						      <td>${orders.invoice }</td>
						      <td>${status }</td>
						      <td>
						        <s:if test="status == '取消'"></s:if>
						        <s:else>
						          <s:if test="status == '已发货'">
						            <a href="#${id }" data-toggle="modal">评价</a>
						          </s:if>
						          <s:if test="status == '未发货'">
						            <a href="user-cancelOrder?id=${id }">取消</a>
						          </s:if>
						          
						        </s:else>
						         
						       
						      </td>
						    </tr>
						    
						    <div class="modal fade" id="${id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <p></p>
							      </div>
							      <div class="modal-body">
								      <form class="form-horizontal" action="user-addComment" method="post">
								        <div class="form-group">
											<label class="control-label">药品名称：</label>
								        	<div>
											  <input name="medName" class="form-control" value="${medicine.medName }" disabled>
											  <input name="id" type="hidden" value=${id }>
											</div>
										</div>
								        
								        <div class="form-group">
											<label class="control-label">评价内容：</label>
								        	<div>
											  <input name="content" type="text" class="form-control" required>
											</div>
										</div>
									
										<div class="form-group">    
								  			<label class="control-label"></label>
								  			<div style="margin-top: 20px;">
								        	<input type="submit" value="评价" class="btn btn-lg btn-primary btn-block">
								        	</div>
								        </div>
								      </form>
							      </div>
							      <div class="modal-footer">
							      	<div style="margin-right: 10px">
						              
						            </div>
							      </div>
							    </div>
							  </div>
							</div>
							
					    </s:iterator>
					  </tbody>
					</table>
					<hr/>
	    		</div>
	    	</div> 
	    </div>
    </s:else>

</body>
</html>