package com.onlinehr.dao;

import com.onlinehr.domain.PersonalUser;
import com.onlinehr.domain.UserLogin;

/**
 * 
 * 
 *	个人用户操作
 */
public interface IUserDao {
	
	/**
	 * 用户注册
	 * @param userLogin
	 */
	public void userRegister(UserLogin userLogin);
	
	/**
	 * 根据用户帐号取用户登录信息
	 * @param userAccount
	 * @return
	 */
	public UserLogin getUserLoginByAccount(String userAccount);
	
	/**
	 * 用户登录
	 * @param userLogin
	 * @return
	 */
	public UserLogin userLogin(UserLogin userLogin);
	
	
}
