package com.onlinehr.dao.impl;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.ICompanyUserDao;
import com.onlinehr.domain.CompanyUser;

/**
 * 企业用户信息操作
 * @author TUYANWEI
 *
 */
@Repository
@Qualifier(value="companyUserDao")
public class CompanyUserDaoImpl extends BaseDao<CompanyUser> implements ICompanyUserDao {

	/**
	 * 企业用户信息保存
	 */
	@Override
	public void saveCompanyUser(CompanyUser companyUser) {
		super.save(companyUser);
	}

	/**
	 * 根据企业用户帐号取企业信息
	 */
	@Override
	public CompanyUser getCompanyUserById(String companyAccount) {
		return super.get(companyAccount);
	}

}
