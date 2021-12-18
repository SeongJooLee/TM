package com.hk.tm.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.SearchAllDAO;

@Service
public class SearchAllService {
	@Autowired
	SearchAllDAO searchAllDAO;
}
