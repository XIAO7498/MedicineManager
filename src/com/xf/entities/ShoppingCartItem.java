package com.xf.entities;

public class ShoppingCartItem {
	
	private Integer id;
	private Medicine medicine;
	private Integer quantity;
	private Float totalMoney;
	private ShoppingCart shoppingCart;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
		return medicine.getPrice()*quantity;
	}
	public void setTotalMoney(Float totalMoney) {
		this.totalMoney = totalMoney;
	}
	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}
	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	@Override
	public String toString() {
		return "ShoppingCartItem [id=" + id + ", medicine=" + medicine + ", quantity=" + quantity + "]";
	}
	
}
