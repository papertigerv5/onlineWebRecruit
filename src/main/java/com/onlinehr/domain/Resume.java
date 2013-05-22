package com.onlinehr.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 个人简历
 * @author TUYANWEI
 *
 */
@Entity
@Table(name="resume", catalog="onlinehr")
public class Resume extends BaseDomain {

	/**
	 * 自增ID
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	/**
	 * 所属用户
	 */
	@ManyToOne(cascade=CascadeType.MERGE, fetch=FetchType.EAGER)
	@JoinColumn(name="user_account")
	private PersonalUser personalUser;
	
	/**
	 * 简历名称
	 */
	@Column(name="resume_name", length=50)
	private String resumeName;
	
	/**
	 * 简历状态
	 */
	@Column(name="is_open",	length=1)
	private String status;
	
	/**
	 * 创建时间
	 */
	@Column(name="create_time", columnDefinition="timestamp default CURRENT_TIMESTAMP")
	private String createTime;
	
	/**
	 * 修改时间
	 */
	@Column(name="update_time")
	private String updateTime;
	
	/**
	 * 包含的学习经历
	 */
	@OneToMany(mappedBy="resume", cascade=CascadeType.ALL,  fetch=FetchType.EAGER, targetEntity=Education.class)
	private Set<Education> educations = new HashSet<Education>();
	
	/**
	 * 包含工作经验
	 */
	@OneToMany(mappedBy="resume", cascade=CascadeType.ALL, fetch=FetchType.EAGER, targetEntity=JobExperience.class)
	private Set<JobExperience> jobExps = new HashSet<JobExperience>();
	
	/**
	 * 包含求职意向
	 */
	@OneToMany(mappedBy="resume", cascade=CascadeType.ALL,fetch=FetchType.EAGER, targetEntity=Intention.class)
	private Set<Intention> intentions = new HashSet<Intention>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public PersonalUser getPersonalUser() {
		return personalUser;
	}

	public void setPersonalUser(PersonalUser personalUser) {
		this.personalUser = personalUser;
	}

	public String getResumeName() {
		return resumeName;
	}

	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Set<Education> getEducations() {
		return educations;
	}

	public void setEducations(Set<Education> educations) {
		this.educations = educations;
	}

	public Set<JobExperience> getJobExps() {
		return jobExps;
	}

	public void setJobExps(Set<JobExperience> jobExps) {
		this.jobExps = jobExps;
	}

	public Set<Intention> getIntentions() {
		return intentions;
	}

	public void setIntentions(Set<Intention> intentions) {
		this.intentions = intentions;
	}

}
