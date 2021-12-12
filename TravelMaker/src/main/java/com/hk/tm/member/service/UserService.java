package com.hk.tm.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.dao.UserDAO;
import com.hk.tm.member.vo.SellerVO;
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

	public int addSeller(SellerVO seller) {
		// TODO Auto-generated method stub
		return userDAO.addSeller(seller);
	}

	public UserVO checkUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return userDAO.checkUser(userVO);
	}
	public SellerVO checkUser(SellerVO sellerVO) {
		// TODO Auto-generated method stub
		return userDAO.checkUser(sellerVO);
	}

	public List<TravelVO> travelListAll(String id) {
		return userDAO.travelListAll(id);
		
	}

	public List<ReviewVO> reviewListAll(String id) {
		// TODO Auto-generated method stub
		return userDAO.reviewListAll(id);
	}
}
