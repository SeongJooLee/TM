package com.hk.tm.board.vo;

import java.sql.Date;

public class CommentVO {
	private int count;
	private String id;
	private String content;
	private Date writeDate;
	private int travelNO;
	private int reviewNO;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public int getTravelNO() {
		return travelNO;
	}
	public void setTravelNO(int travelNO) {
		this.travelNO = travelNO;
	}
	public int getReviewNO() {
		return reviewNO;
	}
	public void setReviewNO(int reviewNO) {
		this.reviewNO = reviewNO;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CommentVO [count=" + count + ", id=" + id + ", content=" + content + ", writeDate=" + writeDate
				+ ", travelNO=" + travelNO + ", reviewNO=" + reviewNO + "]";
	}
	
}
