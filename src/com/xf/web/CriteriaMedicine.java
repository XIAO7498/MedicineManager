package com.xf.web;

public class CriteriaMedicine {
	
	private float minPrice = 0;
	
	private float maxPrice = Integer.MAX_VALUE;
	
	private int pageNo;
	
	private int medType;

	public float getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(float minPrice) {
		this.minPrice = minPrice;
	}

	public float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public CriteriaMedicine(float minPrice, float maxPrice, int pageNo, int medType) {
		super();
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.pageNo = pageNo;
		this.medType = medType;
	}

	public int getMedType() {
		return medType;
	}

	public void setMedType(int medType) {
		this.medType = medType;
	}
	
}
