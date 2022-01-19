package com.cafe.teria.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dao.CafeDAO;
import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.RecommentDTO;

@Service
public class CafeService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired CafeDAO dao;

	public ArrayList<CafeDTO> list() {
		
		//logger.info("리스트 서비스");
		
		return dao.list();
	}

	public List<HashMap<String, String>> detail(String cafe_idx, String method) {
		
		List<HashMap<String, String>> result = dao.detail(cafe_idx);
		
		if(method.equals("detail")){
			dao.upHit(cafe_idx);	//조회수 올리기			
		}
		
		return result;//이후 데이터 가져오기
		
	}
	
	public List<HashMap<String, Object>> replyList(int idx) {
		

		List<HashMap<String, Object>> replyList = dao.replyList(idx);
		

		
		return replyList;
	}

	
	

	public HashMap<String, String> cafeBmem(String cafe_idx) {
		
		HashMap<String, String> result = dao.cafeBmem(cafe_idx);
		
		return result;
		
	}
	
	

	public List<HashMap<String, String>> cafeReply(String cafe_idx) {
		
		List<HashMap<String, String>> result = dao.cafeReply(cafe_idx);
		
		return result;
	}
	


	public ArrayList<RecommentDTO> recoCall(int idx) {
		
		ArrayList<RecommentDTO> result = dao.recoCall(idx);
		
		//logger.info("서비스단에서 받아온 닉네임 : {}",result.get(0).getMem_nick());
		
		return result;
	}

	public List<HashMap<String, String>> recomment(String cafe_idx) {
		
		List<HashMap<String, String>> result = dao.recomment(cafe_idx);
		
		return result;
	}

	public void addreply(HashMap<String, String> param) {
		
		dao.addreply(param);
	}

	public void addRecomment(HashMap<String, String> param, String string) {
		
		if(string.equals("addRecomment")){
			dao.recocnt(param);				
		}
		
		dao.addRecomment(param);
	}

	public void updateReply(HashMap<String, String> param, String string) {
		
		if(string.equals("updateReply")){
			dao.rewritecnt(param);		
		}
		
		dao.updateReply(param);
		
	}

	public void replyDel(int idx) {
		
		dao.replyDel(idx);
	}

	public void updateRecom(HashMap<String, String> param) {
		
		dao.updateRecom(param);
	}

	public void recoDel(HashMap<String, String> param, String string) {
		
		
		if(string.equals("disrewritecnt")){
			dao.disrewritecnt(param);		
		}
		dao.recoDel(param);
		
	}

	



	
	
}
