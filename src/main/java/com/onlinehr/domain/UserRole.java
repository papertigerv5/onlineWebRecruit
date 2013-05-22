package com.onlinehr.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户角色表
 * @author firmideal
 *
 */
@Entity
@Table(name="user_role", catalog="onlinehr")
public class UserRole extends BaseDomain {
	
	/**
	 * 角色ID
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="role_id", nullable=false)
	private Integer roleId;
	
	/**
	 * 角色名称
	 */
	@Column(name="role_name", length=20, nullable=false)
	private String roleName;
	
	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
