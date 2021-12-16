package com.hk.tm.board.vo;

import java.util.Date;

public class TravelImageVO {
	private int travelNO;
	private String title;
	private String content;
	private Date writeDate;	
	private String id;
	private String name;
	private String image1;
	private String image2;
	private String image3;
	private String categoryName;
	
	public int getTravelNO() {
		return travelNO;
	}
	public void setTravelNO(int travelNO) {
		this.travelNO = travelNO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return "TravelImageVO [travelNO=" + travelNO + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", id=" + id + ", name=" + name + ", image1=" + image1 + ", image2=" + image2
				+ ", image3=" + image3 + ", categoryName=" + categoryName + "]";
	}
	
	
	
}
