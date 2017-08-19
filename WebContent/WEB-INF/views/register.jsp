<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/signin.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-datetimepicker.min.css">
<title>医药销售管理系统</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/tab.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="scripts/register.js"></script>
<style type="text/css">
	
	.register{
		border-width: 2px 1px 1px;
		border-color: #0083ce #eee #eee;
		border-style: solid;
		
		padding: 50px 0;
	}
	
</style>
</head>
<body>
	
	
    <div class="container">
	    <div class="site-branding-area">
	        <div class="container">
	            <div class="row">
	                <div>
	                    <div class="logo">
	                        <h1><a href="/MedicineManager"><img src="templet/img/logo.png"></a></h1>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    	<div class="register">
    	  <div class="row">
    		<form class="form-horizontal" action="user-save" method="post">
		  		<div class="form-group">
		        	<label class="col-sm-4 control-label">用户编号：</label>
		        	<div class="col-sm-4">
		        		<s:if test="id != null">
						<input name="userID" disabled class="form-control" required>
						<input type="hidden" name="id">
						</s:if>
						<s:else>
						<input name="userID" class="form-control" required>
						</s:else>
					</div>
				</div>
		  		<div class="form-group">
		        	<label class="col-sm-4 control-label">设置密码：</label>
		        	<div class="col-sm-4">
					<input type="password" name="password" class="form-control" required>
					</div>
				</div>
				
		  		<div class="form-group">
		        	<label class="col-sm-4 control-label">确认密码：</label>
		        	<div class="col-sm-4">
					<input type="password" name="validatePassword" class="form-control" required>
					</div>
				</div>
				
		  		<div class="form-group">
		        	<label class="col-sm-4 control-label">姓名：</label>
		        	<div class="col-sm-4">
		        	<input name="userName" class="form-control" required>
		        	</div>
		        </div>
		        
		  		<div class="form-group">
		        	<label class="col-sm-4 control-label">性别：</label>
		        	<div class="col-sm-4">
		        	  <s:radio list="#{'男':'男','女':'女' }" name="sex" cssStyle="line-height: 34px;" value="男"></s:radio>
		        	</div>
		        </div>
		        
		  		<div class="form-group">
		  			<label for="dtp_input" class="col-sm-4 control-label">生日：</label>
	                <div class="input-group date form_date col-md-4" style="padding: 0 15px;" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input" data-link-format="yyyy-mm-dd">
	                    <input name="birthday" class="form-control" value="" readonly>
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
					<input type="hidden" id="dtp_input" value="" /><br/>
		        </div>
		        
		  		<div class="form-group">
		        	<label class="col-sm-4 control-label">身份证号：</label>
		        	<div class="col-sm-4">
		        	<input name="IDCard" class="form-control" required>
		        	</div>
		        </div>
		        
		  		<div class="form-group">
		  			<label class="col-sm-4 control-label">邮箱：</label>
		  			<div class="col-sm-4">
		        	<input name="email" class="form-control" required>
		        	</div>
		        </div>
		        
		  		<div class="form-group">
		  			<label class="col-sm-4 control-label">手机号码：</label>
		  			<div class="col-sm-4">
		        	<input name="phone" class="form-control" required>
		        	</div>
		        </div>
		        
		  		<div class="form-group">    
		  			<label class="col-sm-4 control-label"></label>
		  			<div class="col-sm-4" style="margin-top: 20px;">
		        	<input type="submit" value="快速注册" class="btn btn-lg btn-primary btn-block">
		        	</div>
		        </div>
		        
		    </form>
    	  </div>	
    	</div>
    </div>
</body>
</html>