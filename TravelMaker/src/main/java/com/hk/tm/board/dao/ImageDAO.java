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
		ImageVO imageVO = sql.selectOne(ns+"selectOneTest",noticeNO);
		return imageVO;
	}

	public void noticeAdd(ImageVO imageVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertNoticeTest",imageVO);
		System.out.println("이미지다오에서 아래 출력 "+imageVO.toString());
	}

}
