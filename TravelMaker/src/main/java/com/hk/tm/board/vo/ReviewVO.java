package com.hk.tm.board.vo;

import java.util.Date;

public class ReviewVO {
	private int reviewNO;
	private String title;
	private String content;
	private String imageFileName;
	private Date WriteDate;
	private String id;
	private String name;
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
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public Date getWriteDate() {
		return WriteDate;
	}
	public void setWriteDate(Date writeDate) {
		WriteDate = writeDate;
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
	@Override
	public String toString() {
		return "ReviewVO [reviewNO=" + reviewNO + ", title=" + title + ", content=" + content + ", imageFileName="
				+ imageFileName + ", WriteDate=" + WriteDate + ", id=" + id + ", name=" + name + "]";
	}
	//ㅇㅇ
	
}
