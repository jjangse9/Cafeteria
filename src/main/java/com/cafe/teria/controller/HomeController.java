package com.cafe.teria.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe.teria.dto.CafeDTO;
import com.cafe.teria.dto.RecommentDTO;
import com.cafe.teria.service.CafeService;

@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CafeService service;

    @RequestMapping(value = "/testlist", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("임시 리스트 페이지 이동");
		
		ArrayList<CafeDTO> list = service.list();
		model.addAttribute("list",list);
		
		return "testlist";
	}
	
	
	@RequestMapping(value = "/detail")
	public String detail(Model model, @RequestParam("idx") String cafe_idx) {
		
		//logger.info("detail 요청 : {}",cafe_idx);
		
		HashMap<String, String> cafeBmem = service.cafeBmem(cafe_idx);
		List<HashMap<String, String>>diet = service.detail(cafe_idx,"detail");
		List<HashMap<String, String>> cafeReply = service.cafeReply(cafe_idx);
		List<HashMap<String, String>> recomment = service.recomment(cafe_idx);
		
		
		//System.out.println(cafeBmem);
		//System.out.println(diet);
		
		//System.out.println(cafeReply);
		//ystem.out.println(recomment);
		
		
		model.addAttribute("cafe",cafeBmem);
		model.addAttribute("diet",diet);
		model.addAttribute("reply",cafeReply);
		model.addAttribute("recomment",recomment);
		
		return "cafeDetail";
	}
	
	
	
	@RequestMapping(value = "/replyList", method = RequestMethod.POST)
	@ResponseBody
	public List<HashMap<String, Object>> replyList(@RequestParam int idx) {
		
		List<HashMap<String, Object>> map = service.replyList(idx);
		
		//logger.info("컨트롤러에서 받아온 ReplyList : {}",map);
		
		return map;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/recommentCall", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> recommentCall(@RequestParam int idx) {
		//logger.info("대댓글 요청{}",idx);
		
		HashMap<String, Object> recommentCall = new HashMap<String, Object> ();
		
		ArrayList<RecommentDTO> listCall = service.recoCall(idx);
		
		//logger.info("리스트콜 값 가져오기 : {}",listCall.get(0).getRecomment_posttime());
		
		recommentCall.put("listcall", listCall);
		
		return recommentCall;
	}
	
	
	@RequestMapping(value = "/addreply", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> addreply(@RequestParam HashMap<String, String> param) {
		
		//logger.info("댓글 등록 요청 : {}",param);

		service.addreply(param);
		
		 HashMap<String, Object> success = new  HashMap<String, Object>();
		 
		 success.put("success", 1);
		
		return success; 
	
	}

	
	
	@RequestMapping(value = "/addRecomment", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> addRecomment(@RequestParam HashMap<String, String> param) {
		
		//logger.info("대댓글 등록 요청 : {}",param);

		service.addRecomment(param, "addRecomment");
		
		 HashMap<String, Object> success = new  HashMap<String, Object>();
		 
		 success.put("success", 1);

		return success; 
	
	}
	
	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateReply(@RequestParam HashMap<String, String> param) {
		
		//logger.info("댓글 수정 요청 : {}",param);
		
		service.updateReply(param,"updateReply");

		HashMap<String, Object> success = new  HashMap<String, Object>();
		 
		 success.put("success", 1);

		return success; 
	
	}
	
	
	
	@RequestMapping(value = "/replyDel", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> replyDel(@RequestParam int idx) {
		
		service.replyDel(idx);

		HashMap<String, Object> success = new  HashMap<String, Object>();
		 
		 success.put("success", 1);

		return success; 
	
	}
	
	@RequestMapping(value = "/updateRecom", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> updateRecom(@RequestParam HashMap<String, String> param) {
		
		//logger.info("컨트롤러에서 받아온 정보 : {}",param);
		
		service.updateRecom(param);
		
		HashMap<String, Object> success = new  HashMap<String, Object>();
		 
		success.put("success", 1);

		return success; 
	
	}
	
	@RequestMapping(value = "/recoDel", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> recoDel(@RequestParam HashMap<String, String> param) {
		
		service.recoDel(param,"disrewritecnt");

		HashMap<String, Object> success = new  HashMap<String, Object>();
		 
		 success.put("success", 1);

		return success; 
	
	}
	
	
	
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> idChk(@RequestParam HashMap<String, Object> idChk) {
		
		//logger.info("받아온 idChk 값  : {}",idChk);
		
		HashMap<String, Object> idChkinfo = new HashMap<String, Object>();
		
		idChkinfo.put("idChk", service.idChk(idChk));
		
		//logger.info("idChkInfo : {} ",idChkinfo);

		return idChkinfo; 
	
	}
	
	
	  
	   @RequestMapping(value = "/testImage", method = RequestMethod.GET)
	   public String testImage(Model model) {
	      
	      return "testImage";
	   }
	
	
	   
		@RequestMapping(value = "/bmemchk", method = RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> bmemchk(@RequestParam HashMap<String, Object> idChk) {
			
			//logger.info("받아온 idChk 값  : {}",idChk);
			
			HashMap<String, Object> idChkinfo = new HashMap<String, Object>();
			
			idChkinfo.put("idChk", service.bmemchk(idChk));
			
			//logger.info("idChkInfo : {} ",idChkinfo);

			return idChkinfo; 
		
		}
	
		
		@RequestMapping(value = "/imgChk", method = RequestMethod.POST)
		@ResponseBody
		public List<HashMap<String, Object>> imgChk() {
			
			List<HashMap<String, Object>> imgInfo = service.imgChk();
			
			System.out.print(imgInfo);
			
			return imgInfo; 
		
		}
		

		@RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
		@ResponseBody
		public int imgUpload(@RequestParam HashMap<String, Object> params) {
			
			System.out.println("컨단 에서 받은 params 의 정보 : " + params);
			
			
			
			HashMap<String, Object> imgMap = new HashMap<String, Object>();
			
			
			for(int i=0; i<params.size()-2; i++) {
				
				ArrayList<HashMap<String, Object>> imgList= new ArrayList<HashMap<String,Object>>();				
				
				System.out.println("컨단 에서 받은 params 하위" + params.get("data[imgList"+i+"]"));
				imgMap.put("Name", params.get("data[imgList"+i+"]"));
				imgMap.put("replyIdx", params.get("replyIdx"));
				imgMap.put("path", params.get("data[path]"));
								
				imgList.add(imgMap);
				
				service.imgUpload(imgList);
				
				System.out.println("imgMap의 정보 "+imgMap);
				System.out.println("imgList의 정보 "+imgList);
			}
			
			
			return 1; 
		
		}
		
		
		@RequestMapping(value = "/likeView", method = RequestMethod.POST)
		@ResponseBody
		public List<HashMap<String, Object>> likeView(@RequestParam HashMap<String, String> param) {
			
			List<HashMap<String, Object>> map = service.likeView(param);
			
			//logger.info("컨트롤러에서 받아온 ReplyList : {}",map);
			
			return map;
		}
		
		
		
		@RequestMapping(value = "/upLike", method = RequestMethod.POST)
		@ResponseBody
		public int upLike(@RequestParam HashMap<String, String> params) {
			
			System.out.println("upLike params의 정보 : "+params);
			
			service.upLike(params);
	
			return 0;
		}
		
		
		@RequestMapping(value = "/downLike", method = RequestMethod.POST)
		@ResponseBody
		public int downLike(@RequestParam HashMap<String, String> params) {
			
			System.out.println("downLike params의 정보 : "+params);
			
			service.downLike(params);
	
			return 0;
		}
	
		
		
		@RequestMapping(value = "/addLike", method = RequestMethod.POST)
		@ResponseBody
		public int addLike(@RequestParam HashMap<String, String> params) {
			
			System.out.println("addLike params의 정보 : "+params);
			
			service.addLike(params);
	
			return 0;
		}
	

	
}
