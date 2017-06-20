package com.zs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.model.Employee;
import com.zs.service.EmployeeService;

import tk.mybatis.mapper.common.Mapper;

@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee> implements EmployeeService {
	
	public Mapper<Employee> mapper;
	
    //这句必须要加上。不然会报异常，因为在实际掉用的时候不是BaseDao调用  
	@Autowired
	@Override
	protected void setMapper(Mapper<Employee> mapper) {
		super.mapper=mapper;
		super.keyName="info";
		this.mapper=mapper;
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

}
