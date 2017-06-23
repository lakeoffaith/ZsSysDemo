package com.zs.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmployeeController extends BaseController {
	@RequestMapping("/employee/index")
	@ResponseBody
	@RequiresPermissions(value="employee:list")
	public String tt(){
		if(logger.isDebugEnabled()){
			logger.debug("index");
		}
		return "nihao";
	}
}
