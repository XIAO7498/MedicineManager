<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医药销售管理平台</title>

    <!-- Bootstrap -->
    <link href="templet2/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="templet2/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="templet2/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="templet2/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="templet2/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="templet2/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="templet2/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="templet2/build/css/custom.min.css" rel="stylesheet">
    
</head>
 <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fa fa-paw"></i> <span>MedicineManager</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="img/touxiang.png" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${session.adminID}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h2 style="text-align: center;"><a href="admin-toIndex"><i class="fa fa-home"></i> 首页 </a></h2>
                <ul class="nav side-menu">
              <li><a><i class="fa fa-edit"></i> 药品管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="admin-med_info">药品信息管理</a></li>
                      <li><a href="admin-med_type">药品类别管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 销售管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="admin-purchase_info" class="active">进货/需求管理</a></li>
                      <li><a href="admin-sales_info">药品销售管理</a></li>
                      <li><a href="admin-order_info">订单管理</a></li>
                    </ul>
                  </li>
                  
                  <s:if test="#session.role == 'superAdmin'">
                    <li><a><i class="fa fa-desktop"></i> 系统管理 <span class="fa fa-chevron-down"></span></a>
                      <ul class="nav child_menu">
                        <li><a href="admin-admin_account">管理员账号管理</a></li>
                        <li><a href="admin-user_account">用户账号管理</a></li>
                        <li><a href="admin-comment_info">评论管理</a></li>
                      </ul>
                    </li>
                  </s:if>
                  <s:if test="#session.role == 'Admin'">
                    <li class="disabled"><a><i class="fa fa-desktop"></i> 系统管理 <span class="fa fa-chevron-down"></span></a></li>
                  </s:if>
                  
                  
                </ul>
              </div>
              
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="admin-logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="img/touxiang.png" alt="">${session.adminID}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="admin-logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

             
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          
          <div class="row">
          
            <ul class="nav nav-pills nav-justified">
                <li class="active"><a href="#manage1" data-toggle="tab">添加需求</a></li>
                <li><a href="#manage2" data-toggle="tab">需求管理</a></li>
                <li><a href="#manage3" data-toggle="tab">库存管理</a></li>
            </ul>
            
            <div class="tab-content">
            	<div class="tab-pane fade in active" id="manage1">
            	  <div class="col-md-12 col-sm-12 col-xs-12">
		              <div class="x_panel">
		                <div class="x_title">
		                  <h2>添加需求</h2>
		                  <div class="clearfix"></div>
		                </div>
		                <div class="x_content">
		                  <div class="dashboard-widget-content">
		           	 
			           		  <form action="admin-searchInventory" method="post">
						        <div>
						          <div class="col-sm-1">
						            <span>库存：<s:select name="keyword" list="#{'=':'=','>':'>','<':'<' }"></s:select></span>
						          </div>
						             
						          <div class="col-sm-2">
						            <div class="input-group">
							      	  <input type="text" name="quantity" class="form-control" placeholder="">
								      <div class="input-group-btn">
								        <button type="submit" class="btn btn-default">查询</button>
								      </div>
							    	</div>
						          </div>
							    	
						 		</div>
							  </form>
		           	 
		      	 		    <table class="table">
						      <caption></caption>
						      <thead style="background-color: #F4F5F3">
						        <tr>
						          <th>药品名称</th>
						          <th>药品价格</th>
						          <th>药品库存</th>
						          <th>药品操作</th>
						        </tr>
						      </thead>
						      <tbody>
						        <s:iterator value="#request.med1">
						          <tr>
						            <td>${medName }</td>
						            <td>${price }</td>
						            <td>${medCount }</td>
						            <td>
						                <a href="#${id }" data-toggle="modal">添加需求</a>
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
										      <form class="form-horizontal" action="admin-addReq" method="post">
										        <div class="form-group">
													<label class="control-label">药品名称：</label>
										        	<div>
													  <input name="medName" class="form-control" value="${medName }" disabled>
													  <input name="id" type="hidden" value=${id }>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label">需求数量：</label>
										        	<div>
													  <input name="reqCount" class="form-control" required>
													</div>
												</div>
												<div class="form-group">    
										  			<label class="control-label"></label>
										  			<div style="margin-top: 20px;">
										        	<input type="submit" value="添加" class="btn btn-lg btn-primary btn-block">
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
		              
		          </div>
            	
            	</div>
            	
            	<div class="tab-pane fade" id="manage2">
            	  <div class="col-md-12 col-sm-12 col-xs-12">
		              <div class="x_panel">
		                <div class="x_title">
		                  <h2>需求管理</h2>
		                  <div class="clearfix"></div>
		                </div>
		                <div class="x_content">
		                  <div class="dashboard-widget-content">
		                  
		                    <s:if test="#request.req == null || #request.req.size() == 0">
		                                                       需求为空！
		                    </s:if>
		                    <s:else>
		                        <table class="table">
							      <caption></caption>
							      <thead style="background-color: #F4F5F3">
							        <tr>
							          <th>药品名称</th>
							          <th>药品价格</th>
							          <th>库存数量</th>
							          <th>需求数量</th>
							          <th>需求操作</th>
							        </tr>
							      </thead>
							      <tbody>
							        <s:iterator value="#request.req">
							          <tr>
							            <td>${medName }</td>
							            <td>${price }</td>
							            <td>${medCount }</td>
							            <td>${reqCount }</td>
							            <td>
							                <a href="#${id }" data-toggle="modal">修改</a>
							                <em>|</em>
							                <a href="admin-purchaseComplete?id=${id }">进货完成</a>
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
											      <form class="form-horizontal" action="admin-addReq" method="post">
											        <div class="form-group">
														<label class="control-label">药品名称：</label>
											        	<div>
														  <input name="medName" class="form-control" value="${medName }" disabled>
														  <input name="id" type="hidden" value=${id }>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label">需求数量：</label>
											        	<div>
														  <input name="reqCount" class="form-control" required>
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
							    <hr/>
		                    </s:else>
		                  
		           	      
		                  </div>
		                </div>
		              </div>
		              
		          </div>
            	
            	</div>
            	
            	<div class="tab-pane fade" id="manage3">
       	          <div class="col-md-12 col-sm-12 col-xs-12">
		              <div class="x_panel">
		                <div class="x_title">
		                  <h2>库存管理</h2>
		                  <div class="clearfix"></div>
		                </div>
		                <div class="x_content">
		                  <div class="dashboard-widget-content">
		                  
		                    <table class="table">
						      <caption></caption>
						      <thead style="background-color: #F4F5F3">
						        <tr>
						          <th>药品名称</th>
						          <th>药品价格</th>
						          <th>药品库存</th>
						          <th>药品操作</th>
						        </tr>
						      </thead>
						      <tbody>
						        <s:iterator value="#request.med2">
						          <tr>
						            <td>${medName }</td>
						            <td>${price }</td>
						            <td>${medCount }</td>
						            <td>
						                <a href="#${medName }" data-toggle="modal">修改库存</a>
						            </td>
						          </tr>
						          
						          <div class="modal fade" id="${medName }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <p></p>
									      </div>
									      <div class="modal-body">
										      <form class="form-horizontal" action="admin-modifyInventory" method="post">
										        <div class="form-group">
													<label class="control-label">药品名称：</label>
										        	<div>
													  <input name="medName" class="form-control" value="${medName }" disabled>
													  <input name="id" type="hidden" value=${id }>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label">库存数量：</label>
										        	<div>
													  <input name="medCount" class="form-control" value="${medCount }" required>
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
						    <hr/>
		           	      
		                  </div>
		                </div>
		              </div>
		              
		          </div>
            	
            	</div>
            
            </div>
  
     
          </div>
          <br />


          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="templet2/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="templet2/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="templet2/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="templet2/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="templet2/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="templet2/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="templet2/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="templet2/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="templet2/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="templet2/vendors/Flot/jquery.flot.js"></script>
    <script src="templet2/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="templet2/vendors/Flot/jquery.flot.time.js"></script>
    <script src="templet2/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="templet2/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="templet2/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="templet2/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="templet2/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="templet2/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="templet2/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="templet2/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="templet2/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="templet2/vendors/moment/min/moment.min.js"></script>
    <script src="templet2/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="templet2/build/js/custom.min.js"></script>
	
  </body>
</html>