package com.zs.service;

import com.zs.model.Employee;

public interface EmployeeService extends BaseService<Employee> {
	public void insertBatch();
}
