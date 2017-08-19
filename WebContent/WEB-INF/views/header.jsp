<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/signin.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="templet/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="templet/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="templet/css/style.css">
<link rel="stylesheet" type="text/css" href="templet/css/responsive.css">
<title>医药销售管理平台</title>
<style type="text/css">
	body{
		background-color: #eee;
	}
</style>
</head>
<body>
  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="row">
        	<div class="navbar-header">
        		<a href="admin-login">管理员入口</a>
        	</div>
	        
            <div class="header-right" style="float: right;">
              <s:if test="#session.logined != 'true' ">
                                         您好，请
                <a href="user-login">登录</a>
                <em>|</em>
	            <a href="user-register">免费注册</a>
	          </s:if>
		      <s:if test="#session.logined == 'true' ">
	                                欢迎您,${session.userID}!
	            <a href="user-logout" style="color: orange;"> 注销</a>
	          </s:if>
	          <em>|</em>
	          <a href="user-order">我的订单</a>
	          <em>|</em>
              <a href="#">关于我们</a>
              <em>|</em>
                                     客服电话：4001-400-400
            </div>
        </div>
     </div>
     
     <!-- Modal 
     <div class="modal fade" id="user_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <p></p>
	      </div>
	      <div class="modal-body">
		      <form class="form-signin">
		        <h2 class="form-signin-heading">用户登录</h2>
		        <label for="userID" class="sr-only">用户名</label>
		        <input type="text" name="userID" class="form-control" placeholder="用户名" required autofocus>
		        <label for="password" class="sr-only">密码</label>
		        <input type="password" name="password" class="form-control" placeholder="密码" required>
		        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit1">登录</button>
		      </form>
	      </div>
	      <div class="modal-footer">
	      	<div style="margin-right: 10px">
              <p style="display:block;">
            	<a href="user-register">注册新账号</a>
              </p>
            </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="admin_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <p></p>
	      </div>
	      <div class="modal-body">
		    <form class="form-signin" action="admin-validateAdmin" method="post">
				<h2 class="form-signin-heading">管理员登录</h2>
		    	<label for="adminID" class="sr-only">管理员ID</label>
		    	<input type="text" name="adminID" class="form-control" placeholder="管理员ID" required autofocus>
			    <label for="adminPassword" class="sr-only">密码</label>
			    <input type="password" name="adminPassword" class="form-control" placeholder="密码" required>
			    <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">登录</button>
		   	</form>
	      </div>
	    </div>
	  </div>
	</div>
	-->
  </nav>
  
  <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-3" style="float: left;">
                    <div class="logo">
                        <h1><a href="user-toIndex"><img src="templet/img/logo.png"></a></h1>
                    </div>
                </div>
                
                <form action="user-search" method="post">
	                <div class="col-sm-6" style="float: left;margin-top: 50px;">
					    <div class="input-group">
					      <input type="text" name="keyword" class="form-control" placeholder="请输入药品名、症状" required>
					      <div class="input-group-btn">
					        <button type="submit" class="btn btn-default" style="height: 34px;">搜索</button>
					      </div>
					    </div>
				 	</div>
                </form>
                
                <div class="col-sm-3">
                    <div class="shopping-item">
                    	<s:if test="#session.logined != 'true' ">
			              <a href="user-shoppingCart"><i class="fa fa-shopping-cart"></i> 购物车  <span>></span><span class="product-count">0</span></a>                           
				        </s:if>
					    <s:if test="#session.logined == 'true' ">
				          <a href="user-shoppingCart"><i class="fa fa-shopping-cart"></i> 购物车  <span>></span><span class="product-count">${request.shoppingItemNumber}</span></a>                   
				        </s:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
     
       	<!--
        <div id="navbar" class="navbar-collapse collapse">
          <div class="nav navbar-nav navbar-right">
            <s:if test="#session.logined != 'true' ">
              <p style="display:block;">
            	您好，请先
            	
            	<a href="#myModal" data-toggle="modal">【登录】</a>
            	
            	<a href="user-login">【登录】</a>
            	<em>|</em>
            	<a href="user-register">【注册】</a>
              </p>
            </s:if>
            <s:if test="#session.logined == 'true' ">
            	<label>欢迎您,${session.userID}!</label>
            	<a href="user-logout" style="color: orange;">注销</a>
            </s:if>
          </div>
        </div>
      </div>
    
    --> 
    <!-- Modal 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <p></p>
	      </div>
	      <div class="modal-body">
		      <form class="form-signin">
		        <h2 class="form-signin-heading">用户登录</h2>
		        <label for="userID" class="sr-only">用户名</label>
		        <input type="text" name="userID" class="form-control" placeholder="用户名" required autofocus>
		        <label for="password" class="sr-only">密码</label>
		        <input type="password" name="password" class="form-control" placeholder="密码" required>
		        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">登录</button>
		      </form>
	      </div>
	      <div class="modal-footer">
	      	<div style="margin-right: 10px">
              <p style="display:block;">
            	<a href="user-register">注册新账号</a>
              </p>
            </div>
	      </div>
	    </div>
	  </div>
	</div>
   -->