package com.hk.tm.board.vo;

import java.sql.Date;

public class TravelVO {
	private int travelNO;
	private String title;
	private String content;
	private Date writeDate;
	private String id;
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
	@Override
	public String toString() {
		return "TravelVO [travelNO=" + travelNO + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + ", id=" + id + ", name=" + name + "]";
	}
	

	
}
