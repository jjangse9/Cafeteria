package com.cafe.teria.dao;

import java.time.LocalDate;
import java.util.ArrayList;

public interface MainPageDAO {

	// 검색 시간에 따라 요일은 정해진 상태로 mapper 이동
	ArrayList<com.cafe.teria.dto.MainPageDTO> mainSearchList(String keyword, LocalDate startDate, LocalDate endDate, String category);

	// 댓글 불러오기( 블라인드가 아닌 것 중에서 )
	ArrayList<com.cafe.teria.dto.MainPageReplyDTO> mainReplyList();

	// 20220117 - 반반 댓글 리뷰
	ArrayList<com.cafe.teria.dto.MainPageReplyDTO> halfReply();

	// 20220117 - 포토리뷰
	ArrayList<com.cafe.teria.dto.MainPageReplyDTO> photoReply();


}
