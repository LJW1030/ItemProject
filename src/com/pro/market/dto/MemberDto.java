package com.pro.market.dto;

import java.sql.Date;

public class MemberDto {
	private String mid;
	private String mpw;
	private String mname;
	private String mtel;
	private String memail;
	private String maddress;
	private Date mbirth;
	private String mgender;
	private String mgrade;
	public MemberDto() {}
	public MemberDto(String mid, String mpw, String mname, String mtel, String memail, String maddress, Date mbirth,
			String mgender, String mgrade) {
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mtel = mtel;
		this.memail = memail;
		this.maddress = maddress;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.mgrade = mgrade;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMgrade() {
		return mgrade;
	}
	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mtel=" + mtel + ", memail=" + memail
				+ ", maddress=" + maddress + ", mbirth=" + mbirth + ", mgender=" + mgender + ", mgrade=" + mgrade + "]";
	}
}
