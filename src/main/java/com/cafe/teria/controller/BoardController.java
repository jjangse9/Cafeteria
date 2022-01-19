package com.cafe.teria.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe.teria.service.CafeService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
   
   @Autowired 
   CafeService service;
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @RequestMapping(value = "/board", method = RequestMethod.GET)
   public String board( Model model) {
      logger.info("상세 페이지 이동");
      return "board";
   }
   
   @RequestMapping(value = "/boardReply", method = RequestMethod.GET)
   public String boardReply( Model model) {
      logger.info("상세 페이지 이동");
      return "board/board_reply";
   }
   
   @RequestMapping(value = "/cafe_write", method = RequestMethod.GET)
   public String write( Model model , @RequestParam("idx") String cafe_idx ) {
      logger.info("글쓰기 페이지 이동");
      
      HashMap<String, String> cafeBmem = service.cafeBmem(cafe_idx);
      List<HashMap<String, String>>diet = service.detail(cafe_idx,"detail");
      //List<HashMap<String, String>>detail_diet = service.detail_diet(cafe_idx,"detail_diet");
      List<HashMap<String, String>> cafeReply = service.cafeReply(cafe_idx);
      List<HashMap<String, String>> recomment = service.recomment(cafe_idx);
      
      model.addAttribute("cafe",cafeBmem);
      model.addAttribute("diet_detail",diet);
      //model.addAttribute("diet",detail_diet);
      model.addAttribute("reply",cafeReply);
      model.addAttribute("recomment",recomment);
      
      System.out.println(diet);
      
      return "cafe_write";
   }

}