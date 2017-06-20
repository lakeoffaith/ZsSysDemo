package com.zs.test;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.zs.common.config.Global;
import com.zs.model.Employee;
import com.zs.service.EmployeeService;

public class EmployeeServiceTest extends BaseServiceTest{
	@Autowired
	public EmployeeService employeeService;
	
	@Test
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
	@Test
	public void insertBatch(){
		employeeService.insertBatch();
	}

	
	/**
	 * 测试 utils
	 */
	@Test
	public void getConfig(){
		String config = Global.getConfig("adminPath");
		Assert.assertTrue(config.equals("ZsSys"));
	}
}
