package com.pro.market.dto;

import java.sql.Date;

public class BoardDto {
	private int bno;
	private String mid;
	private String bbs;
	private String game;
	private String btitle;
	private int bcost;
	private String bCname;
	private String bcontent;
	private String bphoto;
	private Date brdate;
	public BoardDto() {}
	public BoardDto(int bno, String mid, String bbs, String game, String btitle, int bcost,
			String bCname, String bcontent, String bphoto, Date brdate) {
		this.bno = bno;
		this.mid = mid;
		this.bbs = bbs;
		this.game = game;
		this.btitle = btitle;
		this.bcost = bcost;
		this.bCname = bCname;
		this.bcontent = bcontent;
		this.bphoto = bphoto;
		this.brdate = brdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getBbs() {
		return bbs;
	}
	public void setBbs(String bbs) {
		this.bbs = bbs;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public int getBcost() {
		return bcost;
	}
	public void setBcost(int bcost) {
		this.bcost = bcost;
	}
	public String getbCname() {
		return bCname;
	}
	public void setbCname(String bCname) {
		this.bCname = bCname;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBphoto() {
		return bphoto;
	}
	public void setBphoto(String bphoto) {
		this.bphoto = bphoto;
	}
	public Date getBrdate() {
		return brdate;
	}
	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", mid=" + mid + ", bbs=" + bbs + ", game=" + game + ", btitle=" + btitle
				+ ", bcost=" + bcost + ", bCname=" + bCname + ", bcontent=" + bcontent + ", bphoto=" + bphoto
				+ ", brdate=" + brdate + "]";
	}
	
	
}
