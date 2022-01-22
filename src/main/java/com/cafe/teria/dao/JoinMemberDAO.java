package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafe.teria.dto.JoinMemberDTO;


public interface JoinMemberDAO {

	String overlay(String id);

	int join(HashMap<String, String> param);

	HashMap<String, Object> login(String mem_id, String mem_pw);

	JoinMemberDTO mydetail(String mem_id);

	ArrayList<JoinMemberDTO> list();

	/*
	 * int update(String mem_id, String mem_pw, String mem_nick, int mem_emailchk);
	 */

	

	//20220117 아이콘 떠오기 => new 로 고정함( oriname만 있다면 db에서 복사해주자 )
	   String iconChk(String loginId);
	//20220117 아이콘 떠오기   
	   
	//20220117 상태창보기SI,  회원정보변경페이지로SI
	   JoinMemberDTO viewInfo(String userId);
	   //JoinMemberDTO mydetail(String mem_id);
	//20220117 상태창보기SI,  회원정보변경페이지로SI

	//20220119 회원정보수정SI
	   int editInfo(HashMap<String, String> param);
	   int editIcon(HashMap<String, String> param);
	//20220119 회원정보수정SI

	//20220119 닉네임 중복체크SI
	   String nickChk(String nick);
	//20220119 닉네임 중복체크SI
	
	//비밀번호 찾기
		String findPassword(String mem_id);

		int pwupdate(HashMap<String, String> params);
		/*
		 * // 20220122 모든 글 불러오기 ArrayList<JoinMemberDTO> membersInfo();
		 */

}
