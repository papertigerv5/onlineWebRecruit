package com.onlinehr.dao;

import java.util.List;

import com.onlinehr.domain.PositionType;
import com.onlinehr.utils.Page;

/**
 * 职位信息表操作
 * @author firmideal
 *
 */
public interface IPositionTypeDao {
	/**
	 * 取职位列表
	 * @return
	 */
	public List<PositionType> getPositionTypeList();
	
	/**
	 * 删除指定职位信息
	 * @param positionType
	 */
	public void deletePositionTypeById(PositionType positionType);
	
	/**
	 * 修改职位信息
	 * @param positionType
	 */
	public void updatePositionType(PositionType positionType);
	
	/**
	 * 保存职位信息
	 * @param positionType
	 */
	public void savePositionType(PositionType positionType);
	
	/**
	 * 通过id获取职位信息
	 * @param id
	 * @return
	 */
	public PositionType getPositionTypeById(int id);
	
	/**
	 * 分页查询
	 * @return
	 */
	public Page getPositionByPage(int pageNo, int pageSize);
}
