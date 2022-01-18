package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafe.teria.dto.BoardDTO;
import com.cafe.teria.dto.JoinMemberDTO;


public interface BoardDAO {
	
	
	ArrayList<JoinMemberDTO> myList(String loginId);

	int write(HashMap<String, String> params);

	ArrayList<BoardDTO> blameList();

	int blameWrite(HashMap<String, String> params);


}
