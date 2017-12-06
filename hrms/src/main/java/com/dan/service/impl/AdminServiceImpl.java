package com.dan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dan.dao.AdminDao;
import com.dan.domain.Admin;
import com.dan.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	// 自动注入 DAO 对象
	@Autowired
	private AdminDao adminDao;

	// 实现接口中的方法
	public Admin login(Admin admin) {
		return adminDao.login(admin);
	}

	public List<Admin> findAdmins(Map<String, Object> map) {
		return adminDao.findAdmins(map);
	}
	
	public static void main(String[] args) {
		AdminServiceImpl adminServiceImpl = new AdminServiceImpl();
		System.out.println(adminServiceImpl.findAdmins(new HashMap<String, Object>()));
	}

	public Integer getCount(Map<String, Object> map) {
		return adminDao.getCount(map);
	}

	public Integer addAdmin(Admin admin) {
		return adminDao.addAdmin(admin);
	}

	public Integer updateAdmin(Admin admin) {
		return adminDao.updateAdmin(admin);
	}

	public Integer deleteAdmin(Integer id) {
		return adminDao.deleteAdmin(id);
	}
}
