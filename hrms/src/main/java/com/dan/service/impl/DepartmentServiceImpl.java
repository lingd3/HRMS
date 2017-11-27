package com.dan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dan.dao.DepartmentDao;
import com.dan.domain.Department;
import com.dan.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;
	
	public List<Department> findDepartments(Map<String, Object> map) {
		return departmentDao.findDepartments(map);
	}

	public Integer getCount(Map<String, Object> map) {
		return departmentDao.getCount(map);
	}

	public Integer addDepartment(Department department) {
		return departmentDao.addDepartment(department);
	}

	public Integer updateDepartment(Department department) {
		return departmentDao.addDepartment(department);
	}

	public Integer deleteDepartment(Integer id) {
		return departmentDao.deleteDepartment(id);
	}

}
