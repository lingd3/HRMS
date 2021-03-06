package com.dan.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dan.domain.Admin;
import com.dan.service.AdminService;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 * @author gd
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring 配置文件
@ContextConfiguration({ "classpath:spring-mybatis.xml" })
public class SpringMybatisTest {

    @Autowired
    private AdminService adminService;

    @Test
    public void testLogin() {
        Admin admin = new Admin();
        admin.setUsername("superadmin");
        admin.setPassword("123456");
        System.out.println(adminService.login(admin).toString());

    }
    
    @Test
    public void testaddAdmin() {
    		Admin admin = new Admin();
        admin.setUsername("testAdmin");
        admin.setPassword("123456");
        System.out.println(adminService.addAdmin(admin).toString());
    }
    
    @Test
    public void testdeleteAdmin() {
        System.out.println(adminService.deleteAdmin(3));
    } 
}
