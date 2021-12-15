package com.hk.tm.board.vo;

public class CategoryVO {

	private int promotionNO;
	private int travelNO;
	private String categoryName;
	public int getPromotionNO() {
		return promotionNO;
	}
	public void setPromotionNO(int promotionNO) {
		this.promotionNO = promotionNO;
	}
	public int getTravelNO() {
		return travelNO;
	}
	public void setTravelNO(int travelNO) {
		this.travelNO = travelNO;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "CategoryVO [promotionNO=" + promotionNO + ", travelNO=" + travelNO + ", categoryName=" + categoryName
				+ "]";
	}
}
