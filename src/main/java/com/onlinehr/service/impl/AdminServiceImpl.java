package com.onlinehr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onlinehr.dao.IPositionTypeDao;
import com.onlinehr.dao.IUserRoleDao;
import com.onlinehr.domain.PositionType;
import com.onlinehr.domain.UserRole;
import com.onlinehr.service.IAdminService;
import com.onlinehr.dao.INewsDao;
import com.onlinehr.domain.News;
import com.onlinehr.utils.Page;
import org.springframework.transaction.annotation.Transactional;

/**
 * 后台管理部分
 * @author firmideal
 *
 */
@Transactional
@Service
@Qualifier(value="adminService")
public class AdminServiceImpl implements IAdminService {

	/**
	 * 注入职位管理Dao
	 */
	@Autowired
	@Qualifier(value="positionTypeDao")
	private IPositionTypeDao positionTypeDao;
	
	/**
	 * 注入角色管理Dao
	 */
	@Autowired
	@Qualifier(value="userRoleDao")
	private IUserRoleDao userRoleDao;
	
	
	
	/**
	 * 删除职位信息
	 */
	@Override
	public void deletePositionTypeById(PositionType positionType) {
		this.positionTypeDao.deletePositionTypeById(positionType);
	}

	/**
	 * 取职位列表
	 */
	@Override
	public List<PositionType> getPositionTypeList() {
		return this.positionTypeDao.getPositionTypeList();
	}

	/**
	 * 修改职位信息
	 */
	@Override
	public void updatePositionType(PositionType positionType) {
		this.positionTypeDao.updatePositionType(positionType);
	}

	/**
	 * 添加职位信息
	 */
	@Override
	public void addPositionType(PositionType positionType) {
		this.positionTypeDao.savePositionType(positionType);
	}

	/**
	 * 根据ID获取职位信息
	 */
	@Override
	public PositionType getPositionTypeById(int id) {
		return this.positionTypeDao.getPositionTypeById(id);
	}
	/**
	 * 取职位信息By Page
	 */
	@Override
	public Page getPositionByPage(int pageNo, int pageSize) {
		return this.positionTypeDao.getPositionByPage(pageNo, pageSize);
	}

	/**
	 * 注入资讯信息管理Dao
	 */
	@Autowired
	@Qualifier(value="newsDao")
	private INewsDao newsDao;
	
	/**
	 * 删除资讯
	 */
	@Override
	public void deleteNewsById(News news) {
		this.newsDao.deleteNewsById(news);
	}

	/**
	 * 取资讯列表
	 */
	@Override
	public List<News> getNewsList() {
		return this.newsDao.getNewsList();
	}

	/**
	 * 修改资讯
	 */
	@Override
	public void updateNews(News news) {
		this.newsDao.updateNews(news);
	}

	/**
	 * 添加资讯
	 */
	@Override
	public void addNews(News news) {
		this.newsDao.saveNews(news);
	}

	/**
	 * 根据ID获取资讯
	 */
	@Override
	public News getNewsById(int id) {
		return this.newsDao.getNewsById(id);
	}
	
	/**
	 * 取资讯信息By Page
	 */
	@Override
	public Page getNewsByPage(int pageNo, int pageSize) {
		return this.newsDao.getNewsByPage(pageNo, pageSize);
	}

	/**
	 * 删除角色信息
	 */
	@Override
	public void deleteUserRole(UserRole userRole) {
		this.userRoleDao.deleteUserRole(userRole);
	}

	/**
	 * 取角色列表
	 */
	@Override
	public List<UserRole> getAllUserRole() {
		return this.userRoleDao.getAllUserRole();
	}

	/**
	 * 取指定角色信息
	 */
	@Override
	public UserRole getUserRoleById(int id) {
		return this.userRoleDao.getUserRoleById(id);
	}

	/**
	 * 插入新的角色信息
	 */
	@Override
	public void saveUserRole(UserRole userRole) {
		this.userRoleDao.saveUserRole(userRole);
	}

	/**
	 * 修改指定角色信息
	 */
	@Override
	public void updateUserRole(UserRole userRole) {
		this.userRoleDao.updateUserRole(userRole);
	}

}
