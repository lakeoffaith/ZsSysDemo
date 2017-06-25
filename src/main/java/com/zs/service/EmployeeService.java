package com.zs.service;

import java.util.List;

import com.zs.model.Employee;
import com.zs.model.Resource;

public interface EmployeeService extends BaseService<Employee> {
	public void insertBatch();


	public Employee findUserByLoginName(String userName);


	public List<String> findRolesByLoginName(String currentUsername);


	public List<String> findPermissonsByLoginName(String currentUsername);
	
	public List<Resource> findResourcesByLoginName(String currentUsername);
}
