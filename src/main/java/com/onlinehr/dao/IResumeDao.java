package com.onlinehr.dao;

import java.util.List;

import com.onlinehr.domain.Resume;

/**
 * 简历数据操作
 * @author TUYANWEI
 *
 */
public interface IResumeDao {
	/**
	 * 创建一份简历
	 * @param resume
	 */
	public void saveUserResume(Resume resume);
	
	/**
	 * 修改指定简历信息
	 * @param resume
	 */
	public void updateResumeById(Resume resume);
	
	/**
	 * 取指定用户所有简历
	 * @param userAccount
	 * @return
	 */
	public List<Resume> getAllResumeByAccount(String userAccount);
	
	/**
	 * 取指定简历信息
	 * @param id
	 * @return
	 */
	public Resume getResumeById(Integer id);
}
