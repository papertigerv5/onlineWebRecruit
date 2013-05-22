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
 * 工作经历
 * @author TUYANWEI
 *
 */
@Entity
@Table(name="job_experience", catalog="onlinehr")
public class JobExperience extends BaseDomain {

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
	 * 公司名称
	 */
	@Column(name="company_name", length=50)
	private String companyName;
	
	/**
	 * 公司性质
	 */
	@Column(name="company_nature", length=1)
	private String companyNature;
	
	/**
	 * 公司规模
	 */
	@Column(name="company_scale", length=1)
	private String companyScale;
	
	/**
	 * 所属行业ID
	 */
	@Column(name="trade_id", length=3)
	private String tradeId;
	
	/**
	 * 所属部门
	 */
	@Column(name="depar_name", length=50)
	private String deparName;
	
	/**
	 * 工作描述
	 */
	@Column(name="job_desc", length=200)
	private String jobDesc;
	
	/**
	 * 职位ID
	 */
	@Column(name="job_id", length=3)
	private String jodId;

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

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyNature() {
		return companyNature;
	}

	public void setCompanyNature(String companyNature) {
		this.companyNature = companyNature;
	}

	public String getCompanyScale() {
		return companyScale;
	}

	public void setCompanyScale(String companyScale) {
		this.companyScale = companyScale;
	}

	public String getJodId() {
		return jodId;
	}

	public void setJodId(String jodId) {
		this.jodId = jodId;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public String getDeparName() {
		return deparName;
	}

	public void setDeparName(String deparName) {
		this.deparName = deparName;
	}
	
}
