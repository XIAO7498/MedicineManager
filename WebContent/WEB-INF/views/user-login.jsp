<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/signin.css">
<title>医药销售管理平台</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	
	.login{
		height:400px;
	
		border-width: 2px 1px 1px;
		border-color: #0083ce #eee #eee;
		border-style: solid;
	}
	
	.register{
	    padding-top: 35px;
	    padding-right: 50px;
	    
	    float: right;
	}
	
</style>
</head>
<body>
    
    
    
    <div style="width: 600px;margin: 0 auto;">
      <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-3" style="float: left;">
                    <div class="logo">
                        <h1><a href="/MedicineManager"><img src="templet/img/logo.png"></a></h1>
                    </div>
                </div>
            </div>
        </div>
      </div>
      
      <div  class="login">
          <div class="register"><span>还没有账号？<a href="user-register">免费注册</a></span></div>
	      <form class="form-signin" action="user-validateUser" method="post">
	      
	        <h2 class="form-signin-heading">Hi,欢迎登陆！</h2>
	        <s:if test="#request.lgfail == 'true'">
			    <div class="alert alert-warning alert-dismissible" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>用户名或密码错误!</strong>
				</div>
		    </s:if>
	        <input type="text" name="userID" class="form-control" placeholder="用户名" required autofocus>
	        <input type="password" name="password" class="form-control" placeholder="密码" required>
	        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">登录</button>
	      
	      </form>
      </div>
    </div> 
    
</body>
</html>