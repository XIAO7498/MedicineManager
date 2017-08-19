package com.xf.dao;

import java.util.List;

import org.hibernate.Query;

import com.xf.entities.Admin;
import com.xf.entities.Category;
import com.xf.entities.Comment;
import com.xf.entities.Medicine;
import com.xf.entities.OrderItems;
import com.xf.entities.Orders;
import com.xf.entities.Role;
import com.xf.entities.SalesDetail;
import com.xf.entities.User;

public class AdminDao extends BaseDao{

	public Admin getAdmin(String adminID,String adminPassword){
		String hql = "FROM Admin a WHERE a.adminID = ? AND a.adminPassword = ?";
		Query query = getSession().createQuery(hql).setString(0, adminID).setString(1, adminPassword);
		Admin admin = (Admin) query.uniqueResult();
		return admin;
	}
	
	public Admin getAdmin(String adminID){
		String hql = "FROM Admin a WHERE a.adminID = ?";
		Query query = getSession().createQuery(hql).setString(0, adminID);
		Admin admin = (Admin) query.uniqueResult();
		return admin;
	}
	
	public String getRole(String adminID){
		String hql = "FROM Admin a WHERE a.adminID = ?";
		Query query = getSession().createQuery(hql).setString(0, adminID);
		Admin admin = (Admin) query.uniqueResult();
		return admin.getRole().getRoleName();
	}
	
	public Role getRole(Integer id){
		String hql = "FROM Role r WHERE r.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Role role = (Role) query.uniqueResult();
		return role;
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getCategory(){
		String hql = "FROM Category";
		return getSession().createQuery(hql).list();
	}
	
	public Category getCategoryByID(Integer id){
		String hql = "FROM Category c WHERE c.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Category category = (Category) query.uniqueResult();
		return category;
	}
	
	public List<Admin> getAll(){
		String hql = "FROM Admin";
		return getSession().createQuery(hql).list();
	}
	
	public List<User> getAll2(){
		String hql = "FROM User";
		return getSession().createQuery(hql).list();
	}
	
	public void saveOrUpdate(Admin admin){
		getSession().saveOrUpdate(admin);
	}
	
	public void saveOrUpdate(Medicine medicine){
		getSession().saveOrUpdate(medicine);
	}
	
	public void saveOrUpdate(Category category){
		getSession().saveOrUpdate(category);
		
	}
	
	public void saveOrUpdate(Orders orders){
		getSession().saveOrUpdate(orders);
	}
	
	public void saveOrUpdate(OrderItems orderItems){
		getSession().saveOrUpdate(orderItems);
	}
	
	public void saveOrUpdate(SalesDetail salesDetail){
		getSession().saveOrUpdate(salesDetail);
	}
	
	public List<Medicine> getMedicine(){
		String hql = "FROM Medicine";
		return getSession().createQuery(hql).list();
	}
	
	public List<Medicine> getMedicine2(){
		String hql = "FROM Medicine m WHERE m.medCount < 5";
		return getSession().createQuery(hql).list();
	}
	
	public List<Medicine> getReq(){
		String hql = "FROM Medicine m WHERE m.reqCount > 0";
		return getSession().createQuery(hql).list();
	}
	
	public List<SalesDetail> getSalesDetail(){
		String hql = "FROM SalesDetail";
		return getSession().createQuery(hql).list();
	}
	
	public List<SalesDetail> getSalesDetail(String keyword){
		String hql = "FROM SalesDetail s WHERE s.orderNum = ? OR s.user.userID = ? OR s.admin.adminID = ?";
		return getSession().createQuery(hql).setString(0, keyword).setString(1, keyword).setString(2, keyword).list();
	}
	
	public List<SalesDetail> getSalesDetailByDesc(){
		String hql = "FROM SalesDetail s order by s.quantity desc";
		return getSession().createQuery(hql).list();
	}
	
	public List<SalesDetail> getSalesDeteailResult(String str1,String str2){
		String hql = "FROM SalesDetail s WHERE s.sellTime >= ? and s.sellTime <= ?";
		return getSession().createQuery(hql).setString(0, str1).setString(1, str2).list();
	}
	
	public List<Medicine> getSearchResult(String keyword){
		String hql = "FROM Medicine  m WHERE m.medName LIKE '%"+keyword+"%'";
		return getSession().createQuery(hql).list();
	}
	
	public List<Medicine> getInventory(String keyword,Integer quantity){
		String hql = "FROM Medicine  m WHERE m.medCount" + keyword + quantity ;
		return getSession().createQuery(hql).list();
	}
	
	public List<OrderItems> getSearchResult2(String keyword){
		String hql = "FROM OrderItems o WHERE o.orderNum = ? OR o.orders.user.userID = ?";
		return getSession().createQuery(hql).setString(0, keyword).setString(1, keyword).list();
	}
	
	public Category getCategory(Integer id){
		String hql = "FROM Category c WHERE c.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Category category = (Category)query.uniqueResult();
		return category;
	}
	
	public Medicine getMedicineByID(Integer id){
		String hql = "FROM Medicine m WHERE m.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Medicine medicine = (Medicine) query.uniqueResult();
		return medicine;
	}
	
	public Admin getAdminByID(Integer id){
		String hql = "FROM Admin a WHERE a.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Admin admin = (Admin) query.uniqueResult();
		return admin;
	}
	
	public List<Comment> getComment(Integer id){
		String hql = "FROM Comment c WHERE c.medicine = ?";
		return getSession().createQuery(hql).setInteger(0, id).list();
	}
	
	public Orders getOrdersByID(Integer id){
		String hql = "FROM Orders o WHERE o.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Orders orders = (Orders) query.uniqueResult();
		return orders;
	}
	
	public List<Orders> getOrders(String status){
		String hql = "FROM Orders o WHERE o.status = ?";
		return getSession().createQuery(hql).setString(0, status).list();
	}
	
	public List<Orders> getOrderByUser(Integer id){
		String hql = "FROM Orders o WHERE o.user = ?";
		return getSession().createQuery(hql).setInteger(0, id).list();
		
	}
	
	public OrderItems getOrderItemsByID(Integer id){
		String hql = "FROM OrderItems o WHERE o.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		OrderItems orderItems = (OrderItems) query.uniqueResult();
		return orderItems;
	}
	
	public List<OrderItems> getOrderItems(Integer id){
		String hql = "FROM OrderItems o WHERE o.orders = ?";
		return getSession().createQuery(hql).setInteger(0, id).list();
	}
	
	public List<OrderItems> getOrderItems2(String status){
		String hql = "FROM OrderItems o WHERE o.status = ?";
		return getSession().createQuery(hql).setString(0, status).list();
	}
	
	public void deleteMedicine(Integer id){
		String hql = "DELETE FROM Medicine m WHERE m.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteCategory(Integer id){
		String hql = "DELETE FROM Category c WHERE c.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteAdmin(Integer id){
		String hql = "DELETE FROM Admin a WHERE a.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteUser(Integer id){
		String hql = "DELETE FROM User u WHERE u.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteShippingAddress(Integer id){
		String hql = "DELETE FROM ShippingAddress s WHERE s.user = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteOrders(Integer id){
		String hql = "DELETE FROM Orders o WHERE o.user = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteOrderItems(Integer id){
		String hql ="DELETE FROM OrderItems o WHERE o.orders = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteShoppingCart(Integer id){
		String hql = "DELETE FROM ShoppingCart s WHERE s.user = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteComment(Integer id){
		String hql = "DELETE FROM Comment c WHERE c.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
}
