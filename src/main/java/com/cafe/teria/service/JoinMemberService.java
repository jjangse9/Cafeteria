package com.cafe.teria.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.JoinMemberDAO;
import com.cafe.teria.dto.JoinMemberDTO;


@Service
public class JoinMemberService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired JoinMemberDAO dao;

	public HashMap<String, Object> overlay(String mem_id) {
		
		logger.info("중복체크 서비스 도착!!");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String overlayId = dao.overlay(mem_id);
		
		logger.info("중복 아이디 여부 : {}",overlayId);
		
		boolean overlay = overlayId == null ? false : true;
		
		map.put("overlay", overlay);
		return map;
		
	}
	

	public HashMap<String, Object> join(HashMap<String, String> param) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int row = dao.join(param);
		map.put("success", row);
	
		return map;
	
	}

	public HashMap<String, Object> login(String mem_id, String mem_pw) {
		
		return dao.login(mem_id,mem_pw);
	}
	
	

//	public JoinMemberDTO mydetail(String mem_id) {
//		
//		return dao.mydetail(mem_id);
//	}
	
	

	public ArrayList<JoinMemberDTO> list() {
		
		 ArrayList<JoinMemberDTO> list = null;
			
			list = dao.list();//디비가 필요
			logger.info("size : {}",list.size());
			return list;

	}
	
	
	
	
	// 20220117 로그인=>메인페이지 아이콘 떠오기
	   public String iconChk(String loginId) {
	      
	      return dao.iconChk(loginId);
	   }
	   
	   
	   
	   
	// 20220117 상태창보기SI, 회원정보변경페이지로SI
	   public JoinMemberDTO viewInfo(String userId) {
	      JoinMemberDTO result = new JoinMemberDTO();
	      
	      result = dao.viewInfo(userId);
	      
	      return result;
	   }

		
	   
	   
		// 20220117 상태창보기SI, 회원정보변경페이지로SI

		// 20220119 회원정보수정SI
		   public HashMap<String, String> editInfo(HashMap<String, String> param) {
		      HashMap<String, String> edit = new HashMap<String, String>();
		      
		      int result = dao.editInfo(param);
		      int resultIcon = dao.editIcon(param);
		      
		      if(result > 0 & resultIcon > 0) {
		         edit = param;
		      }
		      
		      return edit;
		   }
		// 20220119 회원정보수정SI

		// 20220119 닉네임 중복체크SI
		   public HashMap<String, Object> nickChk(String nick) {
		      logger.info("중복체크 서비스 도착");
		      
		      HashMap<String, Object> map = new HashMap<String, Object>();
		      
		      String chkNick = dao.nickChk(nick);

		      logger.info("중복 닉네임 여부 : {}", chkNick);
		      
		      boolean chk = chkNick == null ? false : true;
		      map.put("chk", chk);
		      
		      logger.info("map에 들어있는 값: {}", map);
		      
		      return map;
		   }
		// 20220119 회원정보수정
		
		
		
		   
		   //비밀번호 찾기
		   
			public String findpassword(String mem_id) {
				logger.info("hrmmm");
				
				String mem_pw = dao.findPassword(mem_id);
				logger.info("mem_pw : {}", mem_pw);
				
				return mem_pw;
			}

			public void pwupdate(HashMap<String, String> params) {
				
				
				logger.info("비밀번호 정보 : {}", params);
				
				System.out.print(params);
				
				int row = dao.pwupdate(params);
				
				logger.info("수정 성공 여부 : "+row);
				
			}

			public JoinMemberDTO mydetail(String mem_id) {
				
				return dao.mydetail(mem_id);
			}

// 20220122 - 로그인 아이디가 admin일때 모든 데이터를 받아오는 서비스
			public HashMap<String, Object> adminInfo() {
				// 모든 관리자 데이터가 들어갈 hashmap adminResult 선언
				HashMap<String, Object> adminResult = new HashMap<String, Object>();
				
				// adminResult에 회원정보 모두 담기
				adminResult.put("membersInfo", dao.membersInfo());			// 회원들 정보
				//adminResult.put("boardsInfo", dao.boardsInfo());				// 글들 정보
				
				
				return adminResult;
			}

		

	   
}



