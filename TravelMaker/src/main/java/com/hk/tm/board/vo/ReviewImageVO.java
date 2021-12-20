package com.hk.tm.board.vo;

import java.sql.Date;

public class ReviewImageVO {
	private int reviewNO;
	private String title;
	private String content;
	private Date writeDate;
	private String userID;
	private String name;
	private String image1;
	private String image2;
	private String image3;
	private int count;
	private int x;
	private int y;
	public int getReviewNO() {
		return reviewNO;
	}
	public void setReviewNO(int reviewNO) {
		this.reviewNO = reviewNO;
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
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	@Override
	public String toString() {
		return "ReviewImageVO [reviewNO=" + reviewNO + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", userID=" + userID + ", name=" + name + ", image1=" + image1 + ", image2=" + image2
				+ ", image3=" + image3 + ", count=" + count + ", x=" + x + ", y=" + y + "]";
	}

	
	
}
