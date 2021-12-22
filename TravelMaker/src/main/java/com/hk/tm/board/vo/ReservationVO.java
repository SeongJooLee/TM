package com.hk.tm.board.vo;

import java.sql.Date;

public class ReservationVO {

	private String reserNO;
	private int promotionNO;
	private Date reserDate;
	private int headCount;
	private String id;
	private String payment;
	private String complete;

	public String getReserNO() {
		return reserNO;
	}
	public void setReserNO(String reserNO) {
		this.reserNO = reserNO;
	}
	public int getPromotionNO() {
		return promotionNO;
	}
	public void setPromotionNO(int promotionNO) {
		this.promotionNO = promotionNO;
	}
	public Date getReserDate() {
		return reserDate;
	}
	public void setReserDate(Date reserDate) {
		this.reserDate = reserDate;
	}
	public int getHeadCount() {
		return headCount;
	}
	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ReservationVO [reserNO=" + reserNO + ", promotionNO=" + promotionNO + ", reserDate=" + reserDate
				+ ", headCount=" + headCount + ", id=" + id + "]";
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}

}

