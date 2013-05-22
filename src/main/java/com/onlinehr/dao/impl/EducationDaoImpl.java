package com.onlinehr.dao.impl;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IEducationDao;
import com.onlinehr.domain.Education;

/**
 * 教育经历信息操作
 * @author TUYANWEI
 *
 */
@Repository
@Qualifier(value="educationDao")
public class EducationDaoImpl extends BaseDao<Education> implements IEducationDao {

	/**
	 * 删除教育经历信息
	 */
	@Override
	public void deleteUserEducation(Education education) {
		super.remove(education);
	}

	/**
	 * 保存教育经历信息
	 */
	@Override
	public void saveUserEducation(Education education) {
		super.save(education);
	}

	/**
	 * 修改教育经历信息
	 */
	@Override
	public void updateUserEducation(Education education) {
		super.update(education);
	}

}
