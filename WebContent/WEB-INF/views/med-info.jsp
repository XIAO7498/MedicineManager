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
                      <li><a href="admin-med_info" class="active">药品信息管理</a></li>
                      <li><a href="admin-med_type">药品类别管理</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 销售管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="admin-purchase_info">进货/需求管理</a></li>
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
          <!-- 
          <div class="row tile_count">
            <ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#add_med" data-toggle="tab">添加药品</a></li>
				<li><a href="#search_med" data-toggle="tab">查询药品</a></li>
			</ul>
          </div>
          -->
          
          <div class="row">
          
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>添加药品</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">
                    <div>
                        <s:if test="#request.addSuccess == 'true'">
						  <div class="col-md-12">
						    <div class="alert alert-success alert-dismissible" role="alert">
							  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							  <strong>添加成功!</strong>
							</div>
					      </div>
					    </s:if>
                    </div>
                    <div class="clearfix"></div>
                    <div>
           			  <form class="form-horizontal" action="admin-addMed" method="post">
						<div class="form-group">
							<label class="col-sm-4 control-label">药品编号：</label>
				        	<div class="col-sm-8">
							  <input name="medNo" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">药品名称：</label>
				        	<div class="col-sm-8">
							  <input name="medName" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">药品描述：</label>
				        	<div class="col-sm-8">
							  <input name="description" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">药品价格：</label>
				        	<div class="col-sm-8">
							  <input name="price" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">药品库存：</label>
				        	<div class="col-sm-8">
							  <input name="medCount" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">图片存储路径：</label>
				        	<div class="col-sm-8">
							  <input type="file" name="photoPath" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">药品类别：</label>
				        	<div class="col-sm-8">
				        	  <s:select list="#request.category"
								listKey="id" listValue="categoryName" name="category" label=""></s:select>
							</div>
						</div>
						<div class="form-group">    
				  			<div class="col-sm-12" style="margin-top: 20px;">
				        	  <input type="submit" value="添加" class="btn btn-lg btn-primary btn-block">
				        	</div>
				        </div>
					  </form>
					</div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-md-8 col-sm-8 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>药品操作</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">
                  	<div>
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
				    </div>
			        <div class="col-sm-12">
				    	<s:if test="#request.result == null || #request.result.size() == 0">
					      0条搜索结果
					    </s:if>
					    <s:else>
					        <h3>搜索结果:</h3>
					        <table class="table">
						      <caption></caption>
						      <thead style="background-color: #F4F5F3">
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
						                <a href="admin-deleteMed?id=${id }">删除</a>
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
										      <form class="form-horizontal" action="admin-modifyMed" method="post">
										        <div class="form-group">
													<label class="control-label">药品名称：</label>
										        	<div>
													  <input name="medName" class="form-control" value="${medName }" disabled>
													  <input name="id" type="hidden" value=${id }>
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
						    <hr/>
						    
					    </s:else>
				    </div>
				    
                  </div>
                </div>
              </div>
            </div>
	    	
            <!--  
            <div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="add_med">
					<p>添加药品</p>
				</div>
				<div class="tab-pane fade" id="search_med">
					<p>查询药品</p>
				</div>
			</div>
			-->
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