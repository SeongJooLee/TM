package com.hk.tm.board.vo;

public class LikeyouVO {
	private int likeCount;
	private String id;
	private int travelNO;
	private int reviewNO;
	
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	@Override
	public String toString() {
		return "LikeyouVO [likeCount=" + likeCount + ", id=" + id + ", travelNO=" + travelNO + ", reviewNO=" + reviewNO
				+ "]";
	}
}