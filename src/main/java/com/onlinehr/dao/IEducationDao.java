package com.onlinehr.dao;

import com.onlinehr.domain.Education;

/**
 * 教育经历数据操作
 * @author TUYANWEI
 *
 */
public interface IEducationDao {
	
	/**
	 * 保存用户教育经历信息
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
	 * @param education
	 */
	public void deleteUserEducation(Education education);

}
