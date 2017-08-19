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
                        <li><a href="user-page2?pageNo=1">高血压</a></li>
                        <li><a href="user-page3?pageNo=1">肝病</a></li>
                        <li><a href="user-page4?pageNo=1">呼吸系统</a></li>
                        <li class="active"><a href="user-page5?pageNo=1">糖尿病</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div>
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>糖尿病</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
            
            	<s:iterator value="#request.med_5">
            	  <a href="user-toDetail?id=${id }">
            		<div class="col-md-3 col-sm-6">
	                    <div class="single-product">
	                        <div class="product-upper">
	                            <img src="${photoPath }" alt="">
	                        </div>
	                        <h2><a href="">${medName }</a></h2>
	                        <div class="product-carousel-price">
	                            <ins>￥${price }</ins>
	                        </div>  
	                        
	                        <div class="product-option-shop">
	                           <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="user-addToCart?id=${id }">加入购物车</a>
	                            <input type="hidden" value="${session.logined }"/>
	                        </div>                       
	                    </div>
	                </div>
	              </a>  
            	</s:iterator>
            
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>
                          <ul class="pagination">
                            <s:if test="#request.totalPageNo == 1 || #request.totalPageNo == 2">
                              <li>
                                <a href="user-page5?pageNo=1" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                </a>
                              </li>
                            </s:if>
                            <s:if test="#request.totalPageNo != 1 && #request.totalPageNo != 2">
                              <s:if test="#request.pageNo == #request.totalPageNo">
	                            <li>
	                              <a href="user-page5?pageNo=${request.curPageNo }" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                              </a>
	                            </li>
	                          </s:if>
	                          <s:if test="#request.pageNo != #request.totalPageNo">
	                            <li>
	                              <a href="user-page5?pageNo=${request.prePageNo }" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                              </a>
	                            </li>
	                          </s:if>
                            </s:if>
                            
                            <s:if test="#request.totalPageNo == 1">
                              <li class="active"><a href="#">1</a></li>
                            </s:if>
                            <s:if test="#request.totalPageNo == 2">
                              <s:if test="#request.pageNo == 1">
                                <li class="active"><a href="user-page5?pageNo=1">1</a></li>
                                <li><a href="user-page5?pageNo=2">2</a></li>
                              </s:if>
                              <s:if test="#request.pageNo == 2">
                                <li><a href="user-page5?pageNo=1">1</a></li>
                                <li class="active"><a href="user-page5?pageNo=2">2</a></li>
                              </s:if>
                            </s:if>
                            <s:if test="#request.totalPageNo != 1 && #request.totalPageNo != 2">
                              <s:if test="#request.pageNo == 1">
                                <li class="active"><a href="user-page5?pageNo=${request.prePageNo }">${request.prePageNo }</a></li>
                                <li><a href="user-page5?pageNo=${request.curPageNo }">${request.curPageNo }</a></li>
                                <li><a href="user-page5?pageNo=${request.nextPageNo }">${request.nextPageNo }</a></li>
                              </s:if>
                              <s:if test="#request.pageNo == #request.totalPageNo">
                                <li><a href="user-page5?pageNo=${request.prePageNo }">${request.prePageNo }</a></li>
                                <li><a href="user-page5?pageNo=${request.curPageNo }">${request.curPageNo }</a></li>
                                <li class="active"><a href="user-page5?pageNo=${request.nextPageNo }">${request.nextPageNo }</a></li>
                              </s:if>
                              <s:if test="#request.pageNo == #request.curPageNo">
                                <li><a href="user-page5?pageNo=${request.prePageNo }">${request.prePageNo }</a></li>
                                <li class="active"><a href="user-page5?pageNo=${request.curPageNo }">${request.curPageNo }</a></li>
                                <li><a href="user-page5?pageNo=${request.nextPageNo }">${request.nextPageNo }</a></li>
                              </s:if>
                            </s:if>
                            
                            <s:if test="#request.totalPageNo ==1">
                              <li>
                                <a href="user-page5?pageNo=1" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </li>
                            </s:if>
                            <s:if test="#request.totalPageNo ==2">
                              <li>
                                <a href="user-page5?pageNo=2" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </li>
                            </s:if>
                            <s:if test="#request.totalPageNo !=1 && #request.totalPageNo !=2">
                              <s:if test="#request.pageNo == 1">
                                <li>
                                  <a href="user-page5?pageNo=${request.curPageNo }" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                  </a>
                                </li>
                              </s:if>
                              <s:if test="#request.pageNo != 1">
                                <li>
                                  <a href="user-page5?pageNo=${request.nextPageNo }" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                  </a>
                                </li>
                              </s:if>
                            </s:if>
                            
                          </ul>
                        </nav>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="footer.jsp" %>