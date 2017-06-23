package com.zs.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zs.model.Employee;

import tk.mybatis.mapper.common.Mapper;
@Component(value="employeeMapper")
public interface EmployeeMapper extends Mapper<Employee> {
	public List<Employee> selectByLoginName(String userName);

	public List<String> findRolesByLoginName(String currentUsername);

	public List<String> findPermissonsByLoginName(String currentUsername);
}
