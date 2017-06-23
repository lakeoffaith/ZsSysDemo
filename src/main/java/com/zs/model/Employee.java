package com.zs.model;

public class Employee {
	private Long id;
	private String name;
	private String loginName;
	private String password;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", loginName=" + loginName + ", password=" + password + "]";
	}
	public static Employee getNewInstanceByLoginName(String userName) {
		Employee e=new Employee();
		e.setLoginName(userName);
		return e;
	}
	
}
