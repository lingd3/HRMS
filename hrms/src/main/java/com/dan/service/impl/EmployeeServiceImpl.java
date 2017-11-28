package com.dan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dan.dao.EmployeeDao;
import com.dan.domain.Employee;
import com.dan.domain.Post;
import com.dan.service.EmployeeService;

public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	public List<Post> findEmployees(Map<String, Object> map) {
		return employeeDao.findEmployees(map);
	}

	public Integer getCount(Map<String, Object> map) {
		return employeeDao.getCount(map);
	}

	public Integer addEmployee(Employee employee) {
		Integer flag = null;
		// 如果插入记录主键重复，抛出异常
		try {
			flag = employeeDao.addEmployee(employee);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return flag;
	}

	public Integer updateEmployee(Employee employee) {
		return employeeDao.updateEmployee(employee);
	}

	public Integer deleteEmployee(String id) {
		return employeeDao.deleteEmployee(id);
	}

}
