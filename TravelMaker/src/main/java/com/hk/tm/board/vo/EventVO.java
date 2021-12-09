package com.hk.tm.board.vo;

public class EventVO {
	private int eventNO;
	private String imagefileName;
	private String id;
	private String name;
	private int price;
	private int count;
	public int getEventNO() {
		return eventNO;
	}
	public void setEventNO(int eventNO) {
		this.eventNO = eventNO;
	}
	public String getImagefileName() {
		return imagefileName;
	}
	public void setImagefileName(String imagefileName) {
		this.imagefileName = imagefileName;
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
	
	@Override
	public String toString() {
		return "EventVO [eventNO=" + eventNO + ", imagefileName=" + imagefileName + ", id=" + id + ", name=" + name
				+ ", price=" + price + ", count=" + count + "]";
	}
	
	
	
}
