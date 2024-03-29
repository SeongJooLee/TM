package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.CommentVO;


@Repository
public class CommentDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardComment.";
	
	public List<CommentVO> selectAllComments() {
		
		List<CommentVO> list = sql.selectList(ns+ "selectAllComments");
		
		return list;
	}
	
	public CommentVO selectOneComment(int travelNO) {
		
		CommentVO commentVO = sql.selectOne(ns + "selectOneComment" , travelNO);

		return commentVO;
	}

	public void addComment(CommentVO commentVO) {
		
		sql.insert(ns + "addTravelComment", commentVO);// 여기 문제?
	}
	
	public void updateComment(CommentVO commentVO) {
		
		sql.update(ns + "updateComment", commentVO);
	}


	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		List<CommentVO> list = sql.selectList(ns+"select",id);
		return list;
	}

	public List<CommentVO> selectTravelComment(int travelNO) {
		List<CommentVO> list = sql.selectList(ns+"selectTravelComment", travelNO);
		
		return list;
	}

	public int addTravelComment(CommentVO commentVO) {
		int ret = sql.insert(ns+"addTravelComment",commentVO);
		
		return ret;
	}

	public List<CommentVO> selectReviewComment(int reviewNO) {
		List<CommentVO> list = sql.selectList(ns+"selectReviewComment", reviewNO);
		return list;
	}
	
	public int addReviewComment(CommentVO commentVO) {
		int ret = sql.insert(ns+"addReviewComment",commentVO);
		return ret;
	}

	public void reviewDelete(int reviewNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"reviewDelete",reviewNO);
		
	}
	//테마여행 게시글 삭제시 자식 테이블 삭제
	public void deleteTravel(int travelNO) {
		sql.delete(ns+"travelDelete",travelNO);
	}

	public void travelDelete(int travelNO) {
		
		sql.delete(ns + "travelDelete", travelNO);
	}

}
