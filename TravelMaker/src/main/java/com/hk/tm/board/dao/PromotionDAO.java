package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.PromotionVO;

@Repository
public class PromotionDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardPromotion.";
	
	public List<PromotionVO> selectAllPromotion() {
		List<PromotionVO> list = sql.selectList(ns+"selectAllPromotion");
		return list;
	}
	
	public List<PromotionImageVO> selectAllPromotionImage() {
		List<PromotionImageVO> list = sql.selectList(ns+"selectAllPromotionImage");
		return list;
	}

	public PromotionVO selectOnePromotion(int promotionNO) {
		PromotionVO promotionVO = sql.selectOne(ns+"selectOnePromotion",promotionNO);
		return promotionVO;
	}

	public int selectMaxPromotion() {
		int promotionNO = sql.selectOne(ns+"selectMaxPromotion",null);
		return promotionNO;
	}

	public void promotionAdd(PromotionVO promotionVO) {
		sql.insert(ns+"insertPromotion",promotionVO);
	}

	public void promotionUpdate(PromotionVO promotionVO) {
		sql.update(ns+"updatePromotion", promotionVO);
	}

	public void promotionDelete(int promotionNO) {
		sql.delete(ns+"deletePromotion", promotionNO);
	}

	public List<PromotionImageVO> selectCategoryPromotion(String key) {
		List<PromotionImageVO> list = sql.selectList(ns+"selectCategory",key);
		return list;
	}
}
