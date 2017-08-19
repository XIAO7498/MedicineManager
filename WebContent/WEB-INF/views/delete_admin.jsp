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

	<table class="table">
      <thead>
        <tr>
          <th>管理员ID</th>
          <th>密码</th>
          <th>管理员账号类型</th>
          <th>账号操作</th>
        </tr>
      </thead>
      <tbody>
        <s:iterator value="#request.admin">
          <tr>
            <td>${adminID }</td>
            <td>${adminPassword }</td>
            <td>${role.getRoleName() }</td>
            <td>
              <a href="#${id }" data-toggle="modal">修改</a>
              <em>|</em>
              <a href="#">删除</a>
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
				      <form class="form-horizontal">
				        <div class="form-group">
							<label class="control-label">管理员ID：</label>
				        	<div>
							  <input name="adminID" class="form-control" value="${adminID }" required>
							</div>
						</div>
						 <div class="form-group">
							<label class="control-label">密码：</label>
				        	<div>
							  <input name="adminPassword" class="form-control" value="${adminPassword }" required>
							</div>
						</div>
						<div class="form-group">    
				  			<label class="control-label"></label>
				  			<div style="margin-top: 20px;">
				        	<input type="submit" value="修改" class="btn btn-lg btn-primary btn-block">
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

</body>
</html>