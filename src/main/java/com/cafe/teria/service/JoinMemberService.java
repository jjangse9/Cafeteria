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

	public int login(String mem_id, String mem_pw) {
		
		return dao.login(mem_id,mem_pw);
	}
	
	

	public JoinMemberDTO mydetail(String mem_id) {
		
		return dao.mydetail(mem_id);
	}
	
	

	public ArrayList<JoinMemberDTO> list() {
		
		 ArrayList<JoinMemberDTO> list = null;
			
			list = dao.list();//디비가 필요
			logger.info("size : {}",list.size());
			return list;

	}
	
	

		
}



