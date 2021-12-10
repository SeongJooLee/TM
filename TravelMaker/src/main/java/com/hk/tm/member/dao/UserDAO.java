package com.hk.tm.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<UserVO> selectAll() {
		
		return null;
	}

	public int addUser(UserVO userVO) {
		int result = 0;
		userVO.setGrade("user");
		result = sqlSession.insert("mapper.memberUser.insert",userVO);
		return result;
	}

	public int addSeller(SellerVO seller) {
		int result = 0;
		seller.setGrade("seller");
		System.out.println("dao seller = "+seller);
		result = sqlSession.insert("mapper.memberSeller.insert",seller);
		return result;
	}

	public UserVO checkUser(UserVO userVO) {
		// TODO Auto-generated method stub
		System.out.println("dao = "+userVO);
		UserVO user = sqlSession.selectOne("mapper.memberUser.selectOne", userVO);
		if(user ==null) {
			
		}
		System.out.println("user ="+user);
		return null;
	}

}
