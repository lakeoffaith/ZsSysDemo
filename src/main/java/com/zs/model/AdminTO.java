package com.zs.model;

import java.io.Serializable;

public class AdminTO implements Serializable {
	
	private static final long serialVersionUID = -6207896383220737533L;
	
	private String adminId;
	private String username;
	private String password;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
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
}
