<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/navbar-fixed-top.css">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="templet/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="templet/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="templet/css/style.css">
<link rel="stylesheet" type="text/css" href="templet/css/responsive.css">
<title>医药销售管理平台</title>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/tab.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="templet/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="templet/js/jquery.sticky.js"></script>
<script type="text/javascript" src="templet/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="templet/js/main.js"></script>
<script type="text/javascript" src="templet/js/bxslider.min.js"></script>
<script type="text/javascript" src="templet/js/script.slider.js"></script>
<script type="text/javascript">
	
	$(function() {
		
	})

</script>
</head>
<body>
	
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="row">
	        
	        <div class="header-right" style="float: right;">
	        	<a href="admin-logout" style="color: orange;">注销</a>
	        </div>
             
        </div>
      </div>
    </nav>   

	<div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="/MedicineManager"><img src="templet/img/logo.png"></a></h1>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->

    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav nav-pills nav-justified">
                        <li class="active"><a href="#manage1" data-toggle="tab">药品管理</a></li>
                        <li><a href="#manage2" data-toggle="tab">销售管理</a></li>
                        <s:if test="#session.role == 'superAdmin'">
                        	<li><a href="#manage3" class="disabled" data-toggle="tab">系统管理</a></li>
                        </s:if>
                        <s:if test="#session.role == 'Admin'">
                        	<li class="disabled"><a href="">系统管理</a></li>
                        </s:if>
                    </ul>
                    
                </div> 
             
            </div>
        </div>
    </div>
    
    <div class="slider-area">
		<div class="block-slider block-slider4">
		
			   <div id="myTabContent" class="tab-content">
			    	
				    <div class="tab-pane active" id="manage1">
				    	<div class="col-md-2">
					    	<ul class="nav nav-pills nav-stacked">
					    		<li>
					    		  <a href="#infoManage" class="nav-header collapsed" data-toggle="collapse">
					    		          药品信息管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="infoManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#add_med" data-toggle="tab">添加药品</a></li>
					    		    <li><a href="#search_med" data-toggle="tab">查询药品</a></li>
					    		    <li><a href="#modify_med" data-toggle="tab">修改药品</a></li>
					    		    <li><a href="#delete_med" data-toggle="tab">删除药品</a></li>
					    		  </ul>
					    		</li>
					    		
					    		<li>
					    		  <a href="#typeManage" class="nav-header collapsed" data-toggle="collapse">
					    		          药品类别管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="typeManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#add_type" data-toggle="tab">添加类别</a></li>
					    		    <li><a href="#search_type" data-toggle="tab">查询类别</a></li>
					    		    <li><a href="#modify_type" data-toggle="tab">修改类别</a></li>
					    		    <li><a href="#delete_type" data-toggle="tab">删除类别</a></li>
					    		    <li><a href="#count_type" data-toggle="tab">类别统计</a></li>
					    		  </ul>
					    		</li>
					    	</ul>
				    	</div>
				    	<div class="col-md-10">
				    		<div class="tab-content">
				    			
				    			<div class="tab-pane" id="add_med">
				    				<iframe src="admin-add_med" width="800px" height="600px" scrolling="no" frameborder="0"></iframe>
				    			<!--  
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
				    				-->
				    			</div>
				    			<div class="tab-pane" id="search_med">
				    				<iframe src="admin-search_med" width="800px" height="600px" scrolling="no" frameborder="0"></iframe>
				    			</div>
				    			<div class="tab-pane" id="modify_med">
				    				<p>修改药品</p>
				    			</div>
				    			<div class="tab-pane" id="delete_med">
				    				<p>删除药品</p>
				    			</div>
				    			<div class="tab-pane" id="add_type">
				    				<p>添加类别</p>
				    				
				    				<form class="form-horizontal" action="admin-addCategory" method="post">
				    					<div class="form-group">
				    						<label class="col-sm-4 control-label">类别名称：</label>
								        	<div class="col-sm-4">
											  <input name="categoryName" class="form-control" required>
											</div>
				    					</div>
				    				
				    					<div class="form-group">
				    						<label class="col-sm-4 control-label">类别描述：</label>
								        	<div class="col-sm-4">
											  <input name="description" class="form-control" required>
											</div>
				    					</div>
				    					
				    					<div class="form-group">    
								  			<label class="col-sm-4 control-label"></label>
								  			<div class="col-sm-4" style="margin-top: 20px;">
								        	<input type="submit" value="添加" class="btn btn-lg btn-primary btn-block">
								        	</div>
								        </div>
				    				</form>
				    			</div>
				    			<div class="tab-pane" id="search_type">
				    				<p>查询类别</p>
				    			</div>
				    			<div class="tab-pane" id="modify_type">
				    				<p>修改类别</p>
				    			</div>
				    			<div class="tab-pane" id="delete_type">
				    				<p>删除类别</p>
				    			</div>
				    			<div class="tab-pane" id="count_type">
				    				<p>类别统计</p>
				    			</div>
				    			
				    		</div>
				    	</div>
				    </div>
				    <div class="tab-pane" id="manage2">
				    	
				    	<div class="col-md-2">
					    	<ul class="nav nav-pills nav-stacked">
					    		<li>
					    		  <a href="#PDManage" class="nav-header collapsed" data-toggle="collapse">
					    		          进货/需求管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="PDManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#add_demand" data-toggle="tab">添加需求</a></li>
					    		    <li><a href="#search_demand" data-toggle="tab">查询需求</a></li>
					    		    <li><a href="#modify_demand" data-toggle="tab">修改需求</a></li>
					    		    <li><a href="#delete_demand" data-toggle="tab">删除需求</a></li>
					    		    <li><a href="#modify_stock" data-toggle="tab">修改库存</a></li>
					    		  </ul>
					    		</li>
					    		
					    		<li>
					    		  <a href="#orderManage" class="nav-header collapsed" data-toggle="collapse">
					    		         订单管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="orderManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#search_order" data-toggle="tab">查询订单</a></li>
					    		    <li><a href="#handle_order" data-toggle="tab">处理订单</a></li>
					    		  </ul>
					    		</li>
					    	</ul>
				    	</div>
				    	<div class="col-md-10">
				    		<div class="tab-content">
				    			
				    			<div class="tab-pane" id="add_demand">
				    				<p>添加需求</p>
				    			</div>
				    			<div class="tab-pane" id="search_demand">
				    				<p>查询需求</p>
				    			</div>
				    			<div class="tab-pane" id="modify_demand">
				    				<p>修改需求</p>
				    			</div>
				    			<div class="tab-pane" id="delete_demand">
				    				<p>删除需求</p>
				    			</div>
				    			<div class="tab-pane" id="modify_stock">
				    				<p>修改库存</p>
				    			</div>
				    			<div class="tab-pane" id="search_order">
				    				<p>查询订单</p>
				    			</div>
				    			<div class="tab-pane" id="handle_order">
				    				<p>处理订单</p>
				    			</div>
				    			
				    		</div>
				    	</div>
				    </div>
				    <div class="tab-pane" id="manage3">
				    	
						<div class="col-md-2">
					    	<ul class="nav nav-pills nav-stacked">
					    		<li>
					    		  <a href="#adminManage" class="nav-header collapsed" data-toggle="collapse">
					    		          管理员账号管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="adminManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#add_admin" data-toggle="tab">添加管理员账号</a></li>
					    		    <li><a href="#delete_admin" data-toggle="tab">删除管理员账号</a></li>
					    		    <li><a href="#modify_admin" data-toggle="tab">修改账号密码</a></li>
					    		  </ul>
					    		</li>
					    		
					    		<li>
					    		  <a href="#userManage" class="nav-header collapsed" data-toggle="collapse">
					    		          用户账号管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="userManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#delete_user" data-toggle="tab">删除用户账号</a></li>
					    		  </ul>
					    		</li>
					    		
					    		<li>
					    		  <a href="#commentManage" class="nav-header collapsed" data-toggle="collapse">
					    		          评论管理
					    		    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
					    		  </a>
					    		  <ul id="commentManage" class="nav nav-list collapse" style="height: 0px;text-align: center;">
					    		    <li><a href="#search_comment" data-toggle="tab">查看评论</a></li>
					    		    <li><a href="#delete_comment" data-toggle="tab">删除评论</a></li>
					    		  </ul>
					    		</li>
					    	</ul>
				    	</div>
				    	<div class="col-md-10">
				    		<div class="tab-content">
				    			
				    			<div class="tab-pane" id="add_admin">
				    				<iframe src="admin-add_admin" width="800px" height="600px" scrolling="no" frameborder="0"></iframe>
				    			</div>
				    			<div class="tab-pane" id="modify_admin">
				    				<iframe src="admin-delete_admin" width="800px" height="600px" scrolling="no" frameborder="0"></iframe>
				    			</div>
				    			<div class="tab-pane" id="delete_admin">
				    				<iframe src="admin-delete_admin" width="800px" height="600px" scrolling="no" frameborder="0"></iframe>
				    			</div>
				    			<div class="tab-pane" id="delete_user">
				    				<p>删除用户账号</p>
				    			</div>
				    			<div class="tab-pane" id="search_comment">
				    				<p>查看评论</p>
				    			</div>
				    			<div class="tab-pane" id="delete_comment">
				    				<p>删除评论</p>
				    			</div>
				    			
				    		</div>
				    	</div>
				    </div>
			    	
			    </div> 
		
		</div>
    </div> 

</body>
</html>