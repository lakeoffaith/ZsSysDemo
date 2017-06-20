package com.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

public class MyRealm extends AuthorizingRealm {
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		System.out.println("验证权限");
		String currentUsername = (String)super.getAvailablePrincipal(principals); 
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		if(null!=currentUsername && currentUsername.equals("admin")){    
            //添加一个角色,不是配置意义上的添加,而是证明该用户拥有admin角色      
            simpleAuthorInfo.addRole("admin");    
            //添加权限    
            simpleAuthorInfo.addStringPermission("admin:manage");    
            System.out.println("已为用户[admin]赋予了[admin]角色和[admin:manage]权限");    
            return simpleAuthorInfo;    
        }   
        return simpleAuthorInfo;  
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("验证登录");
		 AuthenticationInfo authcInfo = new SimpleAuthenticationInfo("admin", "admin", this.getName());    
         SecurityUtils.getSubject().getSession().setAttribute("currentUser", "admin");  
         return authcInfo;    
	}

}
