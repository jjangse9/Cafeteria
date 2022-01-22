package com.cafe.teria.dto;

import java.sql.Date;

public class MyBoardDTO {
	
	

	
	
	private int blame_idx;
	private String blame_title;
	private String content;
	private Date blame_posttime;
	private int blame_confirm;
	private String blame_answer;
	private int blame_cnt;
	private String mem_id;
	private int cafe_idx;
	private int cafereply_idx;
	private int recomment_idx;

//	이게 들어가는게 맞는가?
	private String cafe_title;
	private int cafe_hit;
	
	
	
	
	
	
	public int getBlame_idx() {
		return blame_idx;
	}
	public void setBlame_idx(int blame_idx) {
		this.blame_idx = blame_idx;
	}
	public String getBlame_title() {
		return blame_title;
	}
	public void setBlame_title(String blame_title) {
		this.blame_title = blame_title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getBlame_posttime() {
		return blame_posttime;
	}
	public void setBlame_posttime(Date blame_posttime) {
		this.blame_posttime = blame_posttime;
	}
	public int getBlame_confirm() {
		return blame_confirm;
	}
	public void setBlame_confirm(int blame_confirm) {
		this.blame_confirm = blame_confirm;
	}
	public String getBlame_answer() {
		return blame_answer;
	}
	public void setBlame_answer(String blame_answer) {
		this.blame_answer = blame_answer;
	}
	public int getBlame_cnt() {
		return blame_cnt;
	}
	public void setBlame_cnt(int blame_cnt) {
		this.blame_cnt = blame_cnt;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCafe_idx() {
		return cafe_idx;
	}
	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}
	public int getCafereply_idx() {
		return cafereply_idx;
	}
	public void setCafereply_idx(int cafereply_idx) {
		this.cafereply_idx = cafereply_idx;
	}
	public int getRecomment_idx() {
		return recomment_idx;
	}
	public void setRecomment_idx(int recomment_idx) {
		this.recomment_idx = recomment_idx;
	}
	public String getCafe_title() {
		return cafe_title;
	}
	public void setCafe_title(String cafe_title) {
		this.cafe_title = cafe_title;
	}
	public int getCafe_hit() {
		return cafe_hit;
	}
	public void setCafe_hit(int cafe_hit) {
		this.cafe_hit = cafe_hit;
	}
	
	
	
	
	
	

}