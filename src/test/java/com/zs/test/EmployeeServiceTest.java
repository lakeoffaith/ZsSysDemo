package com.zs.test;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.zs.model.Employee;
import com.zs.service.EmployeeService;

public class EmployeeServiceTest extends BaseServiceTest{
	@Autowired
	public EmployeeService employeeService;
	
	public void findAll(){
		RowBounds rowBounds=new RowBounds(0, 10);
		List<Employee> findAll = employeeService.findAll(rowBounds);
		for (Employee employee : findAll) {
			System.out.println(employee);
		}
		Assert.assertTrue(findAll.size()>0);
	}
	/**
	 * 测试事物配置
	 */
	//@Test
	public void insertBatch(){
		employeeService.insertBatch();
	}


	/**
	 * 
	 */
	
	public void findPasswordByLoginName(){
		Employee u = employeeService.findUserByLoginName("zuzhang");
		Assert.assertTrue(u.getPassword().equals("12345"));
	}
	
	@Test
	public void findRolesByLoginName(){
		List<String> findRolesByLoginName = employeeService.findRolesByLoginName("zuzhang");
		System.out.println(findRolesByLoginName);
		Assert.assertTrue(findRolesByLoginName.size()>0);
	}
	
	@Test
	public void findPermissonsByLoginName(){
		List<String> findRolesByLoginName = employeeService.findPermissonsByLoginName("zuzhang");
		System.out.println(findRolesByLoginName);
		Assert.assertTrue(findRolesByLoginName.size()>0);
	}
	
}
