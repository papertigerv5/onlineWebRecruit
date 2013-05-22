package com.onlinehr.service;

import java.util.List;

import com.onlinehr.domain.Education;
import com.onlinehr.domain.JobExperience;
import com.onlinehr.domain.Resume;

/**
 * 简历信息操作
 * @author TUYANWEI
 *
 */
public interface IResumeService {
	
	/**
	 * 保存用户简历信息
	 * @param resume
	 */
	public void saveUserResume(Resume resume);
	
	/**
	 * 修改指定简历信息
	 * @param resume
	 */
	public void updateResumeById(Resume resume);
	
	/**
	 * 保存教育经历信息
	 * @param education
	 */
	public void saveUserEducation(Education education);
	
	/**
	 * 修改教育经历信息
	 * @param education
	 */
	public void updateUserEducation(Education education);
	
	/**
	 * 删除教育经历信息
	 */
	public void delteUserEducation(Education education);
	
	/**
	 * 保存工作经历信息
	 * @param jobExperience
	 */
	public void saveJobExpericnce(JobExperience jobExperience);
	
	/**
	 * 修改工作经历信息
	 * @param jobExperience
	 */
	public void updateJobExperience(JobExperience jobExperience);
	
	/**
	 * 删除工作经历信息
	 * @param jobExperience
	 */
	public void deleteJobExperience(JobExperience jobExperience);
	
	/**
	 * 取指定用户所有简历
	 * @param userAccount
	 * @return
	 */
	public List<Resume> getResumesByAccount(String userAccount);
	
	/**
	 * 取指定简历信息
	 * @param id
	 * @return
	 */
	public Resume getResumeById(Integer id);
}
