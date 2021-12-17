package com.hk.tm.board.vo;

import java.sql.Date;

public class PromotionVO {
	private int promotionNO;
	private String title;
	private String content;
	private Date writeDate;
	private int price;
	private String sellerID;
	private String name;
	
	public int getPromotionNO() {
		return promotionNO;
	}
	public void setPromotionNO(int promotionNO) {
		this.promotionNO = promotionNO;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "PromotionVO [promotionNO=" + promotionNO + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", price=" + price + ", sellerID=" + sellerID + ", name=" + name + "]";
	}

}
