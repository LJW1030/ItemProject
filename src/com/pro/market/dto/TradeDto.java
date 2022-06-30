package com.pro.market.dto;

public class TradeDto {

	private int bno;
	private String sid;
	private String bid;
	private String btitle;
	public TradeDto() {	}
	public TradeDto(int bno, String sid, String bid, String btitle) {
		this.bno = bno;
		this.sid = sid;
		this.bid = bid;
		this.btitle = btitle;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
}
