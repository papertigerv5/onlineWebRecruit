package com.onlinehr.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 职能类别
 * @author firmideal
 *
 */

@Entity
@Table(name="position_type", catalog="onlinehr")
public class PositionType extends BaseDomain {
	
	/**
	 * 职位ID
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="position_id", nullable=false)
	private Integer positionId;
	
	/**
	 * 职位名称 
	 */
	@Column(name="position_name", length=50, nullable=false)
	private String positionName;
	
	/**
	 * 职位描述
	 */
	@Column(name="position_desc", length=200)
	private String positionDesc;
	
	/**
	 * 记录插入时间
	 */
	@Column(name="insert_time", columnDefinition="timestamp default CURRENT_TIMESTAMP")
	private Date insertTime;

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getPositionDesc() {
		return positionDesc;
	}

	public void setPositionDesc(String positionDesc) {
		this.positionDesc = positionDesc;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	
	
}
