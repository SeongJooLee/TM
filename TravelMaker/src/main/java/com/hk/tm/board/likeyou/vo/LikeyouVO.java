package com.hk.tm.board.likeyou.vo;

public class LikeyouVO {
	private String likeCount;
	private String id;
	private int travelNO;
	private int reviewNO;
	
	public String getLikecount() {
		return likeCount;
	}
	public void setLikecount(String likecount) {
		this.likeCount = likecount;
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
