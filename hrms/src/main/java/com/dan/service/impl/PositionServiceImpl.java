package com.dan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dan.dao.PositionDao;
import com.dan.domain.Position;
import com.dan.service.PositionService;

@Service("positionService")
public class PositionServiceImpl implements PositionService {

	@Autowired
	private PositionDao positionDao;

	public List<Position> findPositions(Map<String, Object> map) {
		return positionDao.findPositions(map);
	}

	public Integer getCount(Map<String, Object> map) {
		return positionDao.getCount(map);
	}

	public Integer addPosition(Position position) {
		return positionDao.addPosition(position);
	}

	public Integer updatePosition(Position position) {
		return positionDao.updatePosition(position);
	}

	public Integer deletePosition(Integer id) {
		Integer flag = null; 
		// 如果删除关联外键的行记录，抛出异常 
		try { 
			flag = positionDao.deletePosition(id); 
		} catch (Exception e) { 
			throw new RuntimeException(); 
		} 
		return flag;
	}

}
