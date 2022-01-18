package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafe.teria.dto.JoinMemberDTO;


public interface JoinMemberDAO {

	String overlay(String id);

	int join(HashMap<String, String> param);

	int login(String mem_id, String mem_pw);

	JoinMemberDTO mydetail(String mem_id);

	ArrayList<JoinMemberDTO> list();

	int update(String mem_id, String mem_pw, String mem_nick, int mem_emailchk);


}
