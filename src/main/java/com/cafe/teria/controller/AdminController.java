package com.cafe.teria.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.JoinMemberDTO;
import com.cafe.teria.dto.RecommentDTO;
import com.cafe.teria.service.AdminService;
import com.cafe.teria.service.CafeService;

@Controller
public class AdminController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;

	
	@RequestMapping(value = "/admin", method = RequestMethod.GET) 
	   public String admin(
	         Model model,
	         HttpSession session
	         ) 
	   {
	      logger.info("관리자 로그인 성공"); 
	      
	      HashMap<String, Object> result = new HashMap<String, Object>();
	      result = service.adminInfo();
	      
	      Object memResult = new ArrayList<JoinMemberDTO>();
	      Object cafeResult = new ArrayList<CafeDTO>();
	      
	      for (Entry<String, Object> entrySet : result.entrySet()) {
	         logger.info("받아온 값 확인 : {}", entrySet.getKey() + " : " + entrySet.getValue());
	         if(entrySet.getKey().equals("membersInfo")) {
	            memResult = entrySet.getValue();
	         }else if(entrySet.getKey().equals("cafesInfo")) {
	            cafeResult = entrySet.getValue();
	         }
	      }
	      
	      model.addAttribute("memResult", memResult);
	      model.addAttribute("cafeResult", cafeResult);
	      
	      return "admin"; 
	   }
	
	
	// 20220122 update 업주코드 부여
	@RequestMapping(value = "/bcodeEdit", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> bcodeEdit(
			@RequestParam String mem_id, 
	        @RequestParam String bcode
			) {
		logger.info("확인해보기");
		
		HashMap<String, Object> success = service.updateBcode(mem_id, bcode);
		
		return success;
		
	}
  
}
