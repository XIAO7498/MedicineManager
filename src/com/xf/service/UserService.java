package com.xf.service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.dom4j.io.SAXValidator;

import com.xf.dao.UserDao;
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

public class UserService {

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void saveOrUpdate(User user){
		userDao.saveOrUpdate(user);
	}
	
	public boolean userIDIsValid(String userID){
		return userDao.getUserByUserID(userID) == null;
	}
	
	public User getUser(String userID){
		return userDao.getUserByUserID(userID);
	}
	
	public boolean userIsValid(String userID,String password){
		return userDao.getUser(userID, password) == null;
	}
	
	public List<Medicine> getAll1(){
		return userDao.getAll1();
	}
	
	public Medicine getDetail(Integer id){
		return userDao.getMedByID(id);
	}
	
	public List<Medicine> getSearchResult(String keyword){
		return userDao.getSearchResult(keyword);
	}
	
	public Page<Medicine> getPage(CriteriaMedicine cm){
		return userDao.getPage(cm);
	}
	
	public Boolean hasMedicine(Integer id){
		return userDao.getShoppingCartItem(id) != null;
	}
	
	public void addToCart(Integer id,Integer quantity,String userID){
		ShoppingCartItem shoppingCartItem = null;
		int u_id = userDao.getUserByUserID(userID).getId();
		
		if(userDao.getShoppingCartItem(id) != null && userDao.getShoppingCartItem(id).getShoppingCart() == userDao.getShoppingCart(u_id)){
			shoppingCartItem = userDao.getShoppingCartItem(id);
			shoppingCartItem.setQuantity(shoppingCartItem.getQuantity()+quantity);
			shoppingCartItem.setTotalMoney(shoppingCartItem.getQuantity()*shoppingCartItem.getMedicine().getPrice());
		}else{
			shoppingCartItem = new ShoppingCartItem();
			shoppingCartItem.setMedicine(userDao.getMedByID(id));
			shoppingCartItem.setQuantity(quantity);
			shoppingCartItem.setTotalMoney(shoppingCartItem.getQuantity()*shoppingCartItem.getMedicine().getPrice());
			shoppingCartItem.setShoppingCart(userDao.getShoppingCart(userDao.getUserByUserID(userID).getId()));
		}
		userDao.saveOrUpdate(shoppingCartItem);
	}
	
	public void change_quantity(Integer id,Integer quantity){
		ShoppingCartItem shoppingCartItem = userDao.getShoppingCartItemByID(id);
		shoppingCartItem.setQuantity(quantity);
		userDao.saveOrUpdate(shoppingCartItem);
	}
	
	public void saveOrUpdate(String userID){
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUser(userDao.getUserByUserID(userID));
		userDao.saveOrUpdate(shoppingCart);
	}
	
	public void saveOrUpdate(ShippingAddress shippingAddress){
		userDao.saveOrUpdate(shippingAddress);
	}
	
	public int getShoppingItemNumber(String userID){
		int id = userDao.getUserByUserID(userID).getId();
		List<ShoppingCartItem> list = userDao.getShoppingCartItem2(userDao.getShoppingCart(id).getId());
		int total = 0;
		for(ShoppingCartItem sci:list){
			total += sci.getQuantity();
		}
		return total;
	}
	
	public void deleteShoppingCartItem(String userID){
		int u_id = userDao.getUserByUserID(userID).getId();
		int sc_id = userDao.getShoppingCart(u_id).getId();
		userDao.deleteShoppingCartItem(sc_id);
	}
	
	public void deleteShoppingCartItem2(String items){
		int[] a = new int[items.length()];
		int n =0;
		for(String s:items.split(",")){
			a[n] = Integer.parseInt(s);
			n++;
		}
		for(int i = 0;i < a.length;i++){
			userDao.deleteShoppingCartItem2(a[i]);
		}
	}
	
	public void deleteShoppingCartItem3(Integer id){
		userDao.deleteShoppingCartItem2(id);
	}
	
	public List<ShoppingCartItem> getShoppingCartItem(String userID){
		int u_id = userDao.getUserByUserID(userID).getId();
		int sc_id = userDao.getShoppingCart(u_id).getId();
		return userDao.getShoppingCartItem3(sc_id);
	}
	
	public List<ShoppingCartItem> getShoppingCartItemByID(String userID,String items){
		int u_id = userDao.getUserByUserID(userID).getId();
		int sc_id = userDao.getShoppingCart(u_id).getId();
		List<ShoppingCartItem> list1 = userDao.getShoppingCartItem3(sc_id);
		List<ShoppingCartItem> list2 = new LinkedList<ShoppingCartItem>();
		int[] a = new int[items.length()];
		int n =0;
		for(String s:items.split(",")){
			a[n] = Integer.parseInt(s);
			n++;
		}
		for(ShoppingCartItem sci:list1){
			for(int i = 0;i<a.length;i++){
				if(sci.getId() == a[i]){
					list2.add(sci);
				}
			}
		}
		return list2;
	}
	
	public List<ShippingAddress> getShippingAddress(String userID){
		int u_id = userDao.getUserByUserID(userID).getId();
		return userDao.getShippingAddress(u_id);
	}
	
	public void cancelOrder(Integer id){
		OrderItems orderItems = userDao.getOrderItemsByID(id);
		orderItems.setStatus("取消");
		userDao.saveOrUpdate(orderItems);
	}
	
	public void saveOrUpdate(String userID,String addr,String payMethod,String invoice,String items){
		Orders order = new Orders();
		order.setDeliveryInfo(addr);
		order.setPayMethod(payMethod);
		order.setInvoice(invoice);
		order.setCreateTime(new Date());
		order.setUser(userDao.getUserByUserID(userID));
		userDao.saveOrUpdate(order);
		int u_id = userDao.getUserByUserID(userID).getId();
		int sc_id = userDao.getShoppingCart(u_id).getId();
		List<ShoppingCartItem> list1 = userDao.getShoppingCartItem3(sc_id);
		int[] a = new int[items.length()];
		int n =0;
		for(String s:items.split(",")){
			a[n] = Integer.parseInt(s);
			n++;
		}
		for(ShoppingCartItem sci:list1){
			for(int i = 0;i<a.length;i++){
				if(sci.getId() == a[i]){
					OrderItems orderItem = new OrderItems();
					int x1 = (int) (Math.random() * 10);
					int x2 = (int) (Math.random() * 10);
					Long y = System.currentTimeMillis();
					String orderNum = String.valueOf(x1) + String.valueOf(x2) + String.valueOf(y);
					orderItem.setOrderNum(orderNum);
					orderItem.setMedicine(sci.getMedicine());
					orderItem.setMedName(sci.getMedicine().getMedName());
					orderItem.setPrice(sci.getMedicine().getPrice());
					orderItem.setQuantity(sci.getQuantity());
					orderItem.setTotalMoney(sci.getTotalMoney());
					orderItem.setStatus("未发货");
					orderItem.setOrders(order);
					userDao.saveOrUpdate(orderItem);
					userDao.deleteShoppingCartItem2(a[i]);
				}
			}
		}
	}
	
	public List<OrderItems> getOrderItems(String userID){
		int u_id = userDao.getUserByUserID(userID).getId();
		List<Orders> orders = userDao.getOrderByUser(u_id);
		System.out.println(orders.size());
		List<OrderItems> orderItems = new LinkedList<OrderItems>();
		for(int i = orders.size();i > 0;i--){
			List<OrderItems> list = userDao.getOrderItems(orders.get(i-1).getId());
			for(int j = list.size();j > 0;j--){
				orderItems.add(list.get(j-1));
			}
		}
		return orderItems;
	}
	
	public void addComment(String userID,Integer id,String content){
		Comment comment = new Comment();
		comment.setUser(userDao.getUserByUserID(userID));
		comment.setOrderItems(userDao.getOrderItemsByID(id));
		comment.setMedicine(userDao.getOrderItemsByID(id).getMedicine());
		comment.setContent(content);
		userDao.saveOrUpdate(comment);
	}
}
