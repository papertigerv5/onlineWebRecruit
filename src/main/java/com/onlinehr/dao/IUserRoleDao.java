package com.onlinehr.dao;

import java.util.List;

import com.onlinehr.domain.UserRole;

/**
 * 角色信息操作
 * @author firmideal
 *
 */
public interface IUserRoleDao {

	/**
	 * 根据ID取角色信息
	 * @param id
	 * @return
	 */
	public UserRole getUserRoleById(int id);
	
	/**
	 * 取所有角色信息
	 * @return
	 */
	public List<UserRole> getAllUserRole();
	
	/**
	 * 删除指定角色信息
	 * @param userRole
	 */
	public void deleteUserRole(UserRole userRole);
	
	/**
	 * 保存角色信息
	 * @param userRole
	 */
	public void saveUserRole(UserRole userRole);
	
	/**
	 * 修改角色信息
	 * @param userRole
	 */
	public void updateUserRole(UserRole userRole);
}
