package com.zs.service.impl;

import com.zs.mapper.EmployeeMapper;
import com.zs.model.Employee;
import com.zs.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl  implements EmployeeService {

	@Resource
	private EmployeeMapper employeeMapper;


	@Override
	public Employee findUserByLoginName(String userName) {
		System.out.println(employeeMapper);
		List<Employee> e=employeeMapper.selectByLoginName(userName);
		System.out.println(e);
		if(e!=null && e.size()==1){
			return e.get(0);
		}
		return null;
	}

	@Override
	public List<String> findRolesByLoginName(String currentUsername) {
		
		return employeeMapper.findRolesByLoginName(currentUsername);
	}

	@Override
	public List<String> findPermissonsByLoginName(String currentUsername) {
		return employeeMapper.findPermissonsByLoginName(currentUsername);
	}



}
