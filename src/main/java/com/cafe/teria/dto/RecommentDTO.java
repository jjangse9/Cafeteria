package com.cafe.teria.dto;

import java.sql.Timestamp;

public class RecommentDTO {

	private int recomment_idx;
	private Timestamp recomment_posttime;
	private Timestamp recomment_modtime;
	private String recomment_content;
	private int recomment_stat;
	private int recomment_rewritechk;
	private int recomment_likecnt;
	private String mem_id;
	private int cafereply_idx;
	private int cafe_idx;
	private String mem_nick;
	
	
	
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public int getRecomment_idx() {
		return recomment_idx;
	}
	public void setRecomment_idx(int recomment_idx) {
		this.recomment_idx = recomment_idx;
	}
	public Timestamp getRecomment_posttime() {
		return recomment_posttime;
	}
	public void setRecomment_posttime(Timestamp recomment_posttime) {
		this.recomment_posttime = recomment_posttime;
	}
	public Timestamp getRecomment_modtime() {
		return recomment_modtime;
	}
	public void setRecomment_modtime(Timestamp recomment_modtime) {
		this.recomment_modtime = recomment_modtime;
	}
	public String getRecomment_content() {
		return recomment_content;
	}
	public void setRecomment_content(String recomment_content) {
		this.recomment_content = recomment_content;
	}
	public int getRecomment_stat() {
		return recomment_stat;
	}
	public void setRecomment_stat(int recomment_stat) {
		this.recomment_stat = recomment_stat;
	}
	public int getRecomment_rewritechk() {
		return recomment_rewritechk;
	}
	public void setRecomment_rewritechk(int recomment_rewritechk) {
		this.recomment_rewritechk = recomment_rewritechk;
	}
	public int getRecomment_likecnt() {
		return recomment_likecnt;
	}
	public void setRecomment_likecnt(int recomment_likecnt) {
		this.recomment_likecnt = recomment_likecnt;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCafereply_idx() {
		return cafereply_idx;
	}
	public void setCafereply_idx(int cafereply_idx) {
		this.cafereply_idx = cafereply_idx;
	}
	public int getCafe_idx() {
		return cafe_idx;
	}
	public void setCafe_idx(int cafe_idx) {
		this.cafe_idx = cafe_idx;
	}
	
	
	
	
	
	
}
