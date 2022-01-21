package com.cafe.teria.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe.teria.dto.MainPageDTO;

@Controller
public class MainPageController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired com.cafe.teria.service.MainPageService service;
	
	// 20220111 - 메인 페이지 출력
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		// 20220117 - 반반 div
		ArrayList<com.cafe.teria.dto.MainPageReplyDTO> halfResult = service.halfReply();
		
		// 20220117 - 포토리뷰
		ArrayList<com.cafe.teria.dto.MainPageReplyDTO> photoResult = service.photoReply();
		
		model.addAttribute("halfResult", halfResult);
		model.addAttribute("photoResult", photoResult);
		
		return "mainpage";
	}
	
	// 20220111 - 검색어 입력 후 검색 버튼 클릭 시
	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
	public String searchResult(
			Model model, 
			@RequestParam String keyword,
			@RequestParam(required = false) String[] filterValues) {
		// 검색어가 잘 넘어오는지 확인
		logger.info(keyword);
		
		// service에게 해당 검색어로 db 찾아서 리스트 뽑아오도록 시킴( 반환타입은 dto로 여러개 )
		ArrayList<MainPageDTO> result = service.mainSearch(keyword, 1, filterValues);		
		
		// 중복 제거 => mainSearch에서 했어도 되긴함
		ArrayList<MainPageDTO> newResult = service.mainSearchDeDuplication(result);
		
		// 아이디 별로 가장 좋아요가 많이 찍힌 댓글 리스트 매칭하기
		ArrayList<MainPageDTO> lastResult = service.mainReplySearch(newResult);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("result", result);
		model.addAttribute("size", result.size());
		model.addAttribute("newResult", newResult);
		model.addAttribute("newResultSize", newResult.size());
		model.addAttribute("lastResult", lastResult);
		model.addAttribute("lastResultSize", lastResult.size());
		
		return "searchResult";
	}
	
	/*
	// 20220115 검색 결과 정렬 - AJAX
	@RequestMapping(value = "/searchPageListSort", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> searchPageListSort(
			@RequestParam String keyword, 
			@RequestParam int sortValue,
			@RequestParam(required = false) String[] filterValues) {
		// 검색어가 잘 넘어오는지 확인
		logger.info("검색어 : {}", keyword);
		
		// service에게 해당 검색어로 db 찾아서 리스트 뽑아오도록 시킴( 반환타입은 dto로 여러개 )
		ArrayList<MainPageDTO> result = service.mainSearch(keyword, sortValue, filterValues);
		
		// 중복 제거 => mainSearch에서 했어도 되긴함
		ArrayList<MainPageDTO> newResult = service.mainSearchDeDuplication(result);
		
		// 아이디 별로 가장 좋아요가 많이 찍힌 댓글 리스트 매칭하기
		ArrayList<MainPageDTO> lastResult = service.mainReplySearch(newResult);
				
		// 20220115 +정렬 => 폐기 sql문을 변경하는 쪽으로
		// https://includestdio.tistory.com/35 => ArrayList 정렬 -> compare 함수 사용
		// https://mine-it-record.tistory.com/279 => ArrayList 정렬 -> compare 함수 사용
		// https://pythonq.com/so/java/702527 => ArrayList -> JSON으로 변환
		// HashMap<String, MainPageDTO> sortResult = service.searchPageSort(lastResult, category);
		
		// lastResult를 HashMap으로 변환( 비동기 JSON 객체 모양과 같게 만들기 위함 )
		HashMap<String, Object> ajaxSortResult = service.mainSearchSort(lastResult);
		
		
		return ajaxSortResult;
	}
	*/
	
	// 필터
	@RequestMapping(value = "/searchPageFilter", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> searchPageFilter(
			@RequestParam String keyword,
			@RequestParam int sortValue,
			@RequestParam(required = false) String[] filterValues) {
		// logger.info("keyword : {}", keyword);
		// logger.info("sortValue : {}", sortValue);
		// logger.info("filterValues size : {}", filterValues.length);
		
		// service에게 해당 검색어로 db 찾아서 리스트 뽑아오도록 시킴( 반환타입은 dto로 여러개 )
		ArrayList<MainPageDTO> result = service.mainSearch(keyword, sortValue, filterValues);
		
		// 중복 제거 => mainSearch에서 했어도 되긴함
		ArrayList<MainPageDTO> newResult = service.mainSearchDeDuplication(result);
		
		// 아이디 별로 가장 좋아요가 많이 찍힌 댓글 리스트 매칭하기
		ArrayList<MainPageDTO> lastResult = service.mainReplySearch(newResult);
		
		HashMap<String, Object> ajaxSortResult = service.mainSearchSort(lastResult);
		
		return ajaxSortResult;
	}
	
	
	
	
	
	
	
	
}














