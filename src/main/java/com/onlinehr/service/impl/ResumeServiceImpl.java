package com.onlinehr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onlinehr.dao.IEducationDao;
import com.onlinehr.dao.IJobExperienceDao;
import com.onlinehr.dao.IResumeDao;
import com.onlinehr.domain.Education;
import com.onlinehr.domain.JobExperience;
import com.onlinehr.domain.Resume;
import com.onlinehr.service.IResumeService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户简历管理
 * @author TUYANWEI
 *
 */
@Transactional
@Service
@Qualifier(value="resumeService")
public class ResumeServiceImpl implements IResumeService {

	@Autowired
	@Qualifier(value="resumeDao")
	private IResumeDao resumeDao;
	
	@Autowired
	@Qualifier(value="educationDao")
	private IEducationDao educationDao;
	
	@Autowired
	@Qualifier(value="jobExperience")
	private IJobExperienceDao jobExperienceDao;
	
	/**
	 * 保存简历信息
	 */
	@Override
	public void saveUserResume(Resume resume) {
		this.resumeDao.saveUserResume(resume);
	}

	/**
	 * 修改简历基本信息
	 */
	@Override
	public void updateResumeById(Resume resume) {
		this.resumeDao.updateResumeById(resume);
	}

	/**
	 * 删除工作经历信息
	 */
	@Override
	public void deleteJobExperience(JobExperience jobExperience) {
		this.jobExperienceDao.deleteJobExperience(jobExperience);
	}

	/**
	 * 删除教育经历信息
	 */
	@Override
	public void delteUserEducation(Education education) {
		this.educationDao.saveUserEducation(education);
	}

	/**
	 * 保存工作经历信息
	 */
	@Override
	public void saveJobExpericnce(JobExperience jobExperience) {
		this.jobExperienceDao.saveJobExperience(jobExperience);
	}

	/**
	 * 保存教育经历信息
	 */
	@Override
	public void saveUserEducation(Education education) {
		this.educationDao.saveUserEducation(education);
	}

	/**
	 * 修改工作经历信息
	 */
	@Override
	public void updateJobExperience(JobExperience jobExperience) {
		this.jobExperienceDao.udpateJobExperience(jobExperience);
	}

	/**
	 * 修改教育经历信息
	 */
	@Override
	public void updateUserEducation(Education education) {
		this.educationDao.updateUserEducation(education);
	}

	/**
	 * 取指定用户所有简历信息
	 */
	@Override
	public List<Resume> getResumesByAccount(String userAccount) {
		return resumeDao.getAllResumeByAccount(userAccount);
	}

	/**
	 * 取指定简历信息
	 */
	@Override
	public Resume getResumeById(Integer id) {
		return resumeDao.getResumeById(id);
	}

}
