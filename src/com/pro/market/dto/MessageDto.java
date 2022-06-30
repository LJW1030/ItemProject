package com.pro.market.dto;

import java.sql.Date;

public class MessageDto {
	private int eno;
	private String sendId;
	private String getId;
	private String etitle;
	private String econtent;
	private Date erdate;
	public MessageDto() {}
	public MessageDto(int eno, String sendId, String getId, String etitle, String econtent, Date erdate) {
		this.eno = eno;
		this.sendId = sendId;
		this.getId = getId;
		this.etitle = etitle;
		this.econtent = econtent;
		this.erdate = erdate;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getGetId() {
		return getId;
	}
	public void setGetId(String getId) {
		this.getId = getId;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public Date getErdate() {
		return erdate;
	}
	public void setErdate(Date erdate) {
		this.erdate = erdate;
	}
}
