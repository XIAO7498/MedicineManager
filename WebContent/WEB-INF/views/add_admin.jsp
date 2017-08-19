<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<title>医药销售管理平台</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<s:if test="#request.addSuccess == 'true'">
	  <div class="col-md-6">
	    <div class="alert alert-success alert-dismissible" role="alert">
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>添加成功!</strong>
		</div>
      </div>
    </s:if>

	<form class="form-horizontal" action="admin-addAdmin" method="post">
		<div class="form-group">
			<label class="col-sm-4 control-label">管理员ID：</label>
        	<div class="col-sm-4">
			  <input name="adminID" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">密码：</label>
        	<div class="col-sm-4">
			  <input type="password" name="adminPassword" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">重复密码：</label>
        	<div class="col-sm-4">
			  <input type="password" name="validatePassword" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">管理员账号类型：</label>
        	<div class="col-sm-4">
			  <s:select list="#{'1':'超级管理员','2':'普通管理员' }" name="role" value="2"></s:select>
			</div>
		</div>
		<div class="form-group">    
  			<label class="col-sm-4 control-label"></label>
  			<div class="col-sm-4" style="margin-top: 20px;">
        	<input type="submit" value="添加" class="btn btn-lg btn-primary btn-block">
        	</div>
        </div>
	</form>

</body>
</html>