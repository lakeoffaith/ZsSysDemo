package com.zs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.mapper.EmployeeMapper;
import com.zs.model.Employee;
import com.zs.service.EmployeeService;

import tk.mybatis.mapper.common.Mapper;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements EmployeeService {
	
	public EmployeeMapper employeeMapper;
	
    //这句必须要加上。不然会报异常，因为在实际掉用的时候不是BaseDao调用  
	@Autowired
	@Override
	protected void setMapper(Mapper<Employee> employeeMapper) {
		super.mapper=employeeMapper;
		super.keyName="info";
		this.employeeMapper=(EmployeeMapper) employeeMapper;
	}
	
	@Transactional
	public void insertBatch() {
		Employee info=new Employee();
		info.setName("nihao");
		mapper.insert(info);
		System.out.println(1/0);
		Employee info2=new Employee();
		info.setName("nihao2");
		mapper.insert(info2);
	}

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
