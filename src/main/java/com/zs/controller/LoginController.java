package com.zs.controller;

import com.google.gson.Gson;
import com.zs.model.AdminTO;
import com.zs.model.ResponseCodeTO;
import com.zs.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/auth")
public class LoginController  {
	@Resource
	private EmployeeService employeeService;

	@Resource
	private Gson gson;

	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request,
						@RequestParam(value = "username", required = true) String username,
						@RequestParam(value = "password", required = true) String password
	){
		AdminTO adminTO = new AdminTO();
		adminTO.setUsername(username);
		adminTO.setPassword(password);
//		AdminTO adminTO=adminService.getAdminTO(username, password);
//		if(adminTO==null){
//			return ResponseCode.LOGIN_ERROR;
//		}
//		userTracker.rememberAdminTO(request, adminTO,redisManager);
		return gson.toJson(new ResponseCodeTO(adminTO));
	}

}
