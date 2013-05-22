package com.onlinehr.service;

import com.onlinehr.domain.PersonalUser;
import com.onlinehr.domain.UserLogin;

/**
 * 个人用户信息操作
 * 
 *
 */
public interface IUserService {
	/**
	 * 用户注册
	 * @param userLogin
	 */
	public void userRegister(UserLogin userLogin);
	
	/**
	 * 用户登录
	 * @param userLogin
	 * @return
	 */
	public UserLogin userLogin(UserLogin userLogin);
	
	/**
	 * 根据用户帐号取用户登录信息
	 * @param userAccount
	 * @return
	 */
	public boolean checkEmailIsUse(String userAccount);
	
	/**
	 * 保存个人用户基本信息
	 * @param personalUser
	 */
	public void saveUserBasicInfo(PersonalUser personalUser);
	
	/**
	 * 取个人基本信息
	 * @param userAccount
	 * @return
	 */
	public PersonalUser getPersonalUserById(String userAccount);
	
	/**
	 * 修改用户基本信息
	 * @param personalUser
	 */
	public void updateUserBasicInfo(PersonalUser personalUser);
}
