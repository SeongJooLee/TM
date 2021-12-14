package com.hk.tm.board.vo;

public class CategoryVO {

	private int promotionNO;
	private String area;
	private String food;
	private String traffic;
	private String culture;
	private String healing;
	private String leisure;
	public int getPromotionNO() {
		return promotionNO;
	}
	public void setPromotionNO(int promotionNO) {
		this.promotionNO = promotionNO;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getCulture() {
		return culture;
	}
	public void setCulture(String culture) {
		this.culture = culture;
	}
	public String getHealing() {
		return healing;
	}
	public void setHealing(String healing) {
		this.healing = healing;
	}
	public String getLeisure() {
		return leisure;
	}
	public void setLeisure(String leisure) {
		this.leisure = leisure;
	}
	@Override
	public String toString() {
		return "CategoryVO [promotionNO=" + promotionNO + ", area=" + area + ", food=" + food + ", traffic=" + traffic
				+ ", culture=" + culture + ", healing=" + healing + ", leisure=" + leisure + "]";
	}
	
}
