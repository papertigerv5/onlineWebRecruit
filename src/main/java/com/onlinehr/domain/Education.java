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
 * 教育经历
 * @author TUYANWEI
 *
 */
@Entity
@Table(name="education", catalog="onlinehr")
public class Education extends BaseDomain {
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
	 * 开始年份
	 */
	@Column(name="start_year", length=4)
	private String startYear;
	
	/**
	 * 开始月份
	 */
	@Column(name="start_month", length=2)
	private String startMonth;
	
	/**
	 * 结束年份
	 */
	@Column(name="end_year", length=4)
	private String endYear;
	
	/**
	 * 结束月份
	 */
	@Column(name="end_month", length=2)
	private String endMonth;
	
	/**
	 * 学校名称
	 */
	@Column(name="school_name", length=100)
	private String schoolName;
	
	/**
	 * 专业ID
	 */
	@Column(name="specialty_id", length=4)
	private String specialtyId;
	
	/**
	 * 学历ID
	 */
	@Column(name="degree", length=1)
	private String degree;
	
	/**
	 * 专业描述
	 */
	@Column(name="spe_desc", length=200)
	private String speDesc;

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

	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	public String getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSpecialtyId() {
		return specialtyId;
	}

	public void setSpecialtyId(String specialtyId) {
		this.specialtyId = specialtyId;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getSpeDesc() {
		return speDesc;
	}

	public void setSpeDesc(String speDesc) {
		this.speDesc = speDesc;
	}
}
