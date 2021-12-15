package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.PromotionVO;

@Repository
public class PromotionDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardPromotion.";
	
	public List<PromotionVO> selectAllPromotion() {
		// TODO Auto-generated method stub
		List<PromotionVO> list = sql.selectList(ns+"selectAllPromotion");
		return list;
	}

	public PromotionVO selectOnePromotion(int promotionNO) {
		PromotionVO promotionVO = sql.selectOne(ns+"selectOnePromotion",promotionNO);
		return promotionVO;
	}

	public int selectMaxNotice() {
		// TODO Auto-generated method stub
		int promotionNO = sql.selectOne(ns+"selectMaxPromotion",null);
		
		return promotionNO;
	}

	public void promotionAdd(PromotionVO promotionVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertPromotion",promotionVO);
	}

	public void promotionUpdate(PromotionVO promotionVO) {
		// TODO Auto-generated method stub
		sql.update(ns+"updatePromotion", promotionVO);
	}

	public void promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deletePromotion", promotionNO);
	}

}
