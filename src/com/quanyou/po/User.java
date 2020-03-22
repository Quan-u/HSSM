package com.quanyou.po;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String realname;
	private String username;
	private String password;
	private String phone;
	private String email;
	private String sex;
	private String address;
	private Timestamp  registerTime;// 注册时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Timestamp  registerTime) {
		this.registerTime = registerTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", realname=" + realname + ", username="
				+ username + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", sex=" + sex + ", address=" + address
				+ ", registerTime=" + registerTime + "]";
	}

	
	
	
}
