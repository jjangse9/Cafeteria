package com.cafe.teria.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

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

	@RequestMapping(value = "/admin", method = RequestMethod.GET) 
	public String admin(
			Model model,
			HttpSession session
			) 
	{
		
		logger.info("관리자 로그인 성공"); 
		return "admin"; 
	}
	
	
	
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET) 
	public String home(Model model) {
		logger.info("main page 이동"); 
		return "login"; 
	}
	
	
	
	//회원가입
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("joinForm page 이동");
		return "joinForm";
	}
	
	
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> join(
			@RequestParam HashMap<String, String> param,
			HttpSession session
			) 
	{
		logger.info("회원가입 요청 : {}", param);
		
		String loginId = (String) session.getAttribute("loginId");
		
		
		
		return service.join(param);
	}

	
	//중복검사
	@RequestMapping(value = "/overlay", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String mem_id) {
		logger.info("중복 아이디 체크 : {}",mem_id);
		return service.overlay(mem_id);
	}
	

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(
			@RequestParam String mem_id, 
			@RequestParam String mem_pw,
			HttpSession session,
			Model model) {
		logger.info("로그인 체크 : {} / {}",mem_id,mem_pw);
		
		// 로그인한 회원정보를 받을 success Hashmap 선언
		HashMap<String, Object> success = new HashMap<String, Object>();
				
		// success에 회원정보 넣어주기
		success.put("memInfo", service.login(mem_id,mem_pw));
		
		// 20220122 - hashmap 값 확인하기SI
		for (Entry<String, Object> entrySet : success.entrySet()) {
			logger.info("받아온 값 확인 : {}", entrySet.getKey() + " : " + entrySet.getValue());
			}
		
		// 로그인 성공 여부 확인
		logger.info("로그인 성공여부 : {}",success);
		
		// 로그인이 성공했다면( success가 null이 아닐경우)
		if(success != null) {
			session.setAttribute("loginId", mem_id);
			success.put("loginId", mem_id);
		}
		

// 20220122 로그인 회원 아이디가 admin 일 경우 관리 페이지에서 필요한 모든 데이터를 뽑아온다.
		if(mem_id.equals("admin")) {
			
			HashMap<String, Object> adminResult = service.adminInfo();
			model.addAttribute("adminResult", adminResult);
		}
		
		return success;
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
	 
	 
	
//	 //상세보기 (내정보창)
//	 
//	 
//	 @RequestMapping(value = "/mydetail", method = RequestMethod.GET)
//		public String mydetail(Model model, @RequestParam String mem_id) {
//			logger.info("상세보기 요청 : {}",mem_id); 
//			
//			JoinMemberDTO dto = service.mydetail(mem_id);
//			
//			model.addAttribute("info", dto);
//			
//			return "mydetail";
//		}
//	 
	 
	 
	 
	 
	 
		// 20220117 상태창 보기SI
	   @RequestMapping(value="/myStat", method = RequestMethod.GET)
	   public String myStat(Model model, HttpSession session) {
	      logger.info("내 상태창보기");
	   
	      // 현재 로그인된 사용자 Id 가져오기
	       String userId = (String) session.getAttribute("loginId");
	      
	      // 로그인을 해야지만 진입할 수 있기 때문에 일단 로그인 확인 절차는 무시
	      JoinMemberDTO userInfo = service.viewInfo(userId);
	      
	      model.addAttribute("userInfo", userInfo);
	      
	      return "mydetail";   
	   }
	// 20220117 상태창 보기SI   
	   
	// 20220117 회원정보 변경 페이지로SI
	   @RequestMapping(value="/myStatEdit", method = RequestMethod.GET)
	   public String myStatEdit(Model model, HttpSession session) {
	      logger.info("회원 정보 변경 페이지로");
	   
	      // 현재 로그인된 사용자 Id 가져오기
	       String userId = (String) session.getAttribute("loginId");
	      
	      // 로그인을 해야지만 진입할 수 있기 때문에 일단 로그인 확인 절차는 무시
	      JoinMemberDTO userInfo = service.viewInfo(userId);
	      
	      model.addAttribute("userInfo", userInfo);
	      
	      return "myDetailEdit";
	   }
	// 20220117 회원정보 변경 페이지로SI
	// 20220117 닉네임 중복체크
	   @RequestMapping(value = "/nickChk", method = RequestMethod.GET)
	   @ResponseBody
	   public HashMap<String, Object> nickChk(@RequestParam String nick) {
	      logger.info("중복 닉네임 체크 : {}", nick);
	      
	      return service.nickChk(nick);
	      // (18) joinForm으로 boolean 결과값 return.
	      // map에 들어있는 값: {overlay=true} -> HashMap
	   }
	// 20220119 닉네임 중복체크SI
	// 20220119 회원정보 변경SI
	   @RequestMapping(value="/EditInfo", method = RequestMethod.POST)
	   public @ResponseBody HashMap<String, String> EditInfo(
	         @RequestParam HashMap<String, String> param,
	         HttpSession session
	         ) 
	   {
	      logger.info("회원 정보 변경 요청");
	   
	      // 현재 로그인된 사용자 Id 가져오기
	       String userId = (String) session.getAttribute("loginId");
	      
	      // 로그인을 해야지만 진입할 수 있기 때문에 일단 로그인 확인 절차는 무시
	      HashMap<String, String> editResult = service.editInfo(param);
	            
	      return editResult;
	   }
	// 20220119 회원정보 변경SI
	
	

	
	
	
	 
	 
	 
//	 비밀번호 찾기
			
			@RequestMapping(value = "/findPw", method = RequestMethod.GET)
			public String findPw(Model model) {
				logger.info("findPw 이동");
				return "findPw";
			}
			
	
	//비밀번호 찾기
			
			@RequestMapping(value = "/findpassword", method = RequestMethod.POST)
			public String findpassword(Model model,
					@RequestParam String mem_id, HttpSession session) {
				logger.info("비밀번호 찿기 도착");
				
				logger.info("멤버 아이디" + mem_id);
				
				String mem_pw = service.findpassword(mem_id);
				
				logger.info("쿼리결과 컨트롤러 : {}",mem_pw);
											
				model.addAttribute("pw",mem_pw);
				
				return "findpassword";
			}
	
	
	
	// 비밀번호 변경 폼으로 이동
			
			@RequestMapping(value = "/passUpdate", method = RequestMethod.GET)
			public String passUpdate(Model model, HttpSession session) {
				logger.info("passUpdate 이동");
				
				  String userId = (String) session.getAttribute("loginId");
			      
			      // 로그인을 해야지만 진입할 수 있기 때문에 일단 로그인 확인 절차는 무시
			      JoinMemberDTO userInfo = service.viewInfo(userId);
			      
			      model.addAttribute("userId", userId);
			      model.addAttribute("userInfo", userInfo);
				
				return "passUpdate";
			}
			
			
			
			
	//비밀번호 업데이트!
			
			@RequestMapping(value = "/pwupdate", method = RequestMethod.POST)
			//파라메터를 받을 때에는 리퀘스트 파람이라는 걸로받는다. 파라메터는 스트링밖에 없어! 무조건 스트링이야! 스트링 id 를 한다음에 밑에 상세보기 요청을 적어. 
			public String pwupdate(Model model,
					@RequestParam HashMap<String, String> params) {
				logger.info("수정 요청 : {}",params); // logger는 스트링 이외에는 찍어주지 않는다. (숫자 등을 찍을 때에는 다른 방법이 있다.);
				
				
				service.pwupdate(params);
			
				return "main";
			}
			
	
}
