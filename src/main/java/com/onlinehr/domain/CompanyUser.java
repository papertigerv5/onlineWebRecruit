package com.onlinehr.domain;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 企业用户表
 * @author TUYANWEI
 *
 */
@Entity
@Table(name="company_user", catalog="onlinehr")
public class CompanyUser extends BaseDomain {
	
	/**
	 * 企业用户账号
	 */
	@Id
	@GeneratedValue(generator="companyAccountGenerator")
	@GenericGenerator(name="companyAccountGenerator",strategy="assigned")
	@Column(name="company_account")
	private String companyAccount;
	
	/**
	 * 公司名称
	 */
	@Column(name="company_name", length=100)
	private String companyName;
	/**
	 * 公司规模
	 */
	@Column(name="company_scale", length=2)
	private String companyScale;
	
	/**
	 * 所在省
	 */
	@Column(name="province", length=50)
	private String province;
	/**
	 * 所在城市
	 */
	@Column(name="city", length=50)
	private String city;
	/**
	 * 具体地址
	 */
	@Column(name="address", length=100)
	private String address;
	/**
	 * 联系人
	 */
	@Column(name="company_hr", length=30)
	private String companyHr;
	/**
	 * 企业邮箱
	 */
	@Column(name="company_mail", length=50)
	private String companyMail;
	/**
	 * 公司电话
	 */
	@Column(name="company_phone", length=15)
	private String companyPhone;
	/**
	 * 企业主页
	 */
	@Column(name="company_homelink", length=100)
	private String companyHomelink;
	
	/**
	 * 所属行业
	 */
	@Column(name="trade_id", length=3)
	private String tradeId;
	
	/**
	 * 公司性质
	 */
	@Column(name="company_nature", length=1)
	private String companyNature;
	
	/**
	 * 公司简介
	 */
	@Column(name="company_desc", length=500)
	private String companyDesc;
	
	/**
	 * 状态
	 */
	@Column(name="statu", length=1)
	private String statu;
	/**
	 * 插入时间
	 */
	@Column(name="insert_time")
	private String insertTime;
	public String getCompanyAccount() {
		return companyAccount;
	}

	public void setCompanyAccount(String companyAccount) {
		this.companyAccount = companyAccount;
	}
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyScale() {
		return companyScale;
	}

	public void setCompanyScale(String companyScale) {
		this.companyScale = companyScale;
	}
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String getCompanyHr() {
		return companyHr;
	}

	public void setCompanyHr(String companyHr) {
		this.companyHr = companyHr;
	}
	public String getCompanyMail() {
		return companyMail;
	}

	public void setCompanyMail(String companyMail) {
		this.companyMail = companyMail;
	}
	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	public String getCompanyHomelink() {
		return companyHomelink;
	}

	public void setCompanyHomelink(String companyHomelink) {
		this.companyHomelink = companyHomelink;
	}
	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getCompanyNature() {
		return companyNature;
	}

	public void setCompanyNature(String companyNature) {
		this.companyNature = companyNature;
	}

	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}
	public String getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}

	public String getCompanyDesc() {
		return companyDesc;
	}

	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
