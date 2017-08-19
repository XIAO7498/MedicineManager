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
          
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12" >
              <s:if test="#request.med.size() > 0">
                <div style="text-align: center;"><span style="color: red;">有${request.med.size() }种药品库存不足5件，请及时<a href="admin-purchase_info">进货</a>！</span></div>
                
                <table class="table">
			      <caption></caption>
			      <thead style="background-color: #F4F5F3">
			        <tr>
			          <th>药品名称</th>
			          <th>药品价格</th>
			          <th>药品库存</th>
			        </tr>
			      </thead>
			      <tbody>
			        <s:iterator value="#request.med">
			          <tr>
			            <td>${medName }</td>
			            <td>${price }</td>
			            <td>${medCount }</td>
			          </tr>
			        </s:iterator>
			      </tbody>
			    </table>
              </s:if>
              <s:else>
                <div style="text-align: center;"><span>药品库存充足！</span></div>
                
              </s:else>
            </div>

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

    <!-- Custom Theme Scripts -->
    <script src="templet2/build/js/custom.min.js"></script>
	
  </body>
</html>