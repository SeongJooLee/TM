package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;

@Repository
public class SearchAllDAO {
	@Autowired
	SqlSession sqlSession;

	public List<NoticeVO> boardSearchAll() {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchAll");
		return list;
	}

	public List<NoticeVO> searchIdList(String result) {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchID",result);
		return list;
	}
}
