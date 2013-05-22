package com.onlinehr.dao.impl;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IPersonalUserDao;
import com.onlinehr.domain.PersonalUser;

/**
 * 个人用户基本信息操作
 * @author TUYANWEI
 *
 */
@Repository
@Qualifier(value="personalUserDao")
public class PersonalUserDaoImpl extends BaseDao<PersonalUser> implements IPersonalUserDao {

	/**
	 * 个人用户基本信息操作
	 */
	@Override
	public void saveUserBasicInfo(PersonalUser personalUser) {
		super.save(personalUser);
	}

	/**
	 * 取个人基本信息
	 */
	@Override
	public PersonalUser getPersonalUserById(String userAccount) {
		return super.load(userAccount);
	}

	/**
	 * 修改用户基本信息
	 */
	@Override
	public void updateUserBasicInfo(PersonalUser personalUser) {
		super.update(personalUser);
	}
	
	

}
