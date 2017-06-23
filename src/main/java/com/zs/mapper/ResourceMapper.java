package com.zs.mapper;

import org.springframework.stereotype.Component;

import com.zs.model.Resource;

import tk.mybatis.mapper.common.Mapper;
@Component(value="resourceMapper")
public interface ResourceMapper extends Mapper<Resource> {
}
