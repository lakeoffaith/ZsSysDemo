package com.zs.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import com.zs.model.Employee;

import tk.mybatis.mapper.common.Mapper;
@Component(value="roleMapper")
public interface RoleMapper extends Mapper<Employee> {
}
