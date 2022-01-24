package com.cafe.teria.dto;

import java.sql.Date;

public class MainPageDTO {

	private int cafe_idx;					// 글번호
	private Date cafe_posttime;				// 작성시간
	private Date cafe_modtime;				// 수정시간
	private String cafe_title;				// 식당명
	private String cafe_content;			// 내용
	private int cafe_hit;					// 조회수
	private int cafe_likecnt;				// 좋아요수
	private int cafe_replycnt;				// 댓글수
	private int cafe_photoex;				// 사진 여부
	private int cafe_poststat;				// 게시글 상태(블라 or 삭제)
	private float cafe_ratestaravg;			// 평균 별점
	private String cafe_comment;			// 한마디
	private int cafe_fix;					// 글 고정여부
	private String mem_bcode;				// 업주코드
	private String cafe_diet_price;			// 가격
	private String mem_id;					// 작성자 아이디
	//private String boardphoto_idx;			// 사진 파일 번호 => 외래키 잘못 연결(20220112) 
	
	// outer join으로 같이 긁어온 데이터
	private String bmem_area_name;			// bmember에서 받아온 주소
	private String bmem_image1;				// 대표 이미지 1
	
	private Date diet_date;					// 날짜 구분
	private int diet_code;					// 끼니 구분
	private String diet_date_name;			// 요일
	
	
	// 댓글 추가 row => 원래 쿼리문에서 한번에 받았어야 했나??
	//private int cafereply_idx;
	private Date cafereply_posttime;
	private Date cafereply_modtime;
	private String cafereply_content;
	private int cafereply_likecnt;
	//private int cafereply_stat;
	//private int cafereply_rewritechk;
	//private int cafe_idx;
	private String reply_mem_id;		// 댓글 작성자는 다른 필드로 받는다( db내에선 같음 )
	//private int maxcnt;
	/*
	 * 이미 DTO에 있는 필드들이나 뿌려줄 때 필요하지 않은 필드들 주석처리
	 */
	
	// 20220123 - 멤버 닉네임 추가( member테이블 조인 ) => 필요없었음( 답글 닉네임이 필요 )
	private String reply_mem_nick;
	public String getReply_mem_nick() {
		return reply_mem_nick;
	}
	public void setReply_mem_nick(String reply_mem_nick) {
		this.reply_mem_nick = reply_mem_nick;
	}
	
	
	// 20220123
	
	
	
	
	
	
	public int getCafe_idx() {
		return cafe_idx;
	}
	public int getCafereply_likecnt() {
		return cafereply_likecnt;
	}
	public void setCafereply_likecnt(int cafereply_likecnt) {
		this.cafereply_likecnt = cafereply_likecnt;
	}
	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}
	public Date getCafe_posttime() {
		return cafe_posttime;
	}
	public void setCafe_posttime(Date cafe_posttime) {
		this.cafe_posttime = cafe_posttime;
	}
	public Date getCafe_modtime() {
		return cafe_modtime;
	}
	public void setCafe_modtime(Date cafe_modtime) {
		this.cafe_modtime = cafe_modtime;
	}
	public String getCafe_title() {
		return cafe_title;
	}
	public void setCafe_title(String cafe_title) {
		this.cafe_title = cafe_title;
	}
	public String getCafe_content() {
		return cafe_content;
	}
	public void setCafe_content(String cafe_content) {
		this.cafe_content = cafe_content;
	}
	public int getCafe_hit() {
		return cafe_hit;
	}
	public void setCafe_hit(int cafe_hit) {
		this.cafe_hit = cafe_hit;
	}
	public int getCafe_likecnt() {
		return cafe_likecnt;
	}
	public void setCafe_likecnt(int cafe_likecnt) {
		this.cafe_likecnt = cafe_likecnt;
	}
	public int getCafe_replycnt() {
		return cafe_replycnt;
	}
	public void setCafe_replycnt(int cafe_replycnt) {
		this.cafe_replycnt = cafe_replycnt;
	}
	public int getCafe_photoex() {
		return cafe_photoex;
	}
	public void setCafe_photoex(int cafe_photoex) {
		this.cafe_photoex = cafe_photoex;
	}
	public int getCafe_poststat() {
		return cafe_poststat;
	}
	public void setCafe_poststat(int cafe_poststat) {
		this.cafe_poststat = cafe_poststat;
	}
	public float getCafe_ratestaravg() {
		return cafe_ratestaravg;
	}
	public void setCafe_ratestaravg(float cafe_ratestaravg) {
		this.cafe_ratestaravg = cafe_ratestaravg;
	}
	public String getCafe_comment() {
		return cafe_comment;
	}
	public void setCafe_comment(String cafe_comment) {
		this.cafe_comment = cafe_comment;
	}
	public int getCafe_fix() {
		return cafe_fix;
	}
	public void setCafe_fix(int cafe_fix) {
		this.cafe_fix = cafe_fix;
	}
	public String getMem_bcode() {
		return mem_bcode;
	}
	public void setMem_bcode(String mem_bcode) {
		this.mem_bcode = mem_bcode;
	}
	public String getCafe_diet_price() {
		return cafe_diet_price;
	}
	public void setCafe_diet_price(String cafe_diet_price) {
		this.cafe_diet_price = cafe_diet_price;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	/*
	 * 20220112 - 외래키 잘못 적용되어 있던 부분 변경( 반대로 연결 )
	public int getBoardphoto_idx() {
		return boardphoto_idx;
	}
	public void setBoardphoto_idx(int boardphoto_idx) {
		this.boardphoto_idx = boardphoto_idx;
	}
	*/
	
	public String getBmem_area_name() {
		return bmem_area_name;
	}
	public void setBmem_area_name(String bmem_area_name) {
		this.bmem_area_name = bmem_area_name;
	}
	public Date getDiet_date() {
		return diet_date;
	}
	public void setDiet_date(Date diet_date) {
		this.diet_date = diet_date;
	}
	public int getDiet_code() {
		return diet_code;
	}
	public void setDiet_code(int diet_code) {
		this.diet_code = diet_code;
	}
	public String getDiet_date_name() {
		return diet_date_name;
	}
	public void setDiet_date_name(String diet_date_name) {
		this.diet_date_name = diet_date_name;
	}
	public String getBmem_image1() {
		return bmem_image1;
	}
	public void setBmem_image1(String bmem_image1) {
		this.bmem_image1 = bmem_image1;
	}
	public Date getCafereply_posttime() {
		return cafereply_posttime;
	}
	public void setCafereply_posttime(Date cafereply_posttime) {
		this.cafereply_posttime = cafereply_posttime;
	}
	public Date getCafereply_modtime() {
		return cafereply_modtime;
	}
	public void setCafereply_modtime(Date cafereply_modtime) {
		this.cafereply_modtime = cafereply_modtime;
	}
	public String getCafereply_content() {
		return cafereply_content;
	}
	public void setCafereply_content(String cafereply_content) {
		this.cafereply_content = cafereply_content;
	}
	public String getReply_mem_id() {
		return reply_mem_id;
	}
	public void setReply_mem_id(String reply_mem_id) {
		this.reply_mem_id = reply_mem_id;
	}
	
	
	
	
	
}
