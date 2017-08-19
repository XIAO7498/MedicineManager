package com.xf.entities;

public class Medicine {

	private Integer id;
	
	private String medNo;
	
	private String medName;
	
	private String symptom;
	
	private String crowd;
	
	private String description;
	
	private Float price;
	
	private Integer medCount;
	
	private Integer reqCount;
	
	private String photoPath;
	
	private String detail1;
	
	private String detail2;
	
	private Category category;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMedNo() {
		return medNo;
	}

	public void setMedNo(String medNo) {
		this.medNo = medNo;
	}

	public String getMedName() {
		return medName;
	}

	public void setMedName(String medName) {
		this.medName = medName;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getCrowd() {
		return crowd;
	}

	public void setCrowd(String crowd) {
		this.crowd = crowd;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getMedCount() {
		return medCount;
	}

	public void setMedCount(Integer medCount) {
		this.medCount = medCount;
	}

	public Integer getReqCount() {
		return reqCount;
	}

	public void setReqCount(Integer reqCount) {
		this.reqCount = reqCount;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getDetail1() {
		return detail1;
	}

	public void setDetail1(String detail1) {
		this.detail1 = detail1;
	}

	public String getDetail2() {
		return detail2;
	}

	public void setDetail2(String detail2) {
		this.detail2 = detail2;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Medicine [id=" + id + ", medNo=" + medNo + ", medName=" + medName + ", symptom=" + symptom + ", crowd="
				+ crowd + ", description=" + description + ", price=" + price + ", medCount=" + medCount + ", reqCount="
				+ reqCount + ", photoPath=" + photoPath + ", detail1=" + detail1 + ", detail2=" + detail2
				+ ", category=" + category + "]";
	}
	
}
