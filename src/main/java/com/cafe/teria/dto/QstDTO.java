package com.cafe.teria.dto;

import java.sql.Date;

public class QstDTO {
	private int qst_idx;
	private String qst_title;
	private String qst_content;
	private Date qst_posttime;
	private int qst_stat;
	private String qst_answer;
	private String mem_id;
	
	public int getQst_idx() {
		return qst_idx;
	}
	public void setQst_idx(int qst_idx) {
		this.qst_idx = qst_idx;
	}
	public String getQst_title() {
		return qst_title;
	}
	public void setQst_title(String qst_title) {
		this.qst_title = qst_title;
	}
	public String getQst_content() {
		return qst_content;
	}
	public void setQst_content(String qst_content) {
		this.qst_content = qst_content;
	}
	public Date getQst_posttime() {
		return qst_posttime;
	}
	public void setQst_posttime(Date qst_posttime) {
		this.qst_posttime = qst_posttime;
	}
	public int getQst_stat() {
		return qst_stat;
	}
	public void setQst_stat(int qst_stat) {
		this.qst_stat = qst_stat;
	}
	public String getQst_answer() {
		return qst_answer;
	}
	public void setQst_answer(String qst_answer) {
		this.qst_answer = qst_answer;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	
}
