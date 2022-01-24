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

   public List<HashMap<String, Object>> detail(String cafe_idx, String method) {
      
      List<HashMap<String, Object>> result = dao.detail(cafe_idx);
      
      if(method.equals("detail")){
         dao.upHit(cafe_idx);   //조회수 올리기         
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

   public int addreply(HashMap<String, String> param) {
      
      return dao.addreply(param);
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

   public HashMap<String, Object> idChk(HashMap<String, Object> idChk) {
      
      return dao.idChk(idChk);
   }
   
   

   
      /* 식단관련 s */
   public List<HashMap<String, String>> detail_diet(String cafe_idx, String method) {
      
      List<HashMap<String, String>> result = dao.detail_diet(cafe_idx);
      
      return result;//이후 데이터 가져오기
      
      
   }
    public int addDietMenu(HashMap<String, String> value) {


         int fs = dao.addDietMenu(value);
         
         return fs;
      }

      public String getDietIdx(String diet_date, String bcode, String idx, String diet_code, String diet_menu) {
         
         HashMap<String,String> allValue = new HashMap<String, String>();
         allValue.put("diet_date", diet_date);
         allValue.put("bcode", bcode);
         allValue.put("idx", idx);
         allValue.put("diet_code", diet_code);
         allValue.put("diet_menu", diet_menu);
         
         
         String diet_idx = dao.getDietIdx(allValue);
         
         
         return diet_idx;
      }

      public HashMap<String,String> getOriginName(String diet_date, String bcode, String idx, String diet_code, String diet_menu_seq) {

         HashMap<String,String> allValue = new HashMap<String, String>();
         allValue.put("diet_date", diet_date);
         allValue.put("bcode", bcode);
         allValue.put("idx", idx);
         allValue.put("diet_code", diet_code);
         allValue.put("diet_menu_seq", diet_menu_seq);
         
         HashMap<String,String> originName = dao.getOriginName(allValue);
         
         return originName;
      }

      public int updateDietMenu(HashMap<String, String> value) {
         
         int fs = dao.updateDietMenu(value);
         
         return fs;
      }

      public int deleteDietMenu(String startDate, String endDate) {
         
         HashMap<String,String> allValue = new HashMap<String, String>();
         allValue.put("startDate", startDate);
         allValue.put("endDate", endDate);
         
         int fs = dao.deleteDietMenu(allValue);
         
         return fs;
      }

      /* 식단관련 e */

   public Object bmemchk(HashMap<String, Object> idChk) {
      
      return dao.bmemchk(idChk);
   }

   public List<HashMap<String, Object>> imgChk() {
      
      return dao.imgChk();
   }

   public void imgUpload(ArrayList<HashMap<String, Object>> imgList) {
      
      dao.imgUpload(imgList);
   }

   public List<HashMap<String, Object>> likeView(HashMap<String, String> param) {
      
      return dao.likeView(param);
   }

   public void downLike(HashMap<String, String> params) {

      dao.downLike(params);
      dao.downLikeCnt(params);
      
   }

   public void upLike(HashMap<String, String> params) {
      
      dao.upLike(params);
      dao.upLikeCnt(params);
   }

   public void addLike(HashMap<String, String> params) {

      dao.addLike(params);
      dao.addLikeCnt(params);
   }

   public void rewrite(HashMap<String, String> params) {
      logger.info("서비스단에 도달한 업뎃 정보 : {} " , params);
      int result1 = dao.rewriteTitle(params);
      int result2 = dao.rewritePrice(params);
      int result3 = dao.rewriteName(params);
      logger.info("1번 쿼리 : "+result1);
      logger.info("2번 쿼리 : "+result2);
      logger.info("3번 쿼리 : "+result3);
   }

   public void newWrite(HashMap<String, String> params) {
      dao.newWrite(params);
   }

   

   
   
}