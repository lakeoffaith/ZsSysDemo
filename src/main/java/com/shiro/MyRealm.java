package com.shiro;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAccount;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.zs.model.Employee;
import com.zs.service.EmployeeService;

public class MyRealm extends AuthorizingRealm {
	@Autowired
	private EmployeeService employeeService;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		System.out.println("验证权限");
		String currentUsername = (String)super.getAvailablePrincipal(principals); 
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		List<String> roles=employeeService.findRolesByLoginName(currentUsername);
		List<String> permissons=employeeService.findPermissonsByLoginName(currentUsername);
		simpleAuthorInfo.addRoles(roles);
		simpleAuthorInfo.addStringPermissions(permissons);
        return simpleAuthorInfo;  
	}
 
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("验证登录");
		String userName=(String) token.getPrincipal();
		Employee user=employeeService.findUserByLoginName(userName);
		SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo(userName, user==null?"":user.getPassword(), this.getName());    
         SecurityUtils.getSubject().getSession().setAttribute("currentUser", user);  
         return authcInfo;    
	}

}
