package com.zs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmployeeController extends BaseController {
	@RequestMapping("/index")
	@ResponseBody
	public String index(){
		if(logger.isDebugEnabled()){
			logger.debug("index");
		}
		return "nihao";
	}
}
