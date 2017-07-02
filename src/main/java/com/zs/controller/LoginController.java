package com.zs.controller;

import com.zs.service.EmployeeService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/login")
public class LoginController  {
	@Resource
	private EmployeeService employeeService;

	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		System.out.println("index");
		//查找当前用户的所有menusResource

		return "index";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		System.out.println("get login");
		return "login";
	}
	@RequestMapping(value="/user",method=RequestMethod.GET)
	public String userList(){
		
		return "user/list";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String doLogin( HttpServletRequest request,HttpServletResponse reponse,Model model) {
		
		String resultPage="login";
		System.out.println("post login");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(username+":"+password);
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
			model.addAttribute("message", "用户名和密码格式不对");
			return resultPage;
		}



			resultPage="index";
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,未知账户");
            request.setAttribute("message_login", "未知账户");  
		return  "redirect:/index";
	}
}
