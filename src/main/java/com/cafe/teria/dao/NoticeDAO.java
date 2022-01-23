package com.cafe.teria.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.cafe.teria.dto.NoticeDTO;

public interface NoticeDAO {

	ArrayList<NoticeDTO> noticeList();

	

	int noticeWrite(HashMap<String, String> params);



	void notice_uphit(String notice_idx);



	NoticeDTO noticeDetail(String notice_idx);



	int noticeDelete(String notice_idx);



	int allCount();



	ArrayList<NoticeDTO> noticeCall(int pagePerCnt, int offset);



	int noticeUpdate(HashMap<String, String> params);
	
}
