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

	<form action="admin-searchMed" method="post">
        <div class="col-sm-6">
	    	<div class="input-group">
	      	  <input type="text" name="keyword" class="form-control" placeholder="请输入药品名">
		      <div class="input-group-btn">
		        <button type="submit" class="btn btn-default">搜索</button>
		      </div>
	    	</div>
 		</div>
    </form>
    
    <div>
    	<s:if test="#request.result == null || #request.result.size() == 0">
	      0条搜索结果
	    </s:if>
	    <s:else>
	        <table class="table">
		      <caption>搜索结果:</caption>
		      <thead>
		        <tr>
		          <th>药品名称</th>
		          <th>药品描述</th>
		          <th>药品价格</th>
		          <th>药品操作</th>
		        </tr>
		      </thead>
		      <tbody>
		        <s:iterator value="#request.result">
		          <tr>
		            <td>${medName }</td>
		            <td>${description }</td>
		            <td>${price }</td>
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
									<label class="control-label">药品名称：</label>
						        	<div>
									  <input name="medName" class="form-control" value="${medName }" disabled>
									</div>
								</div>
								 <div class="form-group">
									<label class="control-label">药品描述：</label>
						        	<div>
									  <input name="description" class="form-control" value="${description }" required>
									</div>
								</div>
								 <div class="form-group">
									<label class="control-label">药品价格：</label>
						        	<div>
									  <input name="price" class="form-control" value="${price }" required>
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
		    
		    
	    </s:else>
    </div>
    
    
    
    

</body>
</html>