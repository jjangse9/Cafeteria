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

import com.cafe.teria.dto.NoticeDTO;
import com.cafe.teria.service.NoticeService;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	NoticeService service;

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model) {
		logger.info("notice list request========");

		ArrayList<NoticeDTO> noticeList = service.noticeList();
		logger.info("공지게시판  게시물 수: {}", noticeList.size());

		model.addAttribute("size", noticeList.size());
		model.addAttribute("list", noticeList);

		return "noticeList";
	}

	@RequestMapping(value = "/noticeWriteForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		logger.info("noticeWriteForm=======");
		return "noticeWriteForm";
	}

	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String write(Model model, @RequestParam HashMap<String, String> params) {
		logger.info("write:{}", params);
		service.noticeWrite(params);
		return "redirect:/notice/noticeList";
	}

	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Model model, @RequestParam String notice_idx) {
		logger.info("detail 요청:{}", notice_idx);

		NoticeDTO dto = service.noticeDetail(notice_idx, "noticeDetail");

		logger.info("dto:{}", dto.getNotice_content());

		model.addAttribute("noticeInfo", dto);

		return "noticeDetail";
	}

	@RequestMapping(value = "/noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(Model model, @RequestParam String notice_idx) {
		logger.info("삭제요청:{}", notice_idx);
		service.noticeDelete(notice_idx);
		return "redirect:/notice/noticeList";
	}

	@RequestMapping(value = "/noticeUpdateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam String notice_idx) {
		logger.info("update 요청:{}", notice_idx); // 숫자 값

		NoticeDTO dto = service.noticeDetail(notice_idx, "noticeUpdate");

		model.addAttribute("noticeInfo", dto);

		return "noticeUpdateForm";
	}

	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(Model model, @RequestParam HashMap<String, String> params) {
		logger.info("update요청:{}", params);
		
		
		
		service.noticeUpdate(params);
		return "redirect:/notice/noticeDetail?notice_idx=" + params.get("notice_idx");
	}

	
	
	@RequestMapping(value="/noticeCall", method = RequestMethod.GET)
	  @ResponseBody 
	  public HashMap<String, Object> noticeCall(@RequestParam String page, @RequestParam String cnt) {
	  	logger.info("리스트 요청 : {} 페이지, {} 개씩",page,cnt);
	  
	  	int currPage = Integer.parseInt(page); 
	  	int pagePerCnt =Integer.parseInt(cnt);
	 
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  
	  
	  map = service.noticeCall(currPage,pagePerCnt);
	 
	 
	 return map; }
	 

}
