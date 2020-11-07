package com.testweb.user.model;

import java.sql.Timestamp;

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private int phoneNumber;
	private String email;
	private String basicAddress;
	private String detailAddress;
	private Timestamp regdate;
	
	public UserVO() {
	}

	public UserVO(String id, String pw, String name, int phoneNumber, String email, String basicAddress,
			String detailAddress, Timestamp regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.basicAddress = basicAddress;
		this.detailAddress = detailAddress;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBasicAddress() {
		return basicAddress;
	}

	public void setBasicAddress(String basicAddress) {
		this.basicAddress = basicAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	

}
