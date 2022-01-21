package com.cafe.teria.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.teria.dto.MainPageDTO;
import com.cafe.teria.dto.MainPageReplyDTO;

@Service
public class MainPageService {

	@Autowired com.cafe.teria.dao.MainPageDAO dao;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ArrayList<com.cafe.teria.dto.MainPageDTO> mainSearch(
			String keyword, 
			int category, 
			String[] filterValues) {
		logger.info(keyword);
	
		// 20220112 검색시 날짜/시간 처리( +startDate, endDate, dayOfWeek )
		// 큰 흐름 : 검색시 시간 먼저 체크, diteCode로 끼니 구분시켜 놓고 날짜 사용해서 요일을 지정함
		// 넘기는 값은 시작날짜, 끝날짜, 현재요일과 끼니구분
				
				/*
				 * 날짜는 자바 8버전 이전에선 calender와 Date를 사용
				 * 8 버전 이후로는 LocalDate / LocalDateTime 를 사용
				 * https://cornswrold.tistory.com/489 => 날짜 차이 계산
				 * https://blog.leocat.kr/notes/2017/07/25/java-add-days => 날짜 더하고 빼기
				 */
				
				// 검색 버튼이 눌리면 검색어를 가지고 옴
				// 그 날이 어떤 요일, 어떤 시간인지 확인하고, 그 이후 메뉴만 불러옴
				// ex) 월요일 아침 => 월요일 점심부터 일요일 저녁까지
				// ex) 금요일 저녁 => 토요일 아침부터 다음주 목요일 저녁까지
				
				// 쿼리 방법
				// 1. 현재 날짜 / 시간을 가지고 db에 들어갈 때부터 보여줄 정보를 제한해서 쿼리.
				// v 2. 일단 쿼리 해놓고 날짜 / 시간에 맞춰서 노출만 ( 이걸로 일단 진행 )
				

				// 0. 날짜 계산 => 요일 계산을 위함
						LocalDate dateNow = LocalDate.now();		// 오늘 날짜
						// logger.info("날짜 : {}", dateNow);
						
				// 1. 시간 계산( 저녁 이후에 검색했을 때 처리 )
						LocalTime timeNow = LocalTime.now();		// 지금 시간
						logger.info("현재 시간 : {}", timeNow);
						
						// 끼니 구분할 변수( 1- 다음날 / 2- 점심부터 / 3- 저녁부터 / 4- 해당일전부 )
						int diteCode = 0;
						
						// 시간 비교 => https://codechacha.com/ko/java-compare-date-and-time/
						if(timeNow.isAfter(LocalTime.parse("20:00:00.001"))) {					// 현재 시간 20시 이후 검색일 경우
							diteCode = 4;	// 다음 날 아침부터
						}else if(timeNow.isAfter(LocalTime.parse("10:00:00.000")) 
										& timeNow.isBefore(LocalTime.parse("14:00:00.000"))) {	// 10시~14시 검색 시 조식을 제외
							diteCode = 2;	// 해당 일 점심부터
						}else if(timeNow.isAfter(LocalTime.parse("14:00:00.001")) 
										& timeNow.isBefore(LocalTime.parse("20:00:00.000"))) {	// 14시~20시 검색 시 점심까지 제외
							diteCode = 3;	// 해당 일 저녁부터
						}else {
							diteCode = 1;	// 해당 일 모든타임
						}
						
				// 3. 시작 날짜와 끝 날짜 계산
						LocalDate startDate;		// 시작 날짜 변수
						LocalDate endDate;			// 끝 날짜 변수
						
						switch(diteCode) {
							case 4:	// 8시 이후일 경우( 다음날부터 출력 )
								startDate = dateNow.plusDays(1);	// 오늘 날짜에 1을 더해서(내일부터)
								endDate = dateNow.plusDays(7);		// 오늘 날짜+7 의 일주일, 달 바뀌거나 윤달도 알아서 계산
								break;
							default:
								startDate = dateNow;				// 오늘 날짜부터	
								endDate = dateNow.plusDays(6);		// 일주일
								break;
						}
						
				// 4. 요일 계산
						int dayOfWeekValue = dateNow.getDayOfWeek().getValue();	// 오늘 요일 구분하기( 월요일(1) ~ 일요일(7)

						// 저녁 8시 이후 검색은 다음날부터 보이게
						if(diteCode==4) {			
							dayOfWeekValue += 1;
						}
						
						String dayOfWeek = null;	// 오늘 요일
						// 요일 switch
						switch(dayOfWeekValue) {
						case 1 : 
							dayOfWeek = "월요일";
							break;
						case 2 : 
							dayOfWeek = "화요일";
							break;
						case 3 : 
							dayOfWeek = "수요일";
							break;
						case 4 : 
							dayOfWeek = "목요일";
							break;
						case 5 : 
							dayOfWeek = "금요일";
							break;
						case 6 : 
							dayOfWeek = "토요일";
							break;
						case 7 : 
							dayOfWeek = "일요일";
							break;
						}		
						
						// 가지고 갈 값들 체크 : 시작날짜, 끝날짜, 현재 요일, 현재 시간 구분 코드
						// startDate, endDate, dayOfWeek, diteCode(1-모든시간, 2-점심부터, 3-저녁부터, 4-다음날부터)
						logger.info("시작날짜 찍어보기 : {}", startDate);
						logger.info("끝날짜 찍어보기 : {}", endDate);				
						logger.info("요일 찍어보기 : {}", dayOfWeek);
						logger.info("시간구분 찍어보기 : {}", diteCode);
					
				// 20220115 - 정렬기능 추가
						String searchSort = "";
						
						// category(기본값은 1), ajax로 2 or 3이 넘어오면 해당 컬럼을 기준으로 desc sort
						// String을 넘겼기 때문에 ${param4}에 " 가 추가되어있다. REPLACE 함수로 mapper에서 " 지워주는 작업.
						// https://graykang.tistory.com/25
						switch(category) {
						case 1: searchSort = "cafe_likecnt";
							break;
						case 2: searchSort = "cafe_hit";
							break;
						case 3: searchSort = "cafe_ratestaravg";
							break;
						}
						
						
				// 5. 검색 키워드, 시작/끝 날짜 보내서 일단 맞는거 전부 쿼리
					ArrayList<MainPageDTO> result = dao.mainSearchList(keyword, startDate, endDate, searchSort);

					// 쿼리 결과 확인
					logger.info("쿼리 결과 갯수 : {}", result.size());
					
					/*
					 * for (MainPageDTO mainPageDTO : result) { logger.info("여기서 확인 식당명 : {}",
					 * mainPageDTO.getCafe_title()); logger.info("날짜 : {}",
					 * mainPageDTO.getDiet_date()); logger.info("끼니구분 : {}",
					 * mainPageDTO.getDiet_code()); logger.info("좋아요 수 : {}",
					 * mainPageDTO.getCafe_likecnt()); }
					 */
						
				// 6. 현재 날짜, 시간 비교해서 아,점,저 필요없는거 지우기( 요일은 이미 2번에서 지우기 끝 )
					// 1. LocalDate 타입인 StartDate를 Date 타입으로 캐스팅 https://hianna.tistory.com/613
					Date startDateSql = java.sql.Date.valueOf(startDate);
						logger.info("startDate : {}", startDate);
						logger.info("startDateSql : {}", startDateSql);					
					
						
					// iterator 선언
					Iterator<com.cafe.teria.dto.MainPageDTO> iter = result.iterator();
					// iterator 한줄 담을 mainPageDTO 초기화
					MainPageDTO mainPageDTO = null;
					
					// 2. diteCode에 따라 해당 날짜 끼니 지우기
						if(diteCode==2) {		// 해당 날짜의 아침을 제외
						
							/*
							 int cnt = 0;
							 보통 for문 돌리는 것처럼 cnt를 두고 번호로 remove 하려고 했는데..
							 list를 이렇게 하면 지워진 index가 바로 처리가 되기 때문에 끝에서 빈공간이 발생하는 듯
							 list 삭제는 iterator 사용하기 https://jy2694.tistory.com/16
							*/
							while(iter.hasNext()) {
								// iterator로 next() 하며 한개씩 비교
								mainPageDTO = iter.next();
								
								if(mainPageDTO.getDiet_date() != null) {
									// compartTo( 같으면 0 / 앞이 크면 + / 뒤가 크면 - ) 
									if(mainPageDTO.getDiet_date().compareTo(startDateSql) == 0 &
											mainPageDTO.getDiet_code() == 1) {
										
										//logger.info("지워질 값 : {}", mainPageDTO.getDiet_date());
										iter.remove();
									}
								}
							}
						}else if(diteCode==3) {	// 해당 날짜의 아침, 점심 제외( 위에랑 diet_code빼고 같음 )
							iter = result.iterator();
							while(iter.hasNext()) {
								mainPageDTO = iter.next();
								
								if(mainPageDTO.getDiet_date() != null) {
									if(mainPageDTO.getDiet_date().compareTo(startDateSql) == 0 &
											mainPageDTO.getDiet_code() == 1) {
										
										logger.info("끼니에 의해 지워질 값 : {}", mainPageDTO.getDiet_date());
										iter.remove();
									}else if(mainPageDTO.getDiet_date().compareTo(startDateSql) == 0 &
											mainPageDTO.getDiet_code() == 2) {
										logger.info("끼니에 의해 지워질 값 : {}", mainPageDTO.getDiet_date());
										iter.remove();
									}
								}
							}
						}
					
					
					// 잘 지워졌나 확인
					if(result.size() >= 0) {
						for (MainPageDTO mainPageDTO1 : result) {
							logger.info("제거 후 식당명 : {}", mainPageDTO1.getCafe_title());
							logger.info("제거 후 날짜 : {}", mainPageDTO1.getDiet_date());
							logger.info("제거 후 끼니구분 : {}", mainPageDTO1.getDiet_code());
							logger.info("사진 : {}", mainPageDTO1.getBmem_image1());
							logger.info("지역 : {}", mainPageDTO1.getBmem_area_name());
							
						}
					}else {
						logger.info("전부 지워지고 없음");
					}
					
			
			
						
			// 7. 20220116 - 필터 사용했을 때
			if(filterValues != null) {
				if(filterValues.length > 0){
					// 배열 나누기 ( '/' 기준으로 다른 필터 )
					String[] filterDays = {};
					String[] filterDiet = {};
					String filterPriceString[] = {};
					int filterPrice = 0;
					String[] filterArea = {};
					
					// 자바 배열에선 indexOf 못써서 List로 https://technote-mezza.tistory.com/99
					logger.info("몇번째에 /가 있나요? : {}",Arrays.asList(filterValues).indexOf("/"));
					
					// Arrays.copyOfRange( 자를 배열, 시작 index, 끝 index( 어떤 문자열까지 자를건지 )
					// 요일 자르기
					filterDays = Arrays.copyOfRange(filterValues, 0 ,Arrays.asList(filterValues).indexOf("/"));
					filterValues = Arrays.copyOfRange(filterValues, Arrays.asList(filterValues).indexOf("/")+1, filterValues.length);
					for(int i=0; i<filterDays.length; i++) {
						logger.info("filterDays : {}", filterDays[i]);
					}
					// 끼니 자르기
					filterDiet = Arrays.copyOfRange(filterValues, 0, Arrays.asList(filterValues).indexOf("/"));
					filterValues = Arrays.copyOfRange(filterValues, Arrays.asList(filterValues).indexOf("/")+1, filterValues.length);
					
					// 20220117 Diet 아점저 => 123 캐스팅
					for(int i=0; i<filterDiet.length; i++) {
						if(filterDiet[i].equals("조(아침)")) {
							filterDiet[i] = "1";
						}else if(filterDiet[i].equals("중(점심)")) {
							filterDiet[i] = "2";
						}else if(filterDiet[i].equals("석(저녁)")) {
							filterDiet[i] = "3";
						}
					}
					
					
					// 가격 자르기
					filterPriceString = Arrays.copyOfRange(filterValues, 0, Arrays.asList(filterValues).indexOf("/"));
					filterValues = Arrays.copyOfRange(filterValues, Arrays.asList(filterValues).indexOf("/")+1, filterValues.length);
					filterPrice = Integer.parseInt(filterPriceString[0]);
					for(int i=0; i<filterPriceString.length; i++) {
						logger.info("filterPrice : {}", filterPriceString[i]);
					}					
					// 지역 자르기
					filterArea = Arrays.copyOfRange(filterValues, 0, Arrays.asList(filterValues).indexOf("/"));
					for(int i=0; i<filterArea.length; i++) {
						logger.info("filterArea : {}", filterArea[0]);
					}

					// 이진수 4자리(1111) 생각해서 4개 배열의 on/off 값 확인
					int filterCategory = 0;
					if(filterDays.length > 0) {	// 요일이 있다면
						filterCategory += 8;
					};
					if(filterDiet.length > 0) {	// 끼니 구분 있다면
						filterCategory += 4;
					};
					if(!filterPriceString[0].equals("12000")) {// 가격 정보가 있다면
						filterCategory += 2;
					}	
					if(filterArea.length > 0) {	// 지역 정보가 있다면
						filterCategory += 1;
					}
					
					logger.info("filterCategory : {}", filterCategory);
					
										
					// iterator 초기화
					iter = result.iterator();
					// iterator 한줄 담을 mainPageDTO 초기화
					mainPageDTO = null;

					boolean filterDaysChk = false;
					boolean filterDietChk = false;
					boolean filterPriceChk = false;
					boolean filterAreaChk = false;
					
					
					while(iter.hasNext()) {
						// iterator로 next() 하며 한개씩 비교
						mainPageDTO = iter.next();
						
						// 요일과 끼니가 비어있지 않으면 = 식당이 아니라 메뉴를 검색했다면( 20220117 => view단에서 필터 막는걸로 처리 )
						//if(mainPageDTO.getDiet_date_name() != null | mainPageDTO.getDiet_code() != 0) {	// code는 쿼리결과가 null 이면 0으로 떨어짐
						
						// 선택한 필터의 요일과 비교해보고, 쿼리 결과값에 해당 요일 or 끼니가 없다면
						// logger.info("요일 boolean : {}", Arrays.asList(filterValues).contains(mainPageDTO.getDiet_date_name()));
						// logger.info("끼니 boolean : {}", Arrays.asList(filterValues).contains(Integer.toString(mainPageDTO.getDiet_code())));
							
							filterDaysChk = Arrays.asList(filterDays).contains(mainPageDTO.getDiet_date_name());
							filterDietChk = Arrays.asList(filterDiet).contains(Integer.toString(mainPageDTO.getDiet_code()));
							filterPriceChk = filterPrice <= Integer.parseInt(mainPageDTO.getCafe_diet_price());
							filterAreaChk = Arrays.asList(filterArea).contains(mainPageDTO.getBmem_area_name());
							

							//logger.info("날짜 체크 : {}", filterDaysChk);
							//logger.info("끼니 체크 : {}", filterDietChk);
							//logger.info("가격 체크 : {}", filterPriceChk);
							logger.info("지역 체크 : {}", filterAreaChk);

							if(filterCategory == 8 | filterCategory == 4 | filterCategory == 2 | filterCategory == 1) {
						
								//20220117 가격 기본값이 8천원으로 박혀있어서 계속 PriceChk로 인해 true가 됐음 => 뷰에서 12000원으로 고정 	
								// 한개만 선택된 경우 / 아무것도 포함되지 않은 row를 지운다
								if(filterDaysChk | filterDietChk | filterPriceChk | filterAreaChk){
									// 찍힌 요일만 남기고 다른 데이터는 지우기
									logger.info("필터에 의해 선택된 값 : {}", mainPageDTO.getBmem_area_name());
									//logger.info("필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_code());
								}else {
									logger.info("필터에 의해 지워질 값 : {}", mainPageDTO.getBmem_area_name());
									//logger.info("필터에 의해 지워질 값 : {}", mainPageDTO.getDiet_code());
									iter.remove();
								}
								
							}else if(filterCategory == 12 | filterCategory == 10 | filterCategory == 9 | filterCategory == 6
									| filterCategory == 5 | filterCategory == 3){
								// 두개의 필터를 선택한 경우
								if(filterDaysChk & filterDietChk){
									//logger.info("이중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDaysChk & filterPriceChk){
									//logger.info("이중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDaysChk & filterAreaChk) {
									//logger.info("이중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDietChk & filterPriceChk) {
									//logger.info("이중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDietChk & filterAreaChk) {
									//logger.info("이중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterPriceChk & filterAreaChk) {
									//logger.info("이중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else {
									//logger.info("이중 필터에 의해 지워질 값 : {}", mainPageDTO.getDiet_date_name());
									iter.remove();
								}
								
								
							}else if(filterCategory == 14 | filterCategory == 13 | filterCategory == 11 | filterCategory == 7) {
								// 세개의 필터를 선택한 경우
								if(filterDaysChk & filterDietChk & filterPriceChk) {
									//logger.info("삼중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDaysChk & filterDietChk & filterAreaChk) {
									//logger.info("삼중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDaysChk & filterPriceChk & filterAreaChk) {
									//logger.info("삼중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else if(filterDietChk & filterPriceChk & filterAreaChk) {
									//logger.info("삼중 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else {
									//logger.info("삼중 필터에 의해 지워질 값 : {}", mainPageDTO.getDiet_date_name());
									iter.remove();
								}
								
								
							}else if(filterCategory == 15){
								// 모든 필터에 입력값이 있을 때
								if(filterDaysChk & filterDietChk & filterPriceChk & filterAreaChk) {
									//logger.info("모든 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_date_name());
								}else {
									//logger.info("모든 필터에 의해 지워질 값 : {}", mainPageDTO.getDiet_date_name());
									iter.remove();
								}
									
								
							}else {
								// 필터가 아무것도 없을 때
								logger.info("기본값");
							}
							
							
						
						
						//}
					}
						/* 끼니 필터 => 위 요일 필터에 병합
						// 끼니가 비어있지 않으면 => db select 에서 (식당명이 메뉴명이랑 같을 경우 ) null 값이 여기선 0이 된다
						if(mainPageDTO.getDiet_code() != 0) {
							if(Arrays.asList(filterValues).contains(mainPageDTO.getDiet_code())){
								// 찍힌 요일만 남기고 다른 데이터는 지우기
								logger.info("끼니 필터에 의해 선택된 값 : {}", mainPageDTO.getDiet_code());
							}else {
								logger.info("끼니 필터에 의해 지워질 값 : {}", mainPageDTO.getDiet_code());
								iter.remove();
							}
						}*/
						
					}
					
				}
		return result;
	}

	
	// 중복제거( 식당명 같은거 제거 ) => view 단에서 하려고 했는데 여기서 하는게 낫다
	// view에서 하려던 이유 => 필터 사용하려고 했는데 어차피 ajax 사용해야함
	public ArrayList<MainPageDTO> mainSearchDeDuplication(ArrayList<MainPageDTO> result) {
			// ArrayList 초기화 방법 => new로 객체화
			ArrayList<MainPageDTO> newResult = new ArrayList<MainPageDTO>();
			// 위 아침, 점심 제외 때 사용한 mainPageDTO iterator 초기화
// ****** DTO를 그냥 객체화 해서 써도 되나??
			MainPageDTO mainPageDTO = null;

			// 20220116 => 지금까지 있었던 mem_id 담을 arrayList 초기화
			ArrayList<String> checkList = new ArrayList<String>();
			
			// iterator
			Iterator<MainPageDTO> iter = result.iterator();
			
			// iterator로 result 돌면서 중복 아닌 것들 newResult에 담기
			while(iter.hasNext()) {
				// iterator로 next() 하며 한개씩 비교
				mainPageDTO = iter.next();
				
				// 20220116 => 중복 제거 방식을 다시( 지금까지는 첫번째것만 중복제거가 됐음 )
				// https://codechacha.com/ko/java-collections-arraylist-contains/
				// 처음 한개 삽입
				if(checkList.size()==0){
					// 비어있을 때 ArrayList 값 넣기
					newResult.add(0, mainPageDTO);
					
					// mem_id 비교를 위해 비교 list에 id 삽입
					checkList.add(mainPageDTO.getMem_id());
				}
				
				// 중복되지 않은 값 넣기
				if(!checkList.contains(mainPageDTO.getMem_id())) {
					newResult.add(mainPageDTO);
					
					checkList.add(mainPageDTO.getMem_id());
				}
				// 20220116
				
				
				logger.info("중복 삭제한 값 : {}", newResult);
			}
		
		return newResult;
	}
	

	// 댓글 전부
	public ArrayList<MainPageDTO> mainReplySearch(ArrayList<MainPageDTO> newResult) {

		// 7. 댓글 뽑아오기( 사진 포함여부 중요함 -> 메인페이지에서 띄울거거든 => sql문 추가 )
		// cafe, cafereply, replyphoto, replylike 테이블 순회해야함
		// cafe_idx가 같은 댓글 중 replylike가 높은 댓글을 cafereply에서 찾아서, replyphoto와 함께 가져옴
			// 1. 모든 식당에서 가장 좋아요가 높은 댓글을 뽑아서 온다( = 식당 갯수만큼 )
			ArrayList<MainPageReplyDTO> replyResult = dao.mainReplyList();
			
			// 2. 잘 뽑았는지 확인
			logger.info("댓글 검색 결과 수 : {}", replyResult.size());
				//	for (MainPageReplyDTO mainPageReplyDTO : replyResult) {
				//		logger.info("댓글 최대 추천추 : {}", mainPageReplyDTO.getMaxcnt());
				//		logger.info("불러온 카페 번호 : {}", mainPageReplyDTO.getCafe_idx());
				//	}
		
			// 3. newResult 돌면서 mem_id가 같은 값을 replyResult에서 찾고, 필드 매칭
			MainPageDTO mainPageDTO = null;
			MainPageReplyDTO mainPageReplyDTO = null;
			
			// newResult iterator
			Iterator<MainPageDTO> iter = newResult.iterator();
			
			logger.info("newResult 사이즈 : {}", newResult.size());
			
			
			// 4. iterator로 result 돌면서 중복 아닌 것들 newResult에 담기
			while(iter.hasNext()) {
				// iterator로 next() 하며 한개씩 비교
				mainPageDTO = iter.next();
					
				
				// 검색 결과 iterator next 할 때 마다 댓글을 위한 새로운 iterator 객체화 =>
				//		안해줬을 땐 밑에서 next() 했던 idx를 계속 가지고 있어서 마치 팩토리얼 처럼 됐음
				Iterator<MainPageReplyDTO> iterReply = replyResult.iterator();
				
				while(iterReply.hasNext()) {
					mainPageReplyDTO = iterReply.next();
					
					if(mainPageDTO.getCafe_idx() == mainPageReplyDTO.getCafe_idx()) {
						// 해당 카페 이름으로 찾아서 댓글 작성자와 시간, 내용을 set 해준다
						mainPageDTO.setReply_mem_id(mainPageReplyDTO.getMem_id());
						mainPageDTO.setCafereply_posttime(mainPageReplyDTO.getCafereply_posttime());
						mainPageDTO.setCafereply_modtime(mainPageReplyDTO.getCafereply_modtime());
						mainPageDTO.setCafereply_content(mainPageReplyDTO.getCafereply_content());
						
						logger.info("검색된 댓글 내용 : {}", mainPageDTO.getCafereply_content());
						break;
					}	
				}
			}			
		return newResult;
	}

	// ArrayList 정렬 폐기 => 정렬을 할땐 compareTo 인터페이스 implement 등이 필요함
	/*
	public HashMap<String, MainPageDTO> searchPageSort(ArrayList<MainPageDTO> lastResult, int category) {
		logger.info("값 갯수 : {}", lastResult.size());
		logger.info("카테고리 분류 : {} ", category);
		
		switch(category) {
		case 1:{	// 좋아요 순
			lastResult.stream().sorted(Comparator.comparing(MainPageDTO::getCafe_likecnt)).collect(Collectors.toList());
			logger.info("여기 잘 탔다");
			break;
		}
		case 2:{	// 조회 순
			lastResult.stream().sorted(Comparator.comparing(MainPageDTO::getCafe_hit)).collect(Collectors.toList());
			break;
		}
		case 3:{	// 별점 순
			lastResult.stream().sorted(Comparator.comparing(MainPageDTO::getCafe_ratestaravg)).collect(Collectors.toList());
			break;
		}
		}
		
		for (MainPageDTO mainPageDTO : lastResult) {
			logger.info("식당명 : {}", mainPageDTO.getCafe_title());
			logger.info("좋아요 : {}", mainPageDTO.getCafe_likecnt());
		}
		
		return null;
	}
	*/
	
	// 20220115 좋아요 순으로 정렬 - ArrayList를 HashMap으로 변환시키기
	public HashMap<String, Object> mainSearchSort(ArrayList<MainPageDTO> lastResult) {
		Iterator<MainPageDTO> iter = lastResult.iterator();
		// iterator 한줄 담을 mainPageDTO 초기화
		MainPageDTO mainPageDTO = null;
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// HashMap의 index가 될 녀석
		int cnt = 0;
		
		while(iter.hasNext()) {
			mainPageDTO = iter.next();
			
			resultMap.put(Integer.toString(cnt), mainPageDTO);
			
			cnt++;
			
			logger.info("마지막 확인 : {}", mainPageDTO.getCafe_diet_price());
		}
		
		// for loop (entrySet()) - Hashmap 내용 보기
		// https://hianna.tistory.com/573
		for (Entry<String, Object> res : resultMap.entrySet()) {
			logger.info("키 : {}",res.getKey());
			logger.info("값 : {}",res.getValue());
		}
		
		return resultMap;
	}


	// 20220117 - 반반 댓글 리뷰
	public ArrayList<MainPageReplyDTO> halfReply() {
		ArrayList<MainPageReplyDTO> halfResult = new ArrayList<MainPageReplyDTO>();
		
		halfResult = dao.halfReply();
		
		return halfResult;
	}

	// 20220117 - 포토 리뷰
	public ArrayList<MainPageReplyDTO> photoReply() {
		ArrayList<MainPageReplyDTO> photoResult = new ArrayList<MainPageReplyDTO>();
		
		photoResult = dao.photoReply();
		
		/*
		for (MainPageReplyDTO mainPageReplyDTO : photoResult) {
			logger.info("셔플 전 : {}",mainPageReplyDTO.getCafereply_content());
		}
		*/
		// 랜덤 돌리기
		Collections.shuffle(photoResult);
		/*
		for (MainPageReplyDTO mainPageReplyDTO : photoResult) {
			logger.info("셔플 후 : {}",mainPageReplyDTO.getCafereply_content());
		}
		*/
		
		// 위에서 3개만 끊기
		// iterator
		Iterator<MainPageReplyDTO> iter = photoResult.iterator();
		int chk = 0;
		//logger.info("포토리뷰 사이즈 : {}", photoResult.size());
		
		while(iter.hasNext()) {
			MainPageReplyDTO ease = iter.next();
			
			//logger.info("내용은? : {}", ease.getCafereply_content());
			
			if(chk>=3) {
				iter.remove();
			}
			
			chk += 1;
		}
		
		//logger.info("삭제 후 사이즈 : {}", photoResult.size());
		
		return photoResult;
	}
	
}
















