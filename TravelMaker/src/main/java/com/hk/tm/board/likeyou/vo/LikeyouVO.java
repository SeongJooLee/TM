package com.hk.tm.board.likeyou.vo;

public class LikeyouVO {
	private String likecount;
	private String id;
	private int travelNO;
	private int reviewNO;
	
	public String getLikecount() {
		return likecount;
	}
	public void setLikecount(String likecount) {
		this.likecount = likecount;
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
		return "LikeyouVO [likecount=" + likecount + ", id=" + id + ", travelNO=" + travelNO + ", reviewNO=" + reviewNO
				+ "]";
	}

}
