package com.hk.tm.board.vo;

public class ImageVO {
	private int noticeNO;
	private int travelNO;
	private int reviewNO;
	private int promotionNO;
	private int eventNO;
	private String image1;
	private String image2;
	private String image3;
	private String id;
	private String sellerId;
	private String adminId;
	public int getNoticeNO() {
		return noticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
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
	public int getPromotionNO() {
		return promotionNO;
	}
	public void setPromotionNO(int promotionNO) {
		this.promotionNO = promotionNO;
	}
	public int getEventNO() {
		return eventNO;
	}
	public void setEventNO(int eventNO) {
		this.eventNO = eventNO;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	@Override
	public String toString() {
		return "ImageVO [noticeNO=" + noticeNO + ", travelNO=" + travelNO + ", reviewNO=" + reviewNO + ", promotionNO="
				+ promotionNO + ", eventNO=" + eventNO + ", image1=" + image1 + ", image2=" + image2 + ", image3="
				+ image3 + ", id=" + id + ", sellerId=" + sellerId + ", adminId=" + adminId + "]";
	}
}
