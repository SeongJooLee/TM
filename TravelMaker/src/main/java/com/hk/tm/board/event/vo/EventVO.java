package com.hk.tm.board.event.vo;

import java.util.Date;

public class EventVO {
	private int NoticeNO;
	private String title;
	private String content;
	private String imagefileName;
	private Date writeDate;
	private String id;
	private String name;
	public int getNoticeNO() {
		return NoticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		NoticeNO = noticeNO;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "EventVO [NoticeNO=" + NoticeNO + ", title=" + title + ", content=" + content + ", imagefileName="
				+ imagefileName + ", writeDate=" + writeDate + ", id=" + id + ", name=" + name + "]";
	}

	
}
