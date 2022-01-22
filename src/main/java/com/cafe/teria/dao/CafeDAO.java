package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.QstDTO;
import com.cafe.teria.dto.RecommentDTO;

public interface CafeDAO {

	ArrayList<CafeDTO> list();

	void upHit(String cafe_idx);

	List<HashMap<String, String>> detail(String cafe_idx);

	HashMap<String, String> cafeBmem(String cafe_idx);

	List<HashMap<String, String>> cafeReply(String cafe_idx);

	ArrayList<RecommentDTO> recoCall(int idx);

	List<HashMap<String, String>> recomment(String cafe_idx);

	void addreply(HashMap<String, String> param);

	void addRecomment(HashMap<String, String> param);

	void recocnt(HashMap<String, String> param);

	List<HashMap<String, Object>> replyList(int idx);

	void rewritecnt(HashMap<String, String> param);

	void updateReply(HashMap<String, String> param);

	void replyDel(int idx);

	void updateRecom(HashMap<String, String> param);

	void recoDel(HashMap<String, String> param);

	void disrewritecnt(HashMap<String, String> param);

	HashMap<String, Object> idChk(HashMap<String, Object> idChk);

	HashMap<String, Object> bmemchk(HashMap<String, Object> idChk);

	List<HashMap<String, Object>> imgChk();



}
