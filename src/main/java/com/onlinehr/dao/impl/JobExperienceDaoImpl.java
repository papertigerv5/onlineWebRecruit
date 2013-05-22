package com.onlinehr.dao.impl;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IJobExperienceDao;
import com.onlinehr.domain.JobExperience;

/**
 * 工作经历信息操作 
 * @author TUYANWEI
 *
 */
@Repository
@Qualifier(value="jobExperience")
public class JobExperienceDaoImpl extends BaseDao<JobExperience> implements IJobExperienceDao {

	/**
	 * 删除工作经历信息
	 */
	@Override
	public void deleteJobExperience(JobExperience jobExperience) {
		super.remove(jobExperience);
	}

	/**
	 * 保存工作经历信息
	 */
	@Override
	public void saveJobExperience(JobExperience jobExperience) {
		super.save(jobExperience);
	}

	/**
	 * 修改工作经历信息
	 */
	@Override
	public void udpateJobExperience(JobExperience jobExperience) {
		super.update(jobExperience);
	}
}
