package com.cafe.teria.service;

import java.util.HashMap;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe.teria.dao.AdminDAO;
import com.cafe.teria.dto.QstDTO;


@Service
public class AdminService {
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   
   @Autowired AdminDAO dao;

// 20220122 - 로그인 아이디가 admin일때 모든 데이터를 받아오는 서비스
   public HashMap<String, Object> adminInfo() {
         // 모든 관리자 데이터가 들어갈 hashmap adminResult 선언
         HashMap<String, Object> adminResult = new HashMap<String, Object>();
         
         // adminResult에 회원정보 모두 담기
         adminResult.put("membersInfo", dao.membersInfo());         // 회원들 정보
         adminResult.put("cafesInfo", dao.cafesInfo());            // 글들 정보
         adminResult.put("qstInfo", dao.qstInfo()); 
         
         return adminResult;
   }

// 20220123 - 업주회원으로 만들기
public HashMap<String, Object> updateBcode(String mem_id, String bcode) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	int success = dao.updateBcode(mem_id, bcode);
	
	if(success > 0) {
		map.put("bcodeEdit", success);		
	}
	
	return map;
	
}
public QstDTO qstDetail(String qst_idx, String string) {
	
	return dao.qstDetail(qst_idx);
}

public void bQstWrite(HashMap<String, String> params) {
	
	int row = dao.bQstWrite(params);
	
}



      
}


