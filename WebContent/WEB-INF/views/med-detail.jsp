<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="header.jsp" %>
    
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
                        <li><a href="user-toIndex">首页</a></li>
                        <li><a href="user-page1?pageNo=1">家庭常备药</a></li>
                        <li><a href="user-page2">高血压</a></li>
                        <li><a href="user-page3">肝病</a></li>
                        <li><a href="user-page4">呼吸系统</a></li>
                        <li><a href="user-page5">糖尿病</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 
    
    <div class="slider-area">
		<div class="block-slider block-slider4">
		  
		    <div class="col-md-4 col-sm-6">
                <div class="single-shop-product">
                    <div class="product-upper">
                        <img src="${medDetail.photoPath }" alt="">
                    </div>
                    <br><br>
                    <div class="product-carousel-price">
                        <ins>商品编码：${medDetail.medNo }</ins>
                    </div> 
                </div>
            </div>
            
            <div class="col-md-6 col-sm-6" style="padding-left: 100px;">
              <h2>${medDetail.medName }</h2>
              
              <div><p style="color: red;">${medDetail.description }</p></div>
              
              <div class="product-carousel-price" style="padding-top: 20px;">
                  <span>药品单价：</span>
                  <span style="color: red;font-size:24px;">￥${medDetail.price }</span>
              </div>
              
              <div style="padding-top: 100px;">
                  <dl style="clear: left;">
                    <dt style="float: left;line-height: 40px;">数量：</dt>
                    <dd style="float: left;">
                      <div>
                        <div style="float: left;">
                          <button name="minus1" class="btn btn-default" style="width: 30px;height: 40px;">-</button>
                        </div>
                        <div style="float: left;">
                          <input name="quantity" type="text" class="form-control" value="1" style="width: 85px;height: 40px;"/>
                        </div>
                       <div style="float: left;">
                          <button name="plus1" class="btn btn-default" style="width: 30px;height: 40px;">+</button>
                        </div>
                        
                      </div>
                    </dd>
                  </dl>
              </div>
              
              <div class="col-sm-6" style="clear: left;padding-top: 40px;">
                  <button name="add_to_cart" class="btn btn-lg btn-block" style="background-color: #d80000;"><span style="color: white;">加入购物车</span></button>
                  <input type="hidden" value="${session.logined }"/>
                  <input type="hidden" value="${medDetail.id }"/>
              </div>  
              
              <!--  
              <div class="product-option-shop" style="margin-top: 100px;">
                  <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="user-addToCart?id=${medDetail.id }">加入购物车</a>
	              <input type="hidden" value="${session.logined }"/>
              </div> 
              -->          
            </div>
            
		    <hr/>
		    
		    <div class="col-md-12 col-sm-12">
		      <h3>商品详情：</h3>
		      <img src="${medDetail.detail1 }" alt="暂无图片">
		    </div>
		    <div class="col-md-12 col-sm-12" style="margin-top: 10px">
		      <img src="${medDetail.detail2 }" alt="暂无图片">
		    </div>
		</div>
	</div>

<%@ include file="footer.jsp" %>