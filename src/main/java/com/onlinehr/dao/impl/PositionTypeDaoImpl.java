package com.onlinehr.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IPositionTypeDao;
import com.onlinehr.domain.PositionType;
import com.onlinehr.utils.Page;

/**
 * 职位信息表操作
 * @author firmideal
 *
 */
@Repository
@Qualifier(value="positionTypeDao")
public class PositionTypeDaoImpl extends BaseDao<PositionType> implements IPositionTypeDao {

	/**
	 * 删除指定职位信息
	 */
	@Override
	public void deletePositionTypeById(PositionType positionType) {
		super.remove(positionType);
	}

	/**
	 * 取职位列表信息
	 */
	@Override
	public List<PositionType> getPositionTypeList() {
		return super.loadAll();
	}

	/**
	 * 修改职位信息
	 */
	@Override
	public void updatePositionType(PositionType positionType) {
		super.update(positionType);
	}

	/**
	 * 保存职位信息
	 */
	@Override
	public void savePositionType(PositionType positionType) {

		System.out.print("dao :"+positionType.getPositionName());
		super.save(positionType);
	}

	/**
	 * 
	 */
	@Override
	public PositionType getPositionTypeById(int id) {
		return super.get(id);
	}

	/**
	 * 分页查询
	 */
	@Override
	public Page getPositionByPage(int pageNo, int pageSize) {
		String hql = "from PositionType";
		return super.pagedQuery(hql, pageNo, pageSize, null);
	}
}
