package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.ReviewVO;
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
		System.out.println("인서트 불량1"+imageVO.toString());
		sql.insert(ns+"insertNotice",imageVO);
		System.out.println("인서트 불량2"+imageVO.toString());

	}

	public void noticeUpdate(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		imageVO.setNoticeNO(noticeVO.getNoticeNO());
		sql.update(ns+"updateNotice",imageVO);
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

	public int imgDelete(int noticeNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOneNotice",noticeNO);
		int ret=0;
		if(imageVO!=null) {
			ret = sql.delete(ns+"deleteNotice",noticeNO);
		}
		return ret;
	}
	
	public ImageVO selectOne(int reviewNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOne",reviewNO);
		return imageVO;
	}

	public void reviewUpdate(ReviewVO reviewVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		imageVO.setReviewNO(reviewVO.getReviewNO());
		sql.update(ns+"reviewUpdate",imageVO);
	}

	public void promotionAdd(ImageVO imageVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertPromotion",imageVO);
	}
}
