package com.hk.tm.board.reservation.vo;

import java.util.Date;

public class ReservationVO {

	String reserNO;
	int promotionNO;
	Date ReserDate;
	int headCount;
	String id;
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
		return ReserDate;
	}
	public void setReserDate(Date reserDate) {
		ReserDate = reserDate;
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
		return "ReservationVO [reserNO=" + reserNO + ", promotionNO=" + promotionNO + ", ReserDate=" + ReserDate
				+ ", headCount=" + headCount + ", id=" + id + "]";
	}
	
}
