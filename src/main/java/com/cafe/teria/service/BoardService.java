package com.cafe.teria.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.BoardDAO;
import com.cafe.teria.dto.BoardDTO;
import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.JoinMemberDTO;
import com.cafe.teria.dto.RecommentDTO;
import com.cafe.teria.dto.ReplyDTO;

@Service
public class BoardService {
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   
   
   
   @Autowired BoardDAO dao;

   
   
   
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
//   public ArrayList<JoinMemberDTO> myList(String loginId) {
//
//       ArrayList<JoinMemberDTO> list = new ArrayList<JoinMemberDTO>();
//         
//         list = dao.myList(loginId);//디비가 필요
//         logger.info("size : {}",list.size());
//         
//         
//         return list;
//   }



   public ArrayList<BoardDTO> blameList() {
     logger.info("blameList 쿼리 요청");
         
         return dao.blameList();
   }


   public void blameWrite(HashMap<String, String> params) {
   
      
      int row = dao.blameWrite(params); 
      logger.info("입력된 건수 : {}",row);
      
   }

   


}