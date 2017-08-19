package com.xf.entities;

import java.util.Date;

public class SalesDetail {

	private Integer id;
	
	private String orderNum;
	private Medicine medicine;
	private String medName;
	private Float price;
	private Integer quantity;
	private Float totalMoney;
	private Date sellTime;
	private User user;
	private Admin admin;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public Medicine getMedicine() {
		return medicine;
	}
	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}
	public String getMedName() {
		return medName;
	}
	public void setMedName(String medName) {
		this.medName = medName;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Float totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Date getSellTime() {
		return sellTime;
	}
	public void setSellTime(Date sellTime) {
		this.sellTime = sellTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "SalesDetail [id=" + id + ", orderNum=" + orderNum + ", medicine=" + medicine + ", medName=" + medName
				+ ", price=" + price + ", quantity=" + quantity + ", totalMoney=" + totalMoney + ", sellTime="
				+ sellTime + ", user=" + user + ", admin=" + admin + "]";
	}
	
	
}
