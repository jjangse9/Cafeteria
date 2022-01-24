package com.cafe.teria.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.NoticeDAO;
import com.cafe.teria.dto.NoticeDTO;

@Service
public class NoticeService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired NoticeDAO dao;
	
	public ArrayList<NoticeDTO> noticeList() {
		
		
		 logger.info("noticelist 쿼리");
		 
		 
         return dao.noticeList();
		
	}

	public void noticeWrite(HashMap<String, String> params) {

		
		int row = dao.noticeWrite(params);
		logger.info("redirect:notice/noticeList");
			
		
	}

	public NoticeDTO noticeDetail(String notice_idx, String noticeHit) {
		if(noticeHit.equals("noticeDetail")) {		
			dao.notice_uphit(notice_idx);				
		}
		return dao.noticeDetail(notice_idx);
	}

	public void noticeDelete(String notice_idx) {
		int success = dao.noticeDelete(notice_idx);
		logger.info("삭제한 게시물: " + success );
		
	}

	public HashMap<String, Object> noticeCall(int currPage, int pagePerCnt) {

		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
	      
	      int offset = ((currPage-1) * pagePerCnt-1) >=0 ? ((currPage-1) * pagePerCnt-1) : 0; //어디서부터 보여줘야 하는가?
	      
	      int totalCount = dao.allCount();
	      
	      int range = totalCount%pagePerCnt>0?	
	    		  (totalCount/pagePerCnt)+1:(totalCount/pagePerCnt);
	      logger.info("총갯수:{}",totalCount);
	      logger.info("만들 수 있는 총 페이지:{}",range);
	      
	      
	      
	      logger.info("DAO 호출");
	      
	      map.put("pages",range);
	      map.put("list",dao.noticeCall(pagePerCnt, offset));
	      
	      return map;
		
		
		
		
		
		
		
		
		
	
	}

	public void noticeUpdate(HashMap<String, String> params) {
		
		int row = dao.noticeUpdate(params);
		logger.info("수정성공여부:{}",row);
		
	}

	
	
	
	
	
	
	
	
	
	

}
