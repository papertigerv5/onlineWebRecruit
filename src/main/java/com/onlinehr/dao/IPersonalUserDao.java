package com.onlinehr.dao;

import com.onlinehr.domain.PersonalUser;

/**
 * 个人用户基本信息操作
 * @author TUYANWEI
 *
 */
public interface IPersonalUserDao {

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
