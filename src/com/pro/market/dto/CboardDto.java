package com.pro.market.dto;

import java.sql.Date;

public class CboardDto {
	private int cno;
	private String cid;
	private String ctitle;
	private String ccontent;
	private int cref;
	private int cre_step;
	private int cre_level;
	private Date crdate;
	public CboardDto() {}
	public CboardDto(int cno, String cid, String ctitle, String ccontent, int cref, int cre_step, int cre_level,
			Date crdate) {
		this.cno = cno;
		this.cid = cid;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.cref = cref;
		this.cre_step = cre_step;
		this.cre_level = cre_level;
		this.crdate = crdate;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public int getCref() {
		return cref;
	}
	public void setCref(int cref) {
		this.cref = cref;
	}
	public int getCre_step() {
		return cre_step;
	}
	public void setCre_step(int cre_step) {
		this.cre_step = cre_step;
	}
	public int getCre_level() {
		return cre_level;
	}
	public void setCre_level(int cre_level) {
		this.cre_level = cre_level;
	}
	public Date getCrdate() {
		return crdate;
	}
	public void setCrdate(Date crdate) {
		this.crdate = crdate;
	}
}
