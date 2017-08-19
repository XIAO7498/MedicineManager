<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/signin.css">
<title>医药销售管理系统</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	
	.login{
		height:400px;
	
		border-width: 2px 1px 1px;
		border-color: #0083ce #eee #eee;
		border-style: solid;
	}
	
</style>
</head>
<body>

	<div style="width: 600px;margin: 0 auto;">
	  <div class="site-branding-area">
        <div class="container">
            <div class="col-md-3">
                <div class="logo">
                    <h1><a href="/MedicineManager"><img src="templet/img/logo.png"></a></h1>
                </div>
            </div>
        </div>
	  </div>
	  <div  class="login">
	  
		<form class="form-signin" action="admin-validateAdmin" method="post">
			<h2 class="form-signin-heading">请登录</h2>
			<s:if test="#request.lgfail == 'true'">
			    <div class="alert alert-warning alert-dismissible" role="alert">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>用户名或密码错误!</strong>
				</div>
		    </s:if>
	    	<label for="adminID" class="sr-only">管理员ID</label>
	    	<input type="text" name="adminID" class="form-control" placeholder="管理员ID" required autofocus>
		    <label for="adminPassword" class="sr-only">密码</label>
		    <input type="password" name="adminPassword" class="form-control" placeholder="密码" required>
		    <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">登录</button>
	   	</form>
   	  </div>
	</div>
</body>
</html>