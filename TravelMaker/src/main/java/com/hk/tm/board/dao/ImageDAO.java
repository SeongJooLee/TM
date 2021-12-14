package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.TravelVO;
@Repository
public class ImageDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardImage.";
	
	public ImageVO oneListNotice(int noticeNO) {
		// TODO Auto-generated method stub
		ImageVO imageVO = sql.selectOne(ns+"selectOneNotice",noticeNO);
		return imageVO;
	}

	public void noticeAdd(ImageVO imageVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertNotice",imageVO);
	}

	public void noticeUpdate(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		imageVO.setNoticeNO(noticeVO.getNoticeNO());
		sql.update(ns+"update",imageVO);
	}

	public void noticeDelete(int noticeNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deleteNotice",noticeNO);
	}

	public ImageVO selectOneTravel(int travelNO) {
		// TODO Auto-generated method stub
		ImageVO imageVO = sql.selectOne(ns + "selectOneTravel" , travelNO);
		return imageVO;
	}

	public void travelUpdate(TravelVO travelVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		imageVO.setTravelNO(travelVO.getTravelNO());
		sql.update(ns+"updateTravel",imageVO);
	}

	public void deleteTravel(int travelNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deleteTravel",travelNO);
	}

	public void travelAdd(ImageVO imageVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertTravel",imageVO);
	}

	public ImageVO selectOnePromotion(int promotionNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOnePromotion",promotionNO);
		return imageVO;
	}

}
