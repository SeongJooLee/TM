package com.hk.tm.member.admin.vo;

public class AdminVO {

	String adminID;
	String pw;
	String name;
	String grade;
	public String getAdminID() {
		return adminID;
	}
	public void setAdminID(String adminID) {
		this.adminID = adminID;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "AdminVO [adminID=" + adminID + ", pw=" + pw + ", name=" + name + ", grade=" + grade + "]";
	}
	
}
