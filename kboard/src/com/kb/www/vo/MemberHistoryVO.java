package com.kb.www.vo;

public class MemberHistoryVO {
	private int sq;
	private int mb_sq;
	private int evt_type;
	private String dttm;
	private String name;
	private String email;
	private String gender;

	public int getSq() {
		return sq;
	}

	public void setSq(int sq) {
		this.sq = sq;
	}

	public int getMb_sq() {
		return mb_sq;
	}

	public void setMb_sq(int mb_sq) {
		this.mb_sq = mb_sq;
	}

	public int getEvt_type() {
		return evt_type;
	}

	public void setEvt_type(int evt_type) {
		this.evt_type = evt_type;
	}

	public String getDttm() {
		return dttm;
	}

	public void setDttm(String dttm) {
		this.dttm = dttm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
