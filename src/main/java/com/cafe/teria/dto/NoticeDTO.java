package com.cafe.teria.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	
	private int notice_idx;
	private Timestamp notice_posttime;
	private String mem_id;
	private Timestamp notice_modtime;//수정시간
	private String update_mem_id;
	private String notice_title;
	/* private String notice_photoex; */
	/* private String post_stat; */
	private int notice_hit;
	
	
	public int getNotice_hit() {
		return notice_hit;
	}
	
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	private String notice_fix;
	private String notice_content;
	
	
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public Timestamp getNotice_posttime() {
		return notice_posttime;
	}
	public void setNotice_posttime(Timestamp notice_posttime) {
		this.notice_posttime = notice_posttime;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Timestamp getNotice_modtime() {
		return notice_modtime;
	}
	public void setNotice_modtime(Timestamp notice_modtime) {
		this.notice_modtime = notice_modtime;
	}
	public String getUpdate_mem_id() {
		return update_mem_id;
	}
	public void setUpdate_mem_id(String update_mem_id) {
		this.update_mem_id = update_mem_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_fix() {
		return notice_fix;
	}
	public void setNotice_fix(String notice_fix) {
		this.notice_fix = notice_fix;
	}
	
	
	
}
