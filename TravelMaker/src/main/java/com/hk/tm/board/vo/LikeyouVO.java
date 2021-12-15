package com.hk.tm.board.vo;

public class LikeyouVO {
	private int likeCount;
	private String id;
	private int travelNO;
	private int reviewNO;
	
	// int num; 좋아요 식별자
	// int aNum; 좋아요 대상 게시물 식별자
	// String checkUser; 좋아요 한 유저의 식별자
	// String regDate; 좋아요 체크한 날짜
	
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