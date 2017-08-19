package com.xf.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.xf.entities.ShippingAddress;
import com.xf.entities.User;
import com.xf.service.UserService;
import com.xf.web.CriteriaMedicine;

public class UserAction extends ActionSupport implements ModelDriven<User>,Preparable,SessionAware,RequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String login(){
		return "login";
	}
	
	public String lgsuccess(){
		return "lgsuccess";
	}

	public String register(){
		return "register";
	}
	
	public String save(){
		userService.saveOrUpdate(model);
		userService.saveOrUpdate(model.getUserID());
		return "save";
	}
	
	private String province;
	
	public void setProvince(String province) {
		this.province = province;
	}
	
	private String city;
	
	public void setCity(String city) {
		this.city = city;
	}
	
	private String district;
	
	public void setDistrict(String district) {
		this.district = district;
	}
	
	private String address;
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	private String receiver;
	
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	private String phone;
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	private ShippingAddress shippingAddress = new ShippingAddress();
	
	public ShippingAddress setShippingAddress() {
		shippingAddress.setProvince(province);
		shippingAddress.setAddress(city+district+address);
		shippingAddress.setReceiver(receiver);
		shippingAddress.setPhone(phone);
		shippingAddress.setUser(userService.getUser((String) session.get("userID")));
		return shippingAddress;
	}
	
	public String saveAdress(){
		userService.saveOrUpdate(setShippingAddress());
		request.put("shipping_address", userService.getShippingAddress((String) session.get("userID")));
		return "saveAdress";
	}
	
	public void prepareSave(){
		model = new User();
	}
	
	public String logout(){
		session.clear();
		return "logout";
	}
	
	public String order(){
		if(session.get("userID") != null){
			request.put("orderItems", userService.getOrderItems((String) session.get("userID")));
			return "order";
		}else{
			return "login";
		}
		
	}
	
	private String keyword;
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String search(){
		request.put("result", userService.getSearchResult(keyword));
		if(session.get("logined") == "true"){
			request.put("shoppingItemNumber", userService.getShoppingItemNumber((String) session.get("userID")));
		}
		return "search";
	}
	
	private Integer id;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	private String items;
	
	public void setItems(String items) {
		this.items = items;
	}
	
	private Float cost;
	
	public void setCost(Float cost) {
		this.cost = cost;
	}
	
	public String toDetail(){
		request.put("medDetail", userService.getDetail(id));
		if(session.get("logined") == "true"){
			request.put("shoppingItemNumber", userService.getShoppingItemNumber((String) session.get("userID")));
		}
		return "detail";
	}
	
	public String toOrder(){
		session.put("sci", userService.getShoppingCartItemByID((String) session.get("userID"), items));
		session.put("cost", cost);
		request.put("shipping_address", userService.getShippingAddress((String) session.get("userID")));
		return "order_sure";
	}
	
	private Integer quantity;
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public String change_quantity(){
		try {
			userService.change_quantity(id, quantity);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}
	
	public String deleteItem(){
		userService.deleteShoppingCartItem3(id);
		request.put("sci", userService.getShoppingCartItem((String) session.get("userID")));
		return "shoppingCart";
	}
	
	public String deleteItems(){
		userService.deleteShoppingCartItem2(items);
		request.put("sci", userService.getShoppingCartItem((String) session.get("userID")));
		return "shoppingCart";
	}
	
	private String addr;
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	private String payMethod;
	
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	
	private String invoice;
	
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	
	public String orderSuccess() throws UnsupportedEncodingException{
		String str1 = URLDecoder.decode(addr, "utf-8");
		String str2 = URLDecoder.decode(payMethod, "utf-8");
		String str3 = URLDecoder.decode(invoice, "utf-8");
		userService.saveOrUpdate((String) session.get("userID"), str1, str2, str3, items);
		session.remove("sci");
		session.remove("cost");
		return "order_success";
	}
	
	public String cancelOrder(){
		userService.cancelOrder(id);
		request.put("orderItems", userService.getOrderItems((String) session.get("userID")));
		return "order";
	}
	
	public String addToCart(){
		try {
			userService.addToCart(id,quantity, (String) session.get("userID"));
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}
	
	public String shoppingCart(){
		if(session.get("userID")==null)
			return "login";
		else{
			request.put("sci", userService.getShoppingCartItem((String) session.get("userID")));
			return "shoppingCart";
		}
	}
	
	public String clearCart(){
		userService.deleteShoppingCartItem((String) session.get("userID"));
		return "shoppingCart";
	}
	
	public String toIndex(){
		if(session.get("logined") == "true"){
			request.put("shoppingItemNumber", userService.getShoppingItemNumber((String) session.get("userID")));
		}
		return "index";
	}
	
	private String content;
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String addComment(){
		userService.addComment((String) session.get("userID"), id, content);
		request.put("orderItems", userService.getOrderItems((String) session.get("userID")));
		return "addComment";
	}
	
	private CriteriaMedicine cm;
	
	public void page(){
		request.put("pageNo", userService.getPage(cm).getPageNo());
		request.put("totalPageNo", userService.getPage(cm).getTotalPageNumber());
		if(userService.getPage(cm).getTotalPageNumber() >= 3){
			request.put("prePageNo", userService.getPage(cm).getPrePageNo());
			request.put("curPageNo", userService.getPage(cm).getCurPageNo());
			request.put("nextPageNo", userService.getPage(cm).getNextPageNo());
		}
		if(session.get("logined") == "true"){
			request.put("shoppingItemNumber", userService.getShoppingItemNumber((String) session.get("userID")));
		}
	}
	
	public String page1(){
		cm = new CriteriaMedicine(50, 60, pageNo,1);
		page();
		request.put("med_1", userService.getPage(cm).getList());
		return "page1";
	}
	
	public String page2(){
		cm = new CriteriaMedicine(50, 60, pageNo,4);
		page();
		request.put("med_2", userService.getPage(cm).getList());
		return "page2";
	}
	
	public String page3(){
		cm = new CriteriaMedicine(50, 60, pageNo,3);
		page();
		request.put("med_3", userService.getPage(cm).getList());
		return "page3";
	}
	
	public String page4(){
		cm = new CriteriaMedicine(50, 60, pageNo,5);
		page();
		request.put("med_4", userService.getPage(cm).getList());
		return "page4";
	}
	
	public String page5(){
		cm = new CriteriaMedicine(50, 60, pageNo,2);
		page();
		request.put("med_5", userService.getPage(cm).getList());
		return "page5";
	}
	
	private InputStream inputStream;
	
	public InputStream getInputStream(){
		return inputStream;
	}
	
	private String userID;
	
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	private String password;
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	private int pageNo;
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public String validateUserID() throws UnsupportedEncodingException{
		if(userService.userIDIsValid(userID)){
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		}else{
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}
	
//	public String validateUser() throws UnsupportedEncodingException{
//		if(!userService.userIsValid(userID, password)){
//			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
//			session.put("logined", "true");
//			session.put("userID", userID);
//		}else{
//			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
//		}
//		return "ajax-success";
//	}
	
	public String validateUser(){
		if(!userService.userIsValid(userID, password)){			
			session.put("logined", "true");
			session.put("userID", userID);
			request.put("shoppingItemNumber", userService.getShoppingItemNumber(userID));
			return "lgsuccess";
		}else{
			request.put("lgfail", "true");
			return "lgfail";
		}
	}
	
	@Override
	public void prepare() throws Exception {
		
	}
	
	private User model;

	@Override
	public User getModel() {
		return model;
	}
	
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
		
	}
	
}
