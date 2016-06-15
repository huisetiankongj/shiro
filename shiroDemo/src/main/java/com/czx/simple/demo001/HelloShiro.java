package com.czx.simple.demo001;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Assert;
import org.junit.Test;

public class HelloShiro {

	@Test
	public void testHelloShiro(){
		//1、获取securityManager工厂，此处使用ini配置初始化securityManager
		Factory<org.apache.shiro.mgt.SecurityManager> factory = new IniSecurityManagerFactory("classpath:com\\czx\\simple\\demo001\\shiro.ini");
		//2、得到SecurityManager实例 并绑定给SecurityUtils  
		org.apache.shiro.mgt.SecurityManager sercurityManager = factory.getInstance();
		SecurityUtils.setSecurityManager(sercurityManager);
		
		Subject subject = SecurityUtils.getSubject();
		
		UsernamePasswordToken token = new UsernamePasswordToken("zhang", "123");  

		try {
			subject.login(token);
		} catch (AuthenticationException e) {
			// TODO: handle exception
		}
		System.out.println(subject.getPrincipal());
		Assert.assertEquals(true, subject.isAuthenticated()); //断言用户已经登录  
	    //6、退出  
	    subject.logout();  
	}
	
}
