package com.hk.tm.board.vo;

import java.sql.Date;

public class ReviewVO {
	private int reviewNO;
	private String title;
	private String content;
	private Date writeDate;
	private String id;
	private String name;
	private int promotionNO;
	
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
	public int getPromotionNO() {
		return promotionNO;
	}
	public void setPromotionNO(int promotionNO) {
		this.promotionNO = promotionNO;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNO=" + reviewNO + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", id=" + id + ", name=" + name + ", promotionNO=" + promotionNO + "]";
	}
	
}
