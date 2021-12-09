package com.hk.tm.board.vo;

import java.util.Date;

public class NoticeVO {
	private int noticeNO;
	private String title;
	private String content;
	private String imagefileName;
	private String adminID;
	private String name;
	private Date writeDate;
	public int getNoticeNO() {
		return noticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
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
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNO=" + noticeNO + ", title=" + title + ", content=" + content + ", imagefileName="
				+ imagefileName + ", adminID=" + adminID + ", name=" + name + ", writeDate=" + writeDate + "]";
	}

}

