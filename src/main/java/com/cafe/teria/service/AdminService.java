package com.cafe.teria.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.AdminDAO;


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
         
         
         return adminResult;
   }

      

      
}


