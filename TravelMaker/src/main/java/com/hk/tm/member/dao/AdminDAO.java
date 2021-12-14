package com.hk.tm.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Repository
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;
	public List<UserVO> userListAll() {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectAll");
		return userList;
	}
	public List<UserVO> nameList() {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectAllName");
		return userList;
	}
	public List<UserVO> dateList() {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectAllDate");
		return userList;
	}
	public List<UserVO> searchID(String search) {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectSearchID",search);
		
		return userList;
	}
	public UserVO selectOne(String id) {
		// TODO Auto-generated method stub
		UserVO user = sqlSession.selectOne("mapper.memberUser.selectView",id);
		return user;
	}
	public List<SellerVO> selectListAll() {
		// TODO Auto-generated method stub
		List<SellerVO> sellerList = sqlSession.selectList("mapper.memberSeller.selectAll");
		return sellerList;
	}
	public SellerVO selectOneSeller(String id) {
		// TODO Auto-generated method stub
		SellerVO seller = sqlSession.selectOne("mapper.memberSeller.selectOneSeller",id);
		return seller;
	}

}
