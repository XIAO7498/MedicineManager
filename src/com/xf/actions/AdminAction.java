package com.xf.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.xf.entities.Admin;
import com.xf.entities.Category;
import com.xf.entities.Medicine;
import com.xf.entities.SalesDetail;
import com.xf.service.AdminService;

public class AdminAction extends ActionSupport implements SessionAware,RequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	private String adminID;
	
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	
	private String adminPassword;
	
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	
	private Integer role;
	
	public void setRole(Integer role) {
		this.role = role;
	}
	
	private String medNo;
	
	public void setMedNo(String medNo) {
		this.medNo = medNo;
	}
	
	private String medName;
	
	public void setMedName(String medName) {
		this.medName = medName;
	}
	
	private String description;
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	private Float price;
	
	public void setPrice(Float price) {
		this.price = price;
	}
	
	private Integer medCount;
	
	public void setMedCount(Integer medCount) {
		this.medCount = medCount;
	}
	
	private Integer reqCount;
	
	public void setReqCount(Integer reqCount) {
		this.reqCount = reqCount;
	}
	
	private String photoPath;
	
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	
	private Integer category;
	
	public void setCategory(Integer category) {
		this.category = category;
	}
	
	private String categoryName;
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	private String keyword;
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	private Admin admin = new Admin();
	
	public Admin setAdmin(){
		admin.setAdminID(adminID);
		admin.setAdminPassword(adminPassword);
		admin.setRole(adminService.getRole(role));
		return admin;
	}
	
	public String addAdmin(){
		adminService.saveOrUpdate(setAdmin());
		request.put("addSuccess", "true");
		request.put("admin", adminService.getAll());
		return "addAdmin";
	}
	
	public String modifyAdmin(){
		adminService.modifyAdmin(id, adminPassword);
		request.put("admin", adminService.getAll());
		return "modifyAdmin";
	}
	
	public String deleteAdmin(){
		adminService.deleteAdmin(id);
		request.put("admin", adminService.getAll());
		return "deleteAdmin";
	}
	
	public String deleteUser(){
		adminService.deleteUser(id);
		request.put("user", adminService.getAll2());
		return "deleteUser";
	}
	
	public String viewComment(){
		request.put("comment", adminService.getComment(id));
		request.put("med", adminService.getMedicine());
		return "viewComment";
	}
	
	public String viewOrder(){
		request.put("orderItems", adminService.getOrderItems(id));
		request.put("orders", adminService.getOrderItems("未发货"));
		return "viewOrder";
	}
	
	public String searchOrder(){
		request.put("orderItems", adminService.getSearchResult2(keyword));
		return "order_info";
	}
	
	public String searchSales(){
		request.put("result", adminService.getSalesDetail(keyword));
		request.put("tsa", adminService.getTotalSalesAmount((List<SalesDetail>) request.get("result")));
		request.put("salesRanking", adminService.getSalesDetailByDesc());
		return "sales_info";
	}
	
	public String cancelOrder(){
		adminService.cancelOrder(id);
		request.put("orderItems", adminService.getOrderItems("未发货"));
		return "cancelOrder";
	}
	
	public String handleOrder(){
		adminService.handleOrder(id,(String) session.get("adminID"));
		request.put("orderItems", adminService.getOrderItems("未发货"));
		return "handleOrder";
	}
	
	public String deleteComment(){
		try {
			adminService.deleteComment(id);
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
	
	private Integer quantity;
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public String searchInventory(){
		request.put("med1", adminService.getInventory(keyword, quantity));
		request.put("med2", adminService.getMedicine());
		request.put("req", adminService.getReq());
		return "purchase_info";
	}
	
	public String validateQuantity() throws UnsupportedEncodingException{
		if(adminService.quantityIsValid(id)){
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		}else{
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "ajax-success";
	}
	
	private Medicine medicine = new Medicine();
	
	public Medicine setMedicine() {
		medicine.setMedNo(medNo);
		medicine.setMedName(medName);
		medicine.setDescription(description);
		medicine.setMedCount(medCount);
		medicine.setPrice(price);
		medicine.setPhotoPath(photoPath);
		medicine.setCategory(adminService.getCategory(category));
		return medicine;
	}
	
	public String addMed(){
		adminService.saveOrUpdate(setMedicine());
		request.put("category", adminService.getCategory());
		request.put("addSuccess", "true");
		request.put("admin", adminService.getAll());
		return "addMed";
	}
	
	public String searchMed(){
		request.put("category", adminService.getCategory());
		request.put("result", adminService.getSearchResult(keyword));
		return "searchMed";
	}
	
	private Integer id;
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String modifyMed(){
		adminService.modifyMed(id, description, price);
		request.put("category", adminService.getCategory());
		return "modifyMed";
	}
	
	public String deleteMed(){
		adminService.deleteMedicine(id);
		request.put("category", adminService.getCategory());
		return "deleteMed";
	}
	
	
	
	public String addReq(){
		adminService.addReq(id, reqCount);
		request.put("med1", adminService.getMedicine());
		request.put("med2", adminService.getMedicine());
		request.put("req", adminService.getReq());
		return "addReq";
	}
	
	public String modifyInventory(){
		adminService.modifyInventory(id, medCount);
		request.put("med1", adminService.getMedicine());
		request.put("med2", adminService.getMedicine());
		request.put("req", adminService.getReq());
		return "modifyInventory";
	}
	
	public String purchaseComplete(){
		adminService.purchaseComplete(id);
		request.put("med1", adminService.getMedicine());
		request.put("med2", adminService.getMedicine());
		request.put("req", adminService.getReq());
		return "purchaseComplete";
	}
	
	public String myDate;
	
	public void setMyDate(String myDate) {
		this.myDate = myDate;
	}
	
	public String searchDetail() throws UnsupportedEncodingException{
		request.put("result", adminService.getSearchDetail(myDate));
		request.put("tsa", adminService.getTotalSalesAmount((List<SalesDetail>) request.get("result")));
		request.put("salesRanking", adminService.getSalesDetailByDesc());
		return "searchDetail";
	}
	
	public String login(){
		return "login";
	}
	
	public String lgsuccess(){
		request.put("category", adminService.getCategory());
		request.put("admin", adminService.getAll());
		return "lgsuccess";
	}
	
	public String toIndex(){
		request.put("med", adminService.validateInventory());
		return "lgsuccess";
	}
	
	public String med_info(){
		request.put("category", adminService.getCategory());
		return "med_info";
	}
	
	public String med_type(){
		request.put("category", adminService.getCategory());
		return "med_type";
	}
	
	public String purchase_info(){
		
		request.put("med1", adminService.getMedicine());
		request.put("med2", adminService.getMedicine());
		request.put("req", adminService.getReq());
		return "purchase_info";
	}
	
	public String sales_info(){
		request.put("result", adminService.getSalesDetail());
		request.put("tsa", adminService.getTotalSalesAmount((List<SalesDetail>) request.get("result")));
		request.put("salesRanking", adminService.getSalesDetailByDesc());
		return "sales_info";
	}
	
	public String order_info(){
		request.put("orderItems", adminService.getOrderItems("未发货"));
		return "order_info";
	}
	
	public String admin_account(){
		request.put("admin", adminService.getAll());
		return "admin_account";
	}
	
	public String user_account(){
		request.put("user", adminService.getAll2());
		return "user_account";
	}
	
	public String comment_info(){
		request.put("med", adminService.getMedicine());
		return "comment_info";
	}
	
	public String search_med(){
		return "search_med";
	}
	
	public String add_admin(){
		return "add_admin";
	}
	
	public String delete_admin(){
		request.put("admin", adminService.getAll());
		return "delete_admin";
	}
	
	public String addCategory(){
		adminService.saveCategory(categoryName, description);
		request.put("category", adminService.getCategory());
		request.put("admin", adminService.getAll());
		return "addCategory";
	}
	
	public String modifyType(){
		adminService.modifyType(id, description);
		request.put("category", adminService.getCategory());
		return "med_type";
	}
	
	public String deleteType(){
		adminService.deleteType(id);
		request.put("category", adminService.getCategory());
		return "med_type";
	}
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String validateAdmin(){
		if(!adminService.adminIsValid(adminID, adminPassword)){			
			session.put("role", adminService.getRole(adminID));
			request.put("category", adminService.getCategory());
			request.put("admin", adminService.getAll());
			request.put("med", adminService.validateInventory());
			session.put("adminID", adminID);
			return "lgsuccess";
		}else{
			request.put("lgfail", "true");
			return "lgfail";
		}
	}
	
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
		
	}
	
	public String logout(){
		session.clear();
		return "logout";
	}
	
	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request = arg0;
		
	}
	
}
