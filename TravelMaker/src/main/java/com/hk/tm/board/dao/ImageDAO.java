package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
@Repository
public class ImageDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardImage.";
	
	// 공지사항
	public ImageVO selectOneNotice(int noticeNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOneNotice",noticeNO);
		return imageVO;
	}

	public void noticeAdd(ImageVO imageVO) {
		sql.insert(ns+"insertNotice",imageVO);
	}

	public void noticeUpdate(ImageVO imageVO) {
		sql.update(ns+"updateNotice",imageVO);
	}

	public void noticeDelete(int noticeNO) {
		sql.delete(ns+"deleteNotice",noticeNO);
	}
	
	public int noticeImgDelete(int noticeNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOneNotice",noticeNO);
		int ret=0;
		if(imageVO!=null) {
			ret = sql.update(ns+"deleteNoticeImage",noticeNO);
		}
		return ret;
	}

	//테마여행
	public ImageVO selectOneTravel(int travelNO) {
		ImageVO imageVO = sql.selectOne(ns + "selectOneTravel" , travelNO);
		return imageVO;
	}
	
	public void addTravel(ImageVO imageVO) {
		sql.insert(ns+"insertTravel",imageVO);
	}

	public void travelUpdate(TravelVO travelVO, ImageVO imageVO) {
		imageVO.setTravelNO(travelVO.getTravelNO());
		sql.update(ns+"updateTravel",imageVO);
	}

	public void deleteTravel(int travelNO) {
		sql.delete(ns+"deleteTravel",travelNO);
	}

	public int travelImgDelete(int travelNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOneTravel", travelNO);
		int ret=0;
		if(imageVO!=null) {
			ret = sql.delete(ns+"deleteTravel", travelNO);
		}
		return ret;
	}

	// 이용후기
	public ImageVO selectOne(int reviewNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOne",reviewNO);
		return imageVO;
	}

	public void reviewUpdate(ReviewVO reviewVO, ImageVO imageVO) {
		imageVO.setReviewNO(reviewVO.getReviewNO());
		sql.update(ns+"reviewUpdate",imageVO);
	}
	
	public void reviewDelete(int reviewNO) {
		sql.delete(ns+"reviewDelete",reviewNO);
	}
	
	public int reviewImgDelete(int reviewNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOne",reviewNO);
		int ret=0;
		if(imageVO!=null) {
			ret = sql.update(ns+"deleteReviewImage",reviewNO);
		}
		return ret;
	}
	
	
	//홍보상품
	public ImageVO selectOnePromotion(int promotionNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOnePromotion",promotionNO);
		return imageVO;
	}
	
	public void promotionAdd(ImageVO imageVO) {
		sql.insert(ns+"insertPromotion",imageVO);
	}

	public void promotionUpdate(ImageVO imageVO) {
		sql.update(ns+"updatePromotion",imageVO);
	}

	public void promotionDelete(int promotionNO) {
		sql.delete(ns+"deletePromotion",promotionNO);
	}

	public int promotionImgDelete(int promotionNO) {
		ImageVO imageVO = sql.selectOne(ns+"selectOnePromotion",promotionNO);
		int ret=0;
		if(imageVO!=null) {
			ret = sql.update(ns+"deletePromotionImage",promotionNO);
		}
		return ret;
	}
}
