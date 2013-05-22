package com.onlinehr.service;

import com.onlinehr.domain.CompanyUser;

/**
 * 企业用户操作
 * @author TUYANWei
 */

public interface ICompanyUserService {
	
	/**
	 * 保存企业用户信息
	 * @param companyUser
	 */
	public void saveCompanyUser(CompanyUser companyUser);
	
	/**
	 * 根据企业帐号取企业信息
	 * @param companyAccount
	 * @return
	 */
	public CompanyUser getCompanyUserById(String companyAccount);
}
