package com.xf.entities;

import java.util.Date;

public class User {

	private Integer id;
	
	private String userID;
	private String password;
	private String userName;
	private String sex;
	private String birthday;
	private String IDCard;
	private String email;
	private String phone;
	
	
	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public String getIDCard() {
		return IDCard;
	}


	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", userID=" + userID + ", password=" + password + ", userName=" + userName + ", sex="
				+ sex + ", birthday=" + birthday + ", IDCard=" + IDCard + ", email=" + email + ", phone=" + phone + "]";
	}
	
}
