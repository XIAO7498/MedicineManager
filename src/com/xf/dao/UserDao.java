package com.xf.dao;

import java.util.List;

import org.hibernate.Query;

import com.xf.entities.Comment;
import com.xf.entities.Medicine;
import com.xf.entities.Orders;
import com.xf.entities.OrderItems;
import com.xf.entities.ShippingAddress;
import com.xf.entities.ShoppingCart;
import com.xf.entities.ShoppingCartItem;
import com.xf.entities.User;
import com.xf.web.CriteriaMedicine;
import com.xf.web.Page;

public class UserDao extends BaseDao{

	public void saveOrUpdate(User user){
		getSession().saveOrUpdate(user);
	}
	
	public User getUserByUserID(String userID){
		String hql = "FROM User u WHERE u.userID = ?";
		Query query = getSession().createQuery(hql).setString(0, userID);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	public User getUser(String userID,String password){
		String hql = "FROM User u WHERE u.userID = ? AND u.password = ?";
		Query query = getSession().createQuery(hql).setString(0, userID).setString(1, password);
		User user = (User) query.uniqueResult();
		return user;
	}
	
	public void saveOrUpdate(ShoppingCart shoppingCart){
		getSession().saveOrUpdate(shoppingCart);
	}
	
	public void saveOrUpdate(ShoppingCartItem shoppingCartItem){
		getSession().saveOrUpdate(shoppingCartItem);
	}
	
	public void saveOrUpdate(ShippingAddress shippingAddress){
		getSession().saveOrUpdate(shippingAddress);
	}
	
	public void saveOrUpdate(Orders orders){
		getSession().saveOrUpdate(orders);
	}
	
	public void saveOrUpdate(OrderItems orderItems){
		getSession().saveOrUpdate(orderItems);
	}
	
	public void saveOrUpdate(Comment comment){
		getSession().saveOrUpdate(comment);
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
		return getSession().createQuery(hql).setInteger(0,id).list();
	}
	
	public List<ShippingAddress> getShippingAddress(Integer id){
		String hql = "FROM ShippingAddress s WHERE s.user = ?";
		return getSession().createQuery(hql).setInteger(0, id).list();
	}
	
	public ShoppingCart getShoppingCart(Integer id){
		String hql = "FROM ShoppingCart s WHERE s.user = ?";
		Query query = getSession().createQuery(hql).setInteger(0,id);
		ShoppingCart shoppingCart = (ShoppingCart) query.uniqueResult();
		return shoppingCart;
	}
	
	public void deleteShoppingCartItem(Integer id){
		String hql = "DELETE FROM ShoppingCartItem s WHERE s.shoppingCart = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public void deleteShoppingCartItem2(Integer id){
		String hql = "DELETE FROM ShoppingCartItem s WHERE s.id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	public ShoppingCartItem getShoppingCartItem(Integer id){
		String hql = "FROM ShoppingCartItem s WHERE s.medicine = ?";
		Query query = getSession().createQuery(hql).setInteger(0,id);
		ShoppingCartItem shoppingCartItem = (ShoppingCartItem) query.uniqueResult();
		return shoppingCartItem;
	}
	
	public ShoppingCartItem getShoppingCartItemByID(Integer id){
		String hql = "FROM ShoppingCartItem s WHERE s.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0,id);
		ShoppingCartItem shoppingCartItem = (ShoppingCartItem) query.uniqueResult();
		return shoppingCartItem;
	}
	
	public List<ShoppingCartItem> getShoppingCartItem2(Integer id){
		String hql = "FROM ShoppingCartItem s WHERE s.shoppingCart = ?";
		return getSession().createQuery(hql).setInteger(0,id).list();
	}
	
	public List<ShoppingCartItem> getShoppingCartItem3(Integer id){
		String hql = "FROM ShoppingCartItem s LEFT OUTER JOIN FETCH s.medicine WHERE s.shoppingCart = ?";
		return getSession().createQuery(hql).setInteger(0,id).list();
	}
	
	public Medicine getMedByID(Integer id){
		String hql = "FROM Medicine m WHERE m.id = ?";
		Query query = getSession().createQuery(hql).setInteger(0, id);
		Medicine medicine = (Medicine) query.uniqueResult();
		return medicine;
	}
	
	public List<Medicine> getAll1(){
		String hql="FROM Medicine";
		return getSession().createQuery(hql).list();
	}
	
	public List<Medicine> getSearchResult(String keyword){
		String hql="FROM Medicine  m WHERE m.medName LIKE '%"+keyword+"%' OR m.symptom LIKE '%"+keyword+"%'";
		return getSession().createQuery(hql).list();
	}
	
	public Page<Medicine> getPage(CriteriaMedicine cm){
		
		Page<Medicine> page = new Page<>(cm.getPageNo());
		page.setTotalItemNumber(getTotalMedicineNumber(cm));
		if(page.getTotalPageNumber() >=3){
			if(page.getPageNo() == 1){
				page.setPrePageNo(page.getPageNo());
				page.setCurPageNo(page.getPageNo()+1);
				page.setNextPageNo(page.getPageNo()+2);
			}else if(page.getPageNo() == page.getTotalPageNumber()){
				page.setPrePageNo(page.getTotalPageNumber()-2);
				page.setCurPageNo(page.getTotalPageNumber()-1);
				page.setNextPageNo(page.getTotalPageNumber());
			}else{
				page.setPrePageNo(page.getPageNo()-1);
				page.setCurPageNo(page.getPageNo());
				page.setNextPageNo(page.getPageNo()+1);
			}
		}
		cm.setPageNo(page.getPageNo());
		page.setList(getPageList(cm,page.getPageSize()));		
		return page;
	}
	
	public long getTotalMedicineNumber(CriteriaMedicine cm){
		String hql = "FROM Medicine m WHERE m.category = ?";
		return getSession().createQuery(hql).setInteger(0, cm.getMedType()).list().size();
	}
	
	@SuppressWarnings("unchecked")
	public List<Medicine> getPageList(CriteriaMedicine cm,int pageSize){
		String hql = "FROM Medicine m WHERE m.category = ?";
		return getSession().createQuery(hql).setInteger(0, cm.getMedType()).setFirstResult((cm.getPageNo() - 1) * pageSize).setMaxResults(pageSize).list();
	}
	
}
