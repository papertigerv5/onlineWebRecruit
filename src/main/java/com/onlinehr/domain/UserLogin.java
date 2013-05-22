package com.onlinehr.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 登录信息表
 * @author firmideal
 *
 */

@Entity
@Table(name="user_login", catalog="onlinehr")
public class UserLogin extends BaseDomain {


	/**
	 * 登录帐号
	 */
	@Id
	@GeneratedValue(generator="userAccountGenerator")
	@GenericGenerator(name="userAccountGenerator",strategy="assigned")
	@Column(name="user_account", length=30, nullable=false)
	private String userAccount;
	
	/**
	 * 登录密码
	 */
	@Column(name="user_pass", length=50, nullable=false)
	private String usrePass;
	
	/**
	 * 角色信息
	 */
	@ManyToOne
	@JoinColumn(name="role_id")
	private UserRole userRole;
	
	/**
	 * 帐号状态
	 */
	@Column(name="user_statu", columnDefinition="Integer(4) default 1")
	private Integer userStatu;
	
	/**
	 * 最近登录时间
	 */
	@Column(name="last_login_time", columnDefinition="timestamp default CURRENT_TIMESTAMP")
	private Date lastLoginTime;

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUsrePass() {
		return usrePass;
	}

	public void setUsrePass(String usrePass) {
		this.usrePass = usrePass;
	}
	
	public UserRole getUserRole() {
		return userRole;
	}

	public void setUserRole(UserRole userRole) {
		this.userRole = userRole;
	}

	public Integer getUserStatu() {
		return userStatu;
	}

	public void setUserStatu(Integer userStatu) {
		this.userStatu = userStatu;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	
	
}
