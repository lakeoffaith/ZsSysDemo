package com.zs.service;

import com.zs.model.Employee;

import java.util.List;

public interface EmployeeService  {

	public Employee findUserByLoginName(String userName);


	public List<String> findRolesByLoginName(String currentUsername);


	public List<String> findPermissonsByLoginName(String currentUsername);
	
}
