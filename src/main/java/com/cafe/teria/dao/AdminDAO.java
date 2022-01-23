package com.cafe.teria.dao;

import java.util.ArrayList;

import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.JoinMemberDTO;


public interface AdminDAO {


    // 20220122 모든 회원 정보 불러오기 
    ArrayList<JoinMemberDTO> membersInfo();
    
      // 20220123 모든 글 불러오기
      ArrayList<CafeDTO> cafesInfo();
      

}