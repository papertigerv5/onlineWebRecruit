package com.onlinehr.service;

import java.util.List;

import com.onlinehr.domain.PositionType;
import com.onlinehr.domain.News;
import com.onlinehr.domain.UserRole;
import com.onlinehr.utils.Page;

/**
 * 后台管理部分
 * @author firmideal
 *
 */
public interface IAdminService {
	
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
	 * 添加职位信息
	 * @param positionType
	 */
	public void addPositionType(PositionType positionType);
	
	/**
	 * 根据ID获取职位信息
	 * @param id
	 * @return
	 */
	public PositionType getPositionTypeById(int id);
	/**
	 * 取资讯列表
	 * @return
	 */
	public List<News> getNewsList();
	/**
	 * 删除指定资讯
	 * @param news
	 */
	public void deleteNewsById(News news);
	/**
	 * 修改资讯
	 * @param news
	 */
	public void updateNews(News news);
	/**
	 * 添加资讯
	 * @param news
	 */
	public void addNews(News news);
	/**
	 * 根据ID获取资讯
	 * @param id
	 * @return
	 */
	public News getNewsById(int id);
	
	
	/**
	 * 分页查询
	 * @return
	 */
	public Page getPositionByPage(int pageNo, int pageSize);
	public Page getNewsByPage(int pageNo, int pageSize);
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
