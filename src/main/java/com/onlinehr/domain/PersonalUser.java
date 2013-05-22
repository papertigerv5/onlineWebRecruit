package com.onlinehr.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 个人用户信息表
 * @author TUYANWEI
 *
 */

@Entity
@Table(name="personal_user", catalog="onlinehr")
public class PersonalUser extends BaseDomain {
	/**
	 * 登录帐号
	 */
	@Id
	@GeneratedValue(generator="userAccountGenerator")
	@GenericGenerator(name="userAccountGenerator",strategy="assigned")
	@Column(name="user_account")
	private String userAccount;
	
	/**
	 * 用户姓名
	 */
	@Column(name="user_name", length=20)
	private String userName;
	
	/**
	 * 性别
	 */
	@Column(name="user_sex", length=1)
	private String userSex;
	
	/**
	 * 婚姻状况
	 */
	@Column(name="marriage", length=2)
	private String marriage;
	
	/**
	 * 电子邮箱
	 */
	@Column(name="e_mail", length=50)
	private String email;
	
	/**
	 * 出生日期
	 */
	@Column(name="birthday", length=10)
	private String birthday;
	
	/**
	 * 所在省
	 */
	@Column(name="province", length=50)
	private String province;
	
	/**
	 * 所在市 
	 */
	@Column(name="city", length=50)
	private String city;
	
	/**
	 * 具体地址
	 */
	@Column(name="address")
	private String address;
	
	/**
	 * 证件类型
	 */
	@Column(name="card_type", length=2)
	private String cardType;
	
	/**
	 * 证件号码
	 */
	@Column(name="card_number", length=20)
	private String cardNumber;
	
	/**
	 * 有无海外工作经历
	 */
	@Column(name="oversea_assignment", length=2)
	private String overseaAssignment;
	
	/**
	 * 户口所在省份
	 */
	@Column(name="hukou_pro", length=50)
	private String hukouPro;
	
	/**
	 * 户口所在城市
	 */
	@Column(name="hukou_city", length=50)
	private String hukouCity;
	
	/**
	 * 政治面貌
	 */
	@Column(name="politics_statu", length=2)
	private String politicsStatu;
	
	/**
	 * 手机号码
	 */
	@Column(name="phone", length=13)
	private String phone;
	
	/**
	 * 工作年限
	 */
	@Column(name="work_years", length=2)
	private String workYears;
	
	/**
	 * 用户头像路径
	 */
	@Column(name="photo_path", length=100)
	private String userPhotoPath;
	
	/**
	 * 用户包含简历
	 */
	@OneToMany(mappedBy="personalUser", cascade=CascadeType.ALL, fetch=FetchType.LAZY, targetEntity=Resume.class)
	private Set<Resume> resumeSet = new HashSet<Resume>();
		
	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getMarriage() {
		return marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getOverseaAssignment() {
		return overseaAssignment;
	}

	public void setOverseaAssignment(String overseaAssignment) {
		this.overseaAssignment = overseaAssignment;
	}

	public String getPoliticsStatu() {
		return politicsStatu;
	}

	public void setPoliticsStatu(String politicsStatu) {
		this.politicsStatu = politicsStatu;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set<Resume> getResumeSet() {
		return resumeSet;
	}

	public void setResumeSet(Set<Resume> resumeSet) {
		this.resumeSet = resumeSet;
	}

	public String getHukouPro() {
		return hukouPro;
	}

	public void setHukouPro(String hukouPro) {
		this.hukouPro = hukouPro;
	}

	public String getHukouCity() {
		return hukouCity;
	}

	public void setHukouCity(String hukouCity) {
		this.hukouCity = hukouCity;
	}

	public String getWorkYears() {
		return workYears;
	}

	public void setWorkYears(String workYears) {
		this.workYears = workYears;
	}

	@Override
	public String toString() {
		return "name: "+this.getUserName()+", sex: "+this.getUserSex()+", marriage: "+this.getMarriage()+", email: "+this.getEmail()
			+ ", birthday: "+this.getBirthday()+", province: "+this.getProvince()+", city: "+this.getCity()+", address: "+this.getAddress()
			+ ", cardType: "+this.getCardType()+", cardNumber: "+this.getCardNumber()+", overseaAssignment: "+this.getOverseaAssignment()
			+ ", hukouPro: "+this.getHukouPro()+", hukouCity: "+this.getHukouCity()+", politicsStatu: "+this.politicsStatu+", phone: "+this.getPhone()
			+ ", workYears: "+this.getWorkYears();
	}

	public String getUserPhotoPath() {
		return userPhotoPath;
	}

	public void setUserPhotoPath(String userPhotoPath) {
		this.userPhotoPath = userPhotoPath;
	}
}
