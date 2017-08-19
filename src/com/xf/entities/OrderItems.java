package com.xf.entities;

import java.util.Date;

public class OrderItems {
	
	private Integer id;
	
	private String orderNum;
	private Medicine medicine;
	private String medName;
	private Float price;
	private Integer quantity;
	private Float totalMoney;
	private String status;
	private Orders orders;
	
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public Medicine getMedicine() {
		return medicine;
	}
	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getTotalMoney() {
		return price * quantity;
	}
	public void setTotalMoney(Float totalMoney) {
		this.totalMoney = totalMoney;
	}
	@Override
	public String toString() {
		return "OrderItems [id=" + id + ", orderNum=" + orderNum + ", medicine=" + medicine + ", medName=" + medName
				+ ", price=" + price + ", quantity=" + quantity + ", totalMoney=" + totalMoney + ", status=" + status
				+ ", orders=" + orders + "]";
	}

}
