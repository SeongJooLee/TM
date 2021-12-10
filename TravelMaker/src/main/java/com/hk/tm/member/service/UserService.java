package com.hk.tm.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.member.dao.UserDAO;
import com.hk.tm.member.vo.UserVO;

@Service
public class UserService {
	@Autowired
	UserDAO userDAO;
	
	public List<UserVO> selectAll(){
		return userDAO.selectAll();
	}

	public int addUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return userDAO.addUser(userVO);
	}
}
