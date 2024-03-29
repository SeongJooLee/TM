package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.CategoryVO;
import com.hk.tm.board.vo.ImageVO;

@Repository
public class CategoryDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardCategory.";
	
	public CategoryVO selectOnePromotion(int promotionNO) {
		CategoryVO categoryVO = sql.selectOne(ns+"selectOnePromotion",promotionNO);
		return categoryVO;
	}

	public void promotionAdd(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertPromotion",categoryVO);
	}

	public void promotionUpdate(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		sql.update(ns+"updatePromotion",categoryVO);		
	}

	public void promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deletePromotion",promotionNO);	
	}
	
	public CategoryVO selectOneTravel(int travelNO) {
		CategoryVO categoryVO = sql.selectOne(ns+"selectOneTravel",travelNO);
		return categoryVO;
	}

	public void addTravel(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		sql.insert(ns + "insertTravel", categoryVO);
		
	}
	
	public void updateTravel(CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		sql.update(ns+"updateTravel",categoryVO);		
	}

	public void deleteTravel(int travelNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deleteTravel",travelNO);	
	}

}
