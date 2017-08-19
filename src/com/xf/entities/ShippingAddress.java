package com.xf.entities;

public class ShippingAddress {
	
	private Integer id;
	private String province;
	private String address;
	private String receiver;
	private String phone;
	private User user;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "ShippingAddress [id=" + id + ", province=" + province + ", address=" + address + ", receiver="
				+ receiver + ", phone=" + phone + ", user=" + user + "]";
	}
	
	
}
