package com.zs.mapper;

import com.zs.model.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
public interface EmployeeMapper  {
	public List<Employee> selectByLoginName(@Param("userName")String userName);

	public List<String> findRolesByLoginName( @Param("currentUsername") String currentUsername);

	public List<String> findPermissonsByLoginName(String currentUsername);
	
}
