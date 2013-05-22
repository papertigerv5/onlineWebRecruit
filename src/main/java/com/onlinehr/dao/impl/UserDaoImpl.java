package com.onlinehr.dao.impl;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IUserDao;
import com.onlinehr.domain.UserLogin;

/**
 * 用户信息操作
 * @author TUYANWEI
 *
 */
@Repository
@Qualifier(value="userDao")
public class UserDaoImpl extends BaseDao<UserLogin> implements IUserDao {

	/**
	 * 根据用户帐号取用户登录信息
	 */
	@Override
	public UserLogin getUserLoginByAccount(String userAccount) {
		return super.get(userAccount);
	}

	/**
	 * 个人用户注册
	 */
	@Override
	public void userRegister(UserLogin userLogin) {
		super.save(userLogin);
	}

	/**
	 * 用户登录
	 */
	@Override
	public UserLogin userLogin(UserLogin userLogin) {
		String hql = "from UserLogin u where u.userAccount='"+userLogin.getUserAccount()+"' and u.usrePass='"+userLogin.getUsrePass()+"'"+" and u.userRole.roleId="+userLogin.getUserRole().getRoleId();
		UserLogin resultUserLogin = null; 
		Query query = super.createQuery(hql, null);
		resultUserLogin =  (UserLogin) (query != null && query.list().size() > 0 ?query.list().get(0):null); 
		return resultUserLogin;
	}
}
