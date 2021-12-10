package com.hk.tm.board.vo;

import java.util.Date;

public class EventVO {
	private int eventNO;
	private String name;
	private int price;
	private int count;
	private String id;
	private Date writeDate;
	
	public int getEventNO() {
		return eventNO;
	}
	public void setEventNO(int eventNO) {
		this.eventNO = eventNO;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "EventVO [eventNO=" + eventNO + ", name=" + name + ", price=" + price + ", count=" + count + ", id=" + id
				+ ", writeDate=" + writeDate + "]";
	}
}
