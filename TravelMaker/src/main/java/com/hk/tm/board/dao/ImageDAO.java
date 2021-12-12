package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ImageVO;
@Repository
public class ImageDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardImage.";
	
	public ImageVO oneList(int noticeNO) {
		// TODO Auto-generated method stub
		System.out.println("맵퍼 들가기 전");
		ImageVO imageVO = sql.selectOne(ns+"selectOne",noticeNO);
		System.out.println("맵퍼 들가기 후");
		return imageVO;
	}

	public void noticeAdd(ImageVO imageVO) {
		// TODO Auto-generated method stub
		System.out.println(imageVO.toString());
		sql.insert(ns+"insertNotice",imageVO);
	}

}
