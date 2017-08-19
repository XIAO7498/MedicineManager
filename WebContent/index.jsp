<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ include file="WEB-INF/views/header.jsp" %>
    
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
                        <li class="active"><a href="user-toIndex">首页</a></li>
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
			<ul class="" id="bxslider-home4">
				<li>
					<a href="#"><img width="750" height="400" src="img/slide-1.jpg" alt="Slide"></a>
				</li>
				<li>
					<a href="#"><img width="750" height="400" src="img/slide-2.jpg" alt="Slide"></a>
				</li>
				<li>
					<a href="#"><img width="750" height="400" src="img/slide-3.jpg" alt="Slide"></a>
				</li>
				<li>
					<a href="#"><img width="750" height="400" src="img/slide-4.jpg" alt="Slide"></a>
				</li>
				<li>
					<a href="#"><img width="750" height="400" src="img/slide-5.jpg" alt="Slide"></a>
				</li>
			</ul>
		</div>
    </div> 
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30天退换货</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>免费送货</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>安全支付</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>新产品</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">今日推荐</h2>
                        <div class="product-carousel">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-1.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="user-addToCart?id=1" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                        <input type="hidden" value="${session.logined }"/>
                                        <a href="user-toDetail?id=1" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=1">云南白药创可贴</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥13.9</ins>
                                </div> 
                            </div>
                           <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-2.jpg" alt="">
                                    <div class="product-hover">
                                       <a href="user-addToCart?id=2" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                       <input type="hidden" value="${session.logined }"/>
                                       <a href="user-toDetail?id=2" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=2">奥利司他胶囊</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥292.0</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-3.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="user-addToCart?id=3" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                        <input type="hidden" value="${session.logined }"/>
                                        <a href="user-toDetail?id=3" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=3">非那雄胺片</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥81.0</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-4.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="user-addToCart?id=4" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                        <input type="hidden" value="${session.logined }"/>
                                        <a href="user-toDetail?id=4" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=4">三七片</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥15.1</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-5.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="user-addToCart?id=5" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                        <input type="hidden" value="${session.logined }"/>
                                        <a href="user-toDetail?id=5" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=5">三九胃泰颗粒</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥9.5</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-6.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="user-addToCart?id=6" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                        <input type="hidden" value="${session.logined }"/>
                                        <a href="user-toDetail?id=6" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=6">健胃消食片</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥7.9</ins>
                                </div> 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/med-7.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="user-addToCart?id=7" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                        <input type="hidden" value="${session.logined }"/>
                                        <a href="user-toDetail?id=7" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                
                                <h2><a href="user-toDetail?id=7">万通筋骨贴</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins>￥19.9</ins>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    		
<%@ include file="WEB-INF/views/footer.jsp" %>