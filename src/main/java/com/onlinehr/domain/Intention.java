package com.onlinehr.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 求职意向
 * @author TUYANWEI
 *
 */
@Entity
@Table(name="intention", catalog="onlinehr")
public class Intention extends BaseDomain {

	/**
	 * 自增ID
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	/**
	 * 所属简历
	 */
	@ManyToOne(cascade=CascadeType.MERGE, fetch=FetchType.LAZY)
	@JoinColumn(name="resume_id")
	private Resume resume;
	
	/**
	 * 工作类型
	 */
	@Column(name="job_type", length=2)
	private Integer jobType;
	
	/**
	 * 行业ID
	 */
	@Column(name="industry_id", length=4)
	private Integer industryId;
	
	/**
	 * 职能ID
	 */
	@Column(name="post_id", length=4)
	private Integer postId;
	
	/**
	 * 期望薪资
	 */
	@Column(name="hope_salary", length=4)
	private Integer hopeSalary;
	
	/**
	 * 到岗时间
	 */
	@Column(name="register_time", length=4)
	private Integer registerTime;
	
	/**
	 * 自我评价
	 */
	@Column(name="self_caption", length=200)
	private String selfCaption;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public Integer getJobType() {
		return jobType;
	}

	public void setJobType(Integer jobType) {
		this.jobType = jobType;
	}

	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getHopeSalary() {
		return hopeSalary;
	}

	public void setHopeSalary(Integer hopeSalary) {
		this.hopeSalary = hopeSalary;
	}

	public Integer getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Integer registerTime) {
		this.registerTime = registerTime;
	}

	public String getSelfCaption() {
		return selfCaption;
	}

	public void setSelfCaption(String selfCaption) {
		this.selfCaption = selfCaption;
	}
	
	
}
