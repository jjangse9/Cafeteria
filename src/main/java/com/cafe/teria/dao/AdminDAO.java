package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.JoinMemberDTO;
import com.cafe.teria.dto.QstDTO;


public interface AdminDAO {


    // 20220122 모든 회원 정보 불러오기 
    ArrayList<JoinMemberDTO> membersInfo();
    
      // 20220123 모든 글 불러오기
      ArrayList<CafeDTO> cafesInfo();

    // 20220123 업주회원으로 만들기
	int updateBcode(String mem_id, String bcode);
      
      
      ArrayList<QstDTO> qstInfo();

	QstDTO qstDetail(String qst_idx);

	int bQstWrite(HashMap<String, String> params);
      

}