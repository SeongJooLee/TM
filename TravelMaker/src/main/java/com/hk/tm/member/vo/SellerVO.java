package com.hk.tm.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class SellerVO {

	private String sellerID;
	private String pw;
	private String name;
	private String phone;
	private String address;
	private Date joinDate;
	private String grade;
	public String getSellerID() {
		return sellerID;
	}
	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "SellerVO [sellerID=" + sellerID + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", address="
				+ address + ", joinDate=" + joinDate + ", grade=" + grade + "]";
	}
	
}
