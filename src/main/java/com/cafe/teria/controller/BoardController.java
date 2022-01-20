package com.cafe.teria.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe.teria.dto.BoardDTO;
import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.JoinMemberDTO;
import com.cafe.teria.dto.RecommentDTO;
import com.cafe.teria.dto.ReplyDTO;
import com.cafe.teria.service.BoardService;


@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	
	
	
	
	

	
	// 20220117 내 댓글 보기SI
	   @RequestMapping(value="/myReply", method = RequestMethod.GET)
	   public String myReply(Model model, HttpSession session) {
	      logger.info("댓글보기 요청");
	      
	      String loginId = (String) session.getAttribute("loginId");
	      
	      ArrayList<ReplyDTO> myReplyResult = service.myReply(loginId);
	      ArrayList<RecommentDTO> myRecommentResult = service.myRecomment(loginId);
	      
	      model.addAttribute("myReply", myReplyResult);
	      model.addAttribute("myRecomment", myRecommentResult);
	      
	      return "myReply";
	   }
	   
	// 20220117 내 댓글 보기SI
	   
	// 20220117 내 글 보기SI
	   @RequestMapping(value="/myPost", method = RequestMethod.GET)
	   public String myPost(Model model, HttpSession session) {
	      logger.info("글 보기 요청");
	      
	      String loginId = (String) session.getAttribute("loginId");
	      
	      ArrayList<CafeDTO> myPostResult = service.myPost(loginId);
	      
	      model.addAttribute("myPost", myPostResult);
	      
	      return "myPost";
	   }
	// 20220117 내 글 보기SI
	
	
	
	
	
	
	
	
	
	
	
//	
//	//내 글 조회 (업주용)
//	@RequestMapping(value="/myList", method = RequestMethod.GET)
//	public String myList(Model model, HttpSession session) {
//		logger.info("myList.jsp 로 이동");
//		
//		String page = "redirect:/";
//	
//		String loginId = (String) session.getAttribute("loginId");
//		
//		logger.info("찍히냐");
//		
//		if(loginId != null) {
//			ArrayList<JoinMemberDTO> myList = service.myList(loginId);
//			
//			model.addAttribute("myList", myList);
//
//			page = "myList";
//		}
//		
//		return page;
//		
//	}
//	
//	
	
	
	//신고 리스트
	@RequestMapping(value = "/blameList", method = RequestMethod.GET)
	public String blameList(Model model) {
		logger.info("list 요청");
		
		ArrayList<BoardDTO>list = service.blameList();
		
		logger.info("글의 수 : {}", list.size());
		
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);
		
		
		return "blameList";
	}
	
	
	
	//신고 글쓰기로 가기
	  @RequestMapping(value="/blameWriteForm", method = RequestMethod.GET)
	  
	  public String blameWriteForm(Model model, HttpSession session) {
	  
	  logger.info("blameWriteForm.jsp 로 이동");
	  
	  String loginId = (String) session.getAttribute("loginId");
	  
	  model.addAttribute("loginId", (String)session.getAttribute("loginId"));
	 
	  return "blameWriteForm";
	 
	  }
	  

	  //신고 글쓰기
		@RequestMapping(value = "/blameWrite", method = RequestMethod.POST)
		public String blameWrite(Model model, @RequestParam HashMap<String, String> params) {
			
			logger.info("blameWrite 요청 : {}", params);
			
			service.blameWrite(params);
	
			return "redirect:/blameList";
		}
	  
	  
	

	
}
	