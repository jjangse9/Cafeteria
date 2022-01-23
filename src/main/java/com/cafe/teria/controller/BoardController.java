package com.cafe.teria.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cafe.teria.service.CafeService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="/board")
public class BoardController {
   
   @Autowired 
   CafeService service;
   
   String filePath = "";
   
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
   
   @RequestMapping(value = "/fileUpload",method = RequestMethod.POST)
   @ResponseBody 
    public HashMap<String, Object> getData(Model model, HttpServletRequest request, MultipartHttpServletRequest req){
      String url = null;
      
      HashMap <String, Object> map = new HashMap <String, Object>();
      
     ArrayList<String> imgList = new ArrayList<String>();
      
      filePath = request.getSession().getServletContext().getRealPath("/resources/img");
      System.out.println(filePath);
        //get image file.
        List<MultipartFile> multipartFileList = new ArrayList<>();
        try{
            MultiValueMap<String, MultipartFile> files = req.getMultiFileMap();
            for (Map.Entry<String, List<MultipartFile>> entry : files.entrySet()) {
                List<MultipartFile> fileList = entry.getValue();
                for (MultipartFile file : fileList) {
                    if (file.isEmpty()) continue;
                    multipartFileList.add(file);
                }
            }
 
            if(multipartFileList.size()>0) {
                for(MultipartFile file: multipartFileList) {
                   String originFilename = file.getOriginalFilename();
                   String extName
                = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
                   Long size = file.getSize();
                   
                   // 서버에서 저장 할 파일 이름
                 String saveFileName = genSaveFileName(extName);
                 
                 //서버에 파일 주소랑 이름 저장해라 
                 
                 System.out.println("originFilename : " + originFilename);
                 System.out.println("extensionName : " + extName);
                 System.out.println("size : " + size);
                 System.out.println("saveFileName : " + saveFileName);
                 
                 writeFile(file, saveFileName);
                 url = filePath + saveFileName;
                 
                 //키가 중복이 되어버려서 생긴 문제!!!
                 
                 imgList.add(saveFileName);
                 
                 System.out.println("컨트롤러에서 리스트에 넣은 정보 : "+imgList);
                 
                    //file.transferTo(new File(file.getOriginalFilename()));
                }
            }
            }catch (Exception e){
            e.printStackTrace();
            logger.info(" has no multipartFile!");
        }
        for(int i=0; i<imgList.size(); i++) {
        	map.put("imgList"+i, imgList.get(i));
        }
        //.out.println("map 정보 "+map);
        map.put("path", "/resources/img/");
        model.addAttribute("log","사진 "+multipartFileList.size()+"장 전송완료!");
        return map;
    }
   
   // 현재 시간을 기준으로 파일 이름 생성
   private String genSaveFileName(String extName) {
      String fileName = "";
      
      Calendar calendar = Calendar.getInstance();
      fileName += calendar.get(Calendar.YEAR);
      fileName += calendar.get(Calendar.MONTH);
      fileName += calendar.get(Calendar.DATE);
      fileName += calendar.get(Calendar.HOUR);
      fileName += calendar.get(Calendar.MINUTE);
      fileName += calendar.get(Calendar.SECOND);
      fileName += calendar.get(Calendar.MILLISECOND);
      fileName += extName;
      
      return fileName;
   }
   
   
   // 파일을 실제로 write 하는 메서드
   private boolean writeFile(MultipartFile multipartFile, String saveFileName)
                        throws IOException{
      boolean result = false;

      byte[] data = multipartFile.getBytes();
      FileOutputStream fos = new FileOutputStream(filePath + "/" + saveFileName);
      fos.write(data);
      fos.close();
      
      return result;
   }
   
   @RequestMapping(value = "/cafe_write", method = RequestMethod.GET)
   public String write( Model model , @RequestParam("idx") String cafe_idx ) {
      logger.info("글쓰기 페이지 이동");
      
      HashMap<String, String> cafeBmem = service.cafeBmem(cafe_idx);
      List<HashMap<String, String>>diet = service.detail(cafe_idx,"detail");//detail 이란 String값을 보낸다
      List<HashMap<String, String>>detail_diet = service.detail_diet(cafe_idx,"detail_diet");
      List<HashMap<String, String>> cafeReply = service.cafeReply(cafe_idx);
      List<HashMap<String, String>> recomment = service.recomment(cafe_idx);
      
      model.addAttribute("cafe",cafeBmem);
      model.addAttribute("diet_detail",diet);
      model.addAttribute("diet",detail_diet);
      model.addAttribute("reply",cafeReply);
      model.addAttribute("recomment",recomment);
      
      System.out.println(diet);
      
      return "cafe_write";
   }
   //식단저장
   @SuppressWarnings("null")
   @RequestMapping(value = "/diet_save")
   @ResponseBody
   public String save(@RequestBody ArrayList<String> arr) throws ParseException{
      logger.info("map: {}", arr);
      
      if(arr.size() > 2) {
      
         String bcode = arr.get(0);
         String idx = arr.get(1);
         
         String diet_code = "";
         
         //기존 전체 데이터
         List<HashMap<String, String>>detail_diet = service.detail_diet(idx,"detail_diet");
         Calendar cal = Calendar.getInstance();

         //지난주 일요일
         String dayLastWeekTo = "";
         //이번주 일요일
         String thisWeekTo = "";
         
         cal.setTime(new java.util.Date());
         cal.add(Calendar.DAY_OF_WEEK, -1);
         cal.setFirstDayOfWeek(Calendar.SUNDAY);
         cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
         
         dayLastWeekTo = new SimpleDateFormat("yyyyMMdd").format(cal.getTime());
         
         int success = 0;
         String startDate = "";
         String endDate = "";
         
         String full_date = arr.get(2).replace("{", "").replace("}", "");
         int j = full_date.indexOf(":");
         String newDate= full_date.substring(j+1, full_date.length());
         String[] date_split = newDate.split(",");
         
         startDate = date_split[0];
         endDate = date_split[6];
         
         for(int i = 0 ; i < 7 ; i++) {
              if(i == 0) {
                 thisWeekTo =  date_split[i];
              }else {
                 thisWeekTo += "," + date_split[i];
              }
         }
         success = service.deleteDietMenu(startDate , endDate);
         System.out.println("data delete : " + success);

         List<HashMap<String, String>> values = new ArrayList<HashMap<String,String>>();
         
         String dieDate = "";
         String dieCode = "";
         String dieMenu = "";
         String cafIdx = "";
         String dieSeq = "";
         String dieIdx = "";
         
         for(int k=0; k<detail_diet.size(); k++) {      
            HashMap<String, Object> hashmap = new HashMap<String, Object>(detail_diet.get(k));
            HashMap<String, String> inputValue = new HashMap<String, String>();
            //System.out.println("Map : " + hashmap.toString());
            
            int cnt2 = 0;
            for(Entry<String, Object> elem : hashmap.entrySet()){            

               String ky = elem.getKey();
               Object vl = elem.getValue();
               
               if(ky.equals("diet_date")) {
                  dieDate = vl.toString();
                  cnt2 += 1;
               }
               if(ky.equals("diet_menu_seq")) {
                  dieSeq = vl.toString();
                  cnt2 += 1;
               }
               if(ky.equals("cafe_idx")) {
                  cafIdx = vl.toString();
                  cnt2 += 1;
               }
               if(ky.equals("diet_menu")) {
                  dieMenu = vl.toString();
                  cnt2 += 1;
               }
               if(ky.equals("diet_code")) {
                  dieCode = vl.toString();
                  cnt2 += 1;
               }
               if(ky.equals("diet_idx")) {
                  dieIdx = vl.toString();
                  cnt2 += 1;
               }
               
               if(cnt2 == 6) {
                  inputValue.put("diet_date", dieDate);
                  inputValue.put("diet_menu_seq", dieSeq);
                  inputValue.put("cafe_idx", cafIdx);
                  inputValue.put("diet_menu", dieMenu);
                  inputValue.put("diet_code", dieCode);
                  inputValue.put("diet_idx", dieIdx);
                  
                  values.add(inputValue);
               }
               
            }
         }
         
         System.out.println(values);
         
         
         for(int i = 3 ; i < arr.size() ; i++) {
            
            HashMap<String, String> value = new HashMap<String,String>();
            
            String full = arr.get(i).replace("{", "").replace("}", "");
            j = full.indexOf(":");
            String diet = full.substring(0,j); 
            String menu = full.substring(j+1, full.length());
            String diet_sec = "";
            
            String[] diet_menu = menu.split(",");
            
            if(diet.contains("M")) {
               diet_sec = diet;
               diet = diet.replace("M", "");
               diet_code = "1";
            }else if(diet.contains("L")) {
               diet_sec = diet;
               diet = diet.replace("L", "");
               diet_code = "2";
            }else if(diet.contains("D")) {
               diet_sec = diet;
               diet = diet.replace("D", "");
               diet_code = "3";
            }
            
            value.put("diet_date", diet);
            value.put("mem_bcode", bcode);
            value.put("cafe_idx", idx);
            value.put("diet_code", diet_code);
            
            int newData = 0;
            for(int l = 0 ; l < diet_menu.length ; l++) {
               value.put("diet_menu", diet_menu[l]);
               value.put("diet_menu_seq", ""+(l+1) );
               newData = 0;
               
               HashMap<String,String> originData = service.getOriginName(value.get("diet_date"), value.get("mem_bcode"), value.get("cafe_idx"), value.get("diet_code"), value.get("diet_menu_seq"));
               String originIdx = "none";
               String originName = "none";
               if(originData == null) {
                  
               }else {
                  originIdx = originData.get("diet_idx");
                  originIdx = originIdx == null ? "none" : originIdx;
                  
                  originName = originData.get("diet_menu");
                  originName = originName == null ? "none" : originName;
               }
               
               String dietId = service.getDietIdx(value.get("diet_date"), value.get("mem_bcode"), value.get("cafe_idx"), value.get("diet_code"), diet_menu[l]);
               dietId = dietId == null ? "none" : dietId;
               
               for(int k = 0 ; k < values.size() ; k++) {
                  
                  String formDate = values.get(k).get("diet_date").substring(0,10).replace("-", "");
                  
                  int highSeq = 0;
                  int lowSeq = 0;
                  
                  if(thisWeekTo.contains(value.get("diet_date"))){
                     
                     if(newData == 0) {
                        if(thisWeekTo.contains(value.get("diet_date")) && dietId.equals(values.get(k).get("diet_idx")) && value.get("diet_code").equals(values.get(k).get("diet_code")) 
                              && value.get("diet_menu").equals(values.get(k).get("diet_menu")) && value.get("diet_menu_seq").equals(values.get(k).get("diet_menu_seq")) ) {
                           
                           System.out.println("============================================================");
                           System.out.println("동일한 데이터");
                           System.out.println("formDate : " + formDate + " , value date :" + value.get("diet_date"));
                           System.out.println("Values diet_menu : " + values.get(k).get("diet_menu") + " , value menu :" + value.get("diet_menu"));
                           System.out.println("Values diet_seq : " + values.get(k).get("diet_menu_seq") + " , value seq :" + value.get("diet_menu_seq"));
                           System.out.println("Values diet_code : " + values.get(k).get("diet_code") + " , value code :" + value.get("diet_code"));
                           System.out.println("============================================================");
                           
                        }
                        else if(thisWeekTo.contains(value.get("diet_date")) &&  !value.get("diet_code").equals(values.get(k).get("diet_code")) && !value.get("diet_menu_seq").equals(values.get(k).get("diet_menu_seq"))
                              && dietId.equals("none")) {
                           
                           System.out.println("============================================================");
                           System.out.println("1. 신규 데이터");
                           System.out.println("formDate : " + formDate + " , value date :" + value.get("diet_date"));
                           System.out.println("value diet_idx : " + values.get(k).get("diet_idx") + " , " + dietId + " , " + value.get("diet_idx"));
                           System.out.println("value diet_menu : " + value.get("diet_menu"));
                           System.out.println("value diet_seq : " + value.get("diet_menu_seq"));
                           System.out.println("value diet_seq : " + values.get(k).get("diet_menu_seq"));
                           System.out.println("Value diet_code : " + value.get("diet_code"));
                           System.out.println("============================================================");
                           
                           newData = 1;
                           break;
                           
                        }
                        else if(thisWeekTo.contains(value.get("diet_date")) && dietId.equals("none") && !value.get("diet_code").equals(values.get(k).get("diet_code")) && !value.get("diet_menu").equals(values.get(k).get("diet_menu"))  
                              && !value.get("diet_menu_seq").equals(values.get(k).get("diet_menu_seq"))) {
                           
                           System.out.println("============================================================");
                           System.out.println("3. 같은일자 추가데이터");
                           System.out.println("value date :" + value.get("diet_date"));
                           System.out.println("value diet_menu : " + value.get("diet_menu"));
                           System.out.println("value diet_seq : " + value.get("diet_menu_seq"));
                           System.out.println("Value diet_code : " + value.get("diet_code"));
                           System.out.println("============================================================");
                           
                           newData = 3;
                           break;
                           
                        }
                     }
                  }
                  lowSeq = 0;
                  highSeq = 0;
               }
               
               if(newData == 1) {
                  
                  System.out.println("=======================1. 신규데이터=========================");
                  System.out.println(value);
                  System.out.println("==========================================================");
                  
                  int fs = service.addDietMenu(value);
                  //System.out.println("성공여부 : " + fs);
               }else if(newData == 3) {
                  
                  System.out.println("=======================3. 같은일자 추가데이터=================");
                  System.out.println(value);
                  System.out.println("=========================================================");
                  
                  int fs = service.addDietMenu(value);
                  //System.out.println("성공여부 : " + fs);
               }
               
            }
            
         }
      
      }else {
         
      }
      
      JsonObject obj = new JsonObject(); 
      obj.addProperty("result", "성공"); 
      return new Gson().toJson(obj); 
   }
      
}