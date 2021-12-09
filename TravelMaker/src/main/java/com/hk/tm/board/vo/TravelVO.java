package com.hk.tm.board.vo;

import java.util.Date;

public class TravelVO {
	private int travelNO;
	private String title;
	private String content;
	private String imagefileName;
	private Date writeDate;
	private String id;
	private String likeCount;
	private String name;
	
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
	public String getImagefileName() {
		return imagefileName;
	}
	public void setImagefileName(String imagefileName) {
		this.imagefileName = imagefileName;
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
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "TravelVO [travelNO=" + travelNO + ", title=" + title + ", content=" + content + ", imagefileName="
				+ imagefileName + ", writeDate=" + writeDate + ", id=" + id + ", likeCount=" + likeCount + ", name="
				+ name + "]";
	}
	

	
}
