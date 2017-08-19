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
	<form class="form-horizontal" action="admin-addMed" method="post">
		<div class="form-group">
			<label class="col-sm-4 control-label">药品编号：</label>
        	<div class="col-sm-4">
			  <input name="medNo" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">药品名称：</label>
        	<div class="col-sm-4">
			  <input name="medName" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">药品描述：</label>
        	<div class="col-sm-4">
			  <input name="description" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">药品价格：</label>
        	<div class="col-sm-4">
			  <input name="price" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">药品库存：</label>
        	<div class="col-sm-4">
			  <input name="medCount" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">药品图片存储路径：</label>
        	<div class="col-sm-4">
			  <input name="photoPath" class="form-control" required>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label">药品类别：</label>
        	<div class="col-sm-4">
        	  <s:select list="#request.category"
				listKey="id" listValue="categoryName" name="category" label=""></s:select>
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