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
		  <s:if test="#request.result == null || #request.result.size() == 0">0条搜索结果</s:if>
		  <s:else>
		      <s:iterator value="#request.result">
		      <a href="user-toDetail?id=${id }">
			    <div class="col-md-3 col-sm-6">
	                <div class="single-shop-product">
	                    <div class="product-upper">
	                        <img src="${photoPath }" alt="">
	                    </div>
	                    <h2><a href="">${medName }</a></h2>
	                    <div class="product-carousel-price">
	                        <ins>￥${price }</ins>
	                    </div>  
	                    
	                    <div class="product-option-shop">
	                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" 
	                        data-product_id="70" rel="nofollow" href="/canvas/shop/?add-to-cart=70">加入购物车</a>
	                    </div>                       
	                </div>
	            </div>
	            </a>
			  </s:iterator>
		  </s:else>
		  
		</div>
	</div>

<%@ include file="footer.jsp" %>