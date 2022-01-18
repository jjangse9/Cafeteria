package com.cafe.teria.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.BoardDAO;
import com.cafe.teria.dto.BoardDTO;
import com.cafe.teria.dto.JoinMemberDTO;

@Service
public class BoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	
	@Autowired BoardDAO dao;

	
	public ArrayList<JoinMemberDTO> myList(String loginId) {

		 ArrayList<JoinMemberDTO> list = new ArrayList<JoinMemberDTO>();
			
			list = dao.myList(loginId);//디비가 필요
			logger.info("size : {}",list.size());
			
			
			return list;
	}



	public ArrayList<BoardDTO> blameList() {
     logger.info("blameList 쿼리 요청");
         
         return dao.blameList();
	}


	public void blameWrite(HashMap<String, String> params) {
	
		
		int row = dao.blameWrite(params); 
		logger.info("입력된 건수 : {}",row);
		
	}

	


}
