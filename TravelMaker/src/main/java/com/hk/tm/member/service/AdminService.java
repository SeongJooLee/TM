package com.hk.tm.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.member.dao.AdminDAO;
import com.hk.tm.member.vo.UserVO;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;
	public List<UserVO> userListAll() {
		// TODO Auto-generated method stub
		return adminDAO.userListAll();
	}
	public List<UserVO> nameList() {
		// TODO Auto-generated method stub
		return adminDAO.nameList();
	}
	public List<UserVO> dateList() {
		// TODO Auto-generated method stub
		return adminDAO.dateList();
	}
	public List<UserVO> searchID(String search) {
		// TODO Auto-generated method stub
		return adminDAO.searchID(search);
	}

}
