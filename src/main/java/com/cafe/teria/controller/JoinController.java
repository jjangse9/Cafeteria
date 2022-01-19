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
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe.teria.dto.JoinMemberDTO;
import com.cafe.teria.service.JoinMemberService;


@Controller
public class JoinController {
	
	private  Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired JoinMemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("login page 이동");
		return "login";
	}
	
	
	
	//회원가입
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("joinForm page 이동");
		return "joinForm";
	}
	
	
//중복검사
	
	@RequestMapping(value = "/overlay", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String mem_id) {
		logger.info("중복 아이디 체크 : {}",mem_id);
		return service.overlay(mem_id);
	}
	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> param) {
		logger.info("회원가입 요청 : {}", param);
		
		return service.join(param);
	}
	

	// 로그인
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	
	public HashMap<String, Object> login(
			@RequestParam String mem_id, @RequestParam String mem_pw,
			HttpSession session) {
		logger.info("로그인 체크 : {} / {}",mem_id,mem_pw);
		
		int success = service.login(mem_id,mem_pw);
		
		logger.info("로그인 성공여부 : {}",success);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(success>0) {
			session.setAttribute("loginId", mem_id);
			map.put("loginId", mem_id);
		}
		
		map.put("success", success);
		
		return map;
	}
	
	
	
	// 로그인 클릭시 이동하는 메인페이지
	
	  @RequestMapping(value="/main", method = RequestMethod.GET) public String
	  main(Model Model, HttpSession session) {
	  
	  logger.info("main.jsp 로 이동");
	  
	  
	  
	  // set에 넣어준 (로그인 쪽에 있는 loginId 를 앞에있는 로그인 아이디에 넣어줘, 그리고 나서 모델을 통해서 가져온다.) 
	  String loginId = (String) session.getAttribute("loginId");
	  
	  Model.addAttribute("loginId", (String)session.getAttribute("loginId"));
	 
	  return "main";
	 
	  }

	
	
	
	
	// 로그아웃
	 
	 @RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(Model model, HttpSession session) {
			logger.info("로그아웃 요청"); // logger는 스트링 이외에는 찍어주지 않는다. (숫자 등을 찍을 때에는 다른 방법이 있다.);
			//세션에서 특정 속성만 제거하면 되기 때문에 서비스와 DAO를 할 필요가 없다.
			//이 경우에는 세션을 넣어주고! 모델 뒤에 
			session.removeAttribute("loginId");
			
			return "redirect:/";
		}
	 
	
	 
	 
	 
	 
		/*
		 * @RequestMapping(value = "/list")
		 * 
		 * public String list(Model model, HttpSession session) {
		 * logger.info("리스트 페이지 이동");
		 * 
		 * String page = "redirect:/";
		 * 
		 * 
		 * 
		 * 
		 * 
		 * if(session.getAttribute("loginId") != null) {
		 * 
		 * ArrayList<JoinMemberDTO> list = service.list(); model.addAttribute("list",
		 * list);
		 * 
		 * page = "list";
		 * 
		 * 
		 * }
		 * 
		 * 
		 * return page;
		 * 
		 * }
		 */
	 
	 
	
	 //상세보기 (내정보창)
	 
	 
	 @RequestMapping(value = "/mydetail", method = RequestMethod.GET)
		public String mydetail(Model model, @RequestParam String mem_id) {
			logger.info("상세보기 요청 : {}",mem_id); 
			
			JoinMemberDTO dto = service.mydetail(mem_id);
			
			model.addAttribute("info", dto);
			
			return "mydetail";
		}
	 
	 
	 
	 
	 
	 
//	 비밀번호 찾기
			
			@RequestMapping(value = "/findPw", method = RequestMethod.GET)
			public String findPw(Model model) {
				logger.info("findPw 이동");
				return "findPw";
			}
			
	
	
	
	
	
}
