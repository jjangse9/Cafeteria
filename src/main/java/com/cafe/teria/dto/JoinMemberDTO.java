package com.cafe.teria.dto;

import java.sql.Date;

public class JoinMemberDTO {
	
	

	private String mem_id;
	private String mem_pw;
	private String mem_pwchk;
	private String mem_nick;
	private int mem_stat;
	private Date mem_regidate;
	private Date mem_leftdate;
	private String mem_emailchk;
	private String mem_bcode;
	private int mem_grade;
	private String mem_perm_yn;
	private Date mem_perm_date;
	
	
	
	// icon 테이블
	   private String icon_oriname;
	   private String icon_newname;
	
	
	
	
	
	   public String getIcon_oriname() {
		      return icon_oriname;
		   }
		   public void setIcon_oriname(String icon_oriname) {
		      this.icon_oriname = icon_oriname;
		   }
		   public String getIcon_newname() {
		      return icon_newname;
		   }
		   public void setIcon_newname(String icon_newname) {
		      this.icon_newname = icon_newname;
		   }
	
	
	
	
	
	
	
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_pwchk() {
		return mem_pwchk;
	}
	public void setMem_pwchk(String mem_pwchk) {
		this.mem_pwchk = mem_pwchk;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public int getMem_stat() {
		return mem_stat;
	}
	public void setMem_stat(int mem_stat) {
		this.mem_stat = mem_stat;
	}
	public Date getMem_regidate() {
		return mem_regidate;
	}
	public void setMem_regidate(Date mem_regidate) {
		this.mem_regidate = mem_regidate;
	}
	public Date getMem_leftdate() {
		return mem_leftdate;
	}
	public void setMem_leftdate(Date mem_leftdate) {
		this.mem_leftdate = mem_leftdate;
	}
	public String getMem_emailchk() {
		return mem_emailchk;
	}
	public void setMem_emailchk(String mem_emailchk) {
		this.mem_emailchk = mem_emailchk;
	}
	public String getMem_bcode() {
		return mem_bcode;
	}
	public void setMem_bcode(String mem_bcode) {
		this.mem_bcode = mem_bcode;
	}
	public int getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(int mem_grade) {
		this.mem_grade = mem_grade;
	}
	public String getMem_perm_yn() {
		return mem_perm_yn;
	}
	public void setMem_perm_yn(String mem_perm_yn) {
		this.mem_perm_yn = mem_perm_yn;
	}
	public Date getMem_perm_date() {
		return mem_perm_date;
	}
	public void setMem_perm_date(Date mem_perm_date) {
		this.mem_perm_date = mem_perm_date;
	}
	
	
	
	

}
