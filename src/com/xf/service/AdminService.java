package com.xf.service;

import java.util.ArrayList;
import java.util.List;

import com.xf.dao.AdminDao;
import com.xf.entities.Admin;
import com.xf.entities.Category;
import com.xf.entities.Comment;
import com.xf.entities.Medicine;
import com.xf.entities.OrderItems;
import com.xf.entities.Orders;
import com.xf.entities.Role;
import com.xf.entities.SalesDetail;
import com.xf.entities.User;

public class AdminService {
	
	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public Boolean adminIsValid(String adminID,String adminPassword){
		return adminDao.getAdmin(adminID, adminPassword) == null;
	}
	
	public Boolean quantityIsValid(Integer id){
		return adminDao.getOrderItemsByID(id).getQuantity() < adminDao.getOrderItemsByID(id).getMedicine().getMedCount();
	}
	
	public String getRole(String adminID){
		return adminDao.getRole(adminID);
	}
	
	public Role getRole(Integer id){
		return adminDao.getRole(id);
	}

	public List<Category> getCategory(){
		return adminDao.getCategory();
	}
	
	public List<Admin> getAll(){
		return adminDao.getAll();
	}
	
	public List<User> getAll2(){
		return adminDao.getAll2();
	}
	
	public List<Medicine> getInventory(String keyword,Integer quantity){
		return adminDao.getInventory(keyword, quantity);
	}
	
	public List<Comment> getComment(Integer id){
		return adminDao.getComment(id);
	}
	
	public List<OrderItems> getOrderItems(String status){
		return adminDao.getOrderItems2(status);
	}
	
	public void cancelOrder(Integer id){
		OrderItems orderItems = adminDao.getOrderItemsByID(id);
		orderItems.setStatus("取消");
		adminDao.saveOrUpdate(orderItems);
	}
	
	public void handleOrder(Integer id,String adminID){
		OrderItems orderItems = adminDao.getOrderItemsByID(id);
		orderItems.setStatus("已发货");
		adminDao.saveOrUpdate(orderItems);
		Medicine medicine = orderItems.getMedicine();
		medicine.setMedCount(medicine.getMedCount()-orderItems.getQuantity());
		adminDao.saveOrUpdate(medicine);
		Admin admin = adminDao.getAdmin(adminID);
		SalesDetail salesDetail = new SalesDetail();
		salesDetail.setOrderNum(orderItems.getOrderNum());
		salesDetail.setMedicine(medicine);
		salesDetail.setMedName(medicine.getMedName());
		salesDetail.setPrice(medicine.getPrice());
		salesDetail.setQuantity(orderItems.getQuantity());
		salesDetail.setTotalMoney(orderItems.getTotalMoney());
		salesDetail.setSellTime(orderItems.getOrders().getCreateTime());
		salesDetail.setUser(orderItems.getOrders().getUser());
		salesDetail.setAdmin(admin);
		adminDao.saveOrUpdate(salesDetail);
	}
	
	public List<OrderItems> getOrderItems(Integer id){
		return adminDao.getOrderItems(id);
	}
	
	public List<SalesDetail> getSalesDetail(){
		return adminDao.getSalesDetail();
	}
	
	public List<SalesDetail> getSalesDetail(String keyword){
		return adminDao.getSalesDetail(keyword);
	}
	
	public List<SalesDetail> getSalesDetailByDesc(){
		List<SalesDetail> list = adminDao.getSalesDetailByDesc();
		for(int i = 0;i < list.size();i++){
			for(int j = list.size() - 1;j > i;j--){
				if(list.get(i).getMedicine() == list.get(j).getMedicine()){
					list.get(i).setQuantity(list.get(i).getQuantity() + list.get(j).getQuantity());
					list.get(i).setTotalMoney(list.get(i).getTotalMoney() + list.get(j).getTotalMoney());
					list.remove(j);
				}
			}
		}
		return list;
	}
	
	public List<SalesDetail> getSearchDetail(String myDate){
		String startDate;
		String endDate;
		String[] ss = new String[5];
		String[] ss1 = new String[5];
		String[] ss2 = new String[5];
		String[] ss3 = new String[5];
		String[] ss4 = new String[5];
		ss = myDate.split("-");
		ss1 = ss[0].trim().split("/");
		startDate = ss1[2];
		startDate += "-"+ss1[0];
		startDate += "-"+ss1[1];
		ss2 = ss[1].trim().split("/");
		endDate = ss2[2];
		endDate += "-"+ss2[0];
		endDate += "-"+ss2[1];
		
		startDate += " 00:00:00";
		endDate += " 23:59:59";
		return adminDao.getSalesDeteailResult(startDate, endDate);
	}
	
	public Float getTotalSalesAmount(List<SalesDetail> salesDetails){
		float tsa = 0;
		for(SalesDetail sd:salesDetails){
			tsa += sd.getTotalMoney();
		}
		return tsa;
	}
	
	public void saveOrUpdate(Admin admin){
		adminDao.saveOrUpdate(admin);
	}
	
	public void saveOrUpdate(Medicine medicine){
		adminDao.saveOrUpdate(medicine);
	}
	
	public void saveCategory(String categoryName,String description){
		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setDescription(description);
		adminDao.saveOrUpdate(category);
		
	}
	
	public Category getCategory(Integer id){
		return adminDao.getCategory(id);
	}
	
	public List<Medicine> getMedicine(){
		return adminDao.getMedicine();
	}
	
	public List<Medicine> getReq(){
		return adminDao.getReq();
	}
	
	public void addReq(Integer id,Integer reqCount){
		Medicine medicine = adminDao.getMedicineByID(id);
		medicine.setReqCount(reqCount);
		adminDao.saveOrUpdate(medicine);
	}
	
	public void modifyInventory(Integer id,Integer medCount){
		Medicine medicine = adminDao.getMedicineByID(id);
		medicine.setMedCount(medCount);
		adminDao.saveOrUpdate(medicine);
	}
	
	public List<Medicine> validateInventory(){
		return adminDao.getMedicine2();
	}
	
	public void purchaseComplete(Integer id){
		Medicine medicine = adminDao.getMedicineByID(id);
		medicine.setMedCount(medicine.getMedCount()+medicine.getReqCount());
		medicine.setReqCount(0);
		adminDao.saveOrUpdate(medicine);
	}
	
	public List<Medicine> getSearchResult(String keyword){
		return adminDao.getSearchResult(keyword);
	}
	
	public List<OrderItems> getSearchResult2(String keyword){
		return adminDao.getSearchResult2(keyword);
	}
	
	public void modifyMed(Integer id,String description,Float price){
		Medicine medicine = adminDao.getMedicineByID(id);
		medicine.setDescription(description);
		medicine.setPrice(price);
		adminDao.saveOrUpdate(medicine);
	}
	
	public void modifyType(Integer id,String description){
		Category category = adminDao.getCategoryByID(id);
		category.setDescription(description);
		adminDao.saveOrUpdate(category);
	}
	
	public void modifyAdmin(Integer id,String password){
		Admin admin = adminDao.getAdminByID(id);
		admin.setAdminPassword(password);
		adminDao.saveOrUpdate(admin);
	}
	
	public void deleteMedicine(Integer id){
		adminDao.deleteMedicine(id);
	}
	
	public void deleteType(Integer id){
		adminDao.deleteCategory(id);
	}
	
	public void deleteAdmin(Integer id){
		adminDao.deleteAdmin(id);
	}
	
	public void deleteUser(Integer id){
		List<Orders> list = adminDao.getOrderByUser(id);
		for(Orders orders:list){
			adminDao.deleteOrderItems(orders.getId());
		}
		adminDao.deleteOrders(id);
		adminDao.deleteShippingAddress(id);
		adminDao.deleteShoppingCart(id);
		adminDao.deleteUser(id);
	}
	
	public void deleteComment(Integer id){
		adminDao.deleteComment(id);
	}
}
