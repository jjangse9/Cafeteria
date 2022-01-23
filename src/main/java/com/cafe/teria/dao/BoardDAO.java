package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafe.teria.dto.BoardDTO;
import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.RecommentDTO;
import com.cafe.teria.dto.ReplyDTO;


public interface BoardDAO {
	
	
//	ArrayList<JoinMemberDTO> myList(String loginId);

	int write(HashMap<String, String> params);

	ArrayList<BoardDTO> blameList();

	int blameWrite(HashMap<String, String> params);

	
	
	// 20220117 내 글 보기SI   
	   ArrayList<CafeDTO> myPost(String loginId);
	// 20220117 내 글 보기SI

	// 20220117 내 댓글 보기SI
	   ArrayList<ReplyDTO> myReply(String loginId);
	   ArrayList<RecommentDTO> myRecomment(String loginId);
	// 20220117 내 댓글 보기SI
	

}
