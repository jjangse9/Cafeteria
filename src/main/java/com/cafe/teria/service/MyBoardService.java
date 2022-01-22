package com.cafe.teria.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.MyBoardDAO;
import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.MyBoardDTO;
import com.cafe.teria.dto.QstDTO;
import com.cafe.teria.dto.RecommentDTO;
import com.cafe.teria.dto.ReplyDTO;

@Service
public class MyBoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MyBoardDAO dao;
	
	// 20210121 - 문의하기 글쓰기
		public int writeQst(HashMap<String, Object> params) {
			
			int result = dao.writeQst(params);
			
			return result;
		}

		public ArrayList<QstDTO> qstList(String mem_id) {
			
			ArrayList<QstDTO> result = new ArrayList<QstDTO>();
			
			result = dao.qstList(mem_id);
			
			return result;
		}

	
	
	
	// 20220117 내 댓글 보기SI
	   public ArrayList<ReplyDTO> myReply(String loginId) {
	      ArrayList<ReplyDTO> replyResult = new ArrayList<ReplyDTO>();
	      
	      replyResult = dao.myReply(loginId);
	      logger.info("댓글갯수 : {}", replyResult.size());
	      
	      return replyResult;
	   }

	   public ArrayList<RecommentDTO> myRecomment(String loginId) {
	      ArrayList<RecommentDTO> recommentResult = new ArrayList<RecommentDTO>();
	      
	      recommentResult = dao.myRecomment(loginId);
	      logger.info("대댓글갯수 : {}", recommentResult.size());
	      
	      return recommentResult;
	   }
	// 20220117 내 댓글 보기SI
	   
	// 20220117 내 글 보기SI
	   public ArrayList<CafeDTO> myPost(String loginId) {
	      ArrayList<CafeDTO> result = new ArrayList<CafeDTO>();
	      
	      result = dao.myPost(loginId);
	      
	      return result;
	   }
	
	
	
	
	
//	
//	public ArrayList<JoinMemberDTO> myList(String loginId) {
//
//		 ArrayList<JoinMemberDTO> list = new ArrayList<JoinMemberDTO>();
//			
//			list = dao.myList(loginId);//디비가 필요
//			logger.info("size : {}",list.size());
//			
//			
//			return list;
//	}



	public ArrayList<MyBoardDTO> blameList() {
     logger.info("blameList 쿼리 요청");
         
         return dao.blameList();
	}


	public void blameWrite(HashMap<String, String> params) {
	
		
		int row = dao.blameWrite(params); 
		logger.info("입력된 건수 : {}",row);
		
	}

	


}
