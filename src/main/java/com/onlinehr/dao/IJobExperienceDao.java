package com.onlinehr.dao;

import com.onlinehr.domain.JobExperience;

/**
 * 工作经历数据操作
 * @author TUYANWEI
 *
 */
public interface IJobExperienceDao {

	/**
	 * 保存工作经历信息
	 * @param jobExperience
	 */
	public void saveJobExperience(JobExperience jobExperience);
	
	/**
	 * 修改教育经历信息
	 * @param jobExperience
	 */
	public void udpateJobExperience(JobExperience jobExperience);
	
	/**
	 * 删除教育经历信息
	 * @param jobExperience
	 */
	public void deleteJobExperience(JobExperience jobExperience);
}
