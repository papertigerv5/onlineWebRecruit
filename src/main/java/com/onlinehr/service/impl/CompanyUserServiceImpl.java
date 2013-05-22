package com.onlinehr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onlinehr.dao.ICompanyUserDao;
import com.onlinehr.domain.CompanyUser;
import com.onlinehr.service.ICompanyUserService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 企业用户操作
 * @author TUYANWEI
 *
 */
@Transactional
@Service
@Qualifier(value="companyUserService")
public class CompanyUserServiceImpl implements ICompanyUserService {

	@Autowired
	@Qualifier(value="companyUserDao")
	private ICompanyUserDao companyUserDao;
	/**
	 * 保存企业用户信息
	 */
	@Override
	public void saveCompanyUser(CompanyUser companyUser) {
		this.companyUserDao.saveCompanyUser(companyUser);
	}
	
	/**
	 * 根据企业帐号取企业信息
	 */
	@Override
	public CompanyUser getCompanyUserById(String companyAccount) {
		return this.companyUserDao.getCompanyUserById(companyAccount);
	}
}
