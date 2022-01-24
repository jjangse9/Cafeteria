package com.cafe.teria.dto;

import java.sql.Date;

// 20220114 서치페이지
public class MainPageReplyDTO {
	private int cafereply_idx;
	private Date cafereply_posttime;
	private Date cafereply_modtime;
	private String cafereply_content;
	private int cafereply_likecnt;
	private float cafereply_ratestar;
	private int cafereply_stat;
	private int cafereply_rewritechk;
	private int cafe_idx;
	
	// 반반 댓글에서 사진 보여주기 위해
	private String replyphoto_oriname;
	private String replyphoto_newname;

	private String mem_id;
	private int maxcnt;
	
	
	// 20220123 답글 닉네임으로 표시!
	private String mem_nick;
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	
	
	
	
	
	
	
	public int getCafereply_idx() {
		return cafereply_idx;
	}
	public void setCafereply_idx(int cafereply_idx) {
		this.cafereply_idx = cafereply_idx;
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
	public int getCafereply_likecnt() {
		return cafereply_likecnt;
	}
	public void setCafereply_likecnt(int cafereply_likecnt) {
		this.cafereply_likecnt = cafereply_likecnt;
	}
	public float getCafereply_ratestar() {
		return cafereply_ratestar;
	}
	public void setCafereply_ratestar(float cafereply_ratestar) {
		this.cafereply_ratestar = cafereply_ratestar;
	}
	public int getCafereply_stat() {
		return cafereply_stat;
	}
	public void setCafereply_stat(int cafereply_stat) {
		this.cafereply_stat = cafereply_stat;
	}
	public int getCafereply_rewritechk() {
		return cafereply_rewritechk;
	}
	public void setCafereply_rewritechk(int cafereply_rewritechk) {
		this.cafereply_rewritechk = cafereply_rewritechk;
	}
	public int getCafe_idx() {
		return cafe_idx;
	}
	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMaxcnt() {
		return maxcnt;
	}
	public void setMaxcnt(int maxcnt) {
		this.maxcnt = maxcnt;
	}
	public String getReplyphoto_oriname() {
		return replyphoto_oriname;
	}
	public void setReplyphoto_oriname(String replyphoto_oriname) {
		this.replyphoto_oriname = replyphoto_oriname;
	}
	public String getReplyphoto_newname() {
		return replyphoto_newname;
	}
	public void setReplyphoto_newname(String replyphoto_newname) {
		this.replyphoto_newname = replyphoto_newname;
	}
	
	
	
}
