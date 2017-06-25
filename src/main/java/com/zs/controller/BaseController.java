package com.zs.controller;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BaseController {
	protected Logger logger=LoggerFactory.getLogger(BaseController.class);
	
	protected String getCurrentUserName(){
		Subject subject = SecurityUtils.getSubject();
		String name=(String) subject.getPrincipal();
		return name;
	}
}
