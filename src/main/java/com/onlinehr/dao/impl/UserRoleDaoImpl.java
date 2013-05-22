package com.onlinehr.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IUserRoleDao;
import com.onlinehr.domain.UserRole;

/**
 * 角色信息操作
 * @author firmideal
 *
 */
@Repository
@Qualifier(value="userRoleDao")
public class UserRoleDaoImpl implements IUserRoleDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	/**
	 * 删除角色信息
	 */
	@Override
	public void deleteUserRole(UserRole userRole) {
		this.hibernateTemplate.delete(userRole);
	}

	/**
	 * 取所有角色信息
	 */
	@Override
	public List<UserRole> getAllUserRole() {
		return this.hibernateTemplate.loadAll(UserRole.class);
	}

	/**
	 * 取指定角色信息
	 */
	@Override
	public UserRole getUserRoleById(int id) {
		return this.hibernateTemplate.get(UserRole.class, id);
	}

	/**
	 * 保存角色信息
	 */
	@Override
	public void saveUserRole(UserRole userRole) {
		this.hibernateTemplate.save(userRole);
	}

	/**
	 * 修改角色信息
	 */
	@Override
	public void updateUserRole(UserRole userRole) {
		this.hibernateTemplate.update(userRole);
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
