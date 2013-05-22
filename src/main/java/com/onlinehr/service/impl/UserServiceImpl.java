package com.onlinehr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onlinehr.dao.IPersonalUserDao;
import com.onlinehr.dao.IUserDao;
import com.onlinehr.domain.PersonalUser;
import com.onlinehr.domain.UserLogin;
import com.onlinehr.service.IUserService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 个人用户操作
 * @author TUYANWEI
 *
 */
@Transactional
@Service
@Qualifier(value="userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	@Qualifier(value="userDao")
	private IUserDao userDao;
	
	@Autowired
	@Qualifier(value="personalUserDao")
	private IPersonalUserDao personalUserDao;
	
	/**
	 * 判断帐号是否已被使用
	 */
	@Override
	public boolean checkEmailIsUse(String userAccount) {
		UserLogin userLogin = this.userDao.getUserLoginByAccount(userAccount);
		if(userLogin != null){
			return true;//已被占用
		}else{
			return false;
		}
	}

	/**
	 * 个人用户注册
	 */
	@Override
	public void userRegister(UserLogin userLogin) {
		this.userDao.userRegister(userLogin);
	}

	/**
	 * 保存个人用户基本信息
	 */
	@Override
	public void saveUserBasicInfo(PersonalUser personalUser) {
		this.personalUserDao.saveUserBasicInfo(personalUser);
	}

	/**
	 * 取个人基本信息
	 */
	@Override
	public PersonalUser getPersonalUserById(String userAccount) {
		return this.personalUserDao.getPersonalUserById(userAccount);
	}

	/**
	 * 用户登录
	 */
	@Override
	public UserLogin userLogin(UserLogin userLogin) {
		return this.userDao.userLogin(userLogin);
	}

	/**
	 * 修改用户基本信息
	 */
	@Override
	public void updateUserBasicInfo(PersonalUser personalUser) {
		this.personalUserDao.updateUserBasicInfo(personalUser);
	}	
}
