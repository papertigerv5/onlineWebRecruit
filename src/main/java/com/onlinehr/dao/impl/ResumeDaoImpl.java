package com.onlinehr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.IResumeDao;
import com.onlinehr.domain.Resume;
/**
 * 简历信息操作
 * @author TUYANWEI
 *
 */
@Repository
@Qualifier(value="resumeDao")
public class ResumeDaoImpl extends BaseDao<Resume> implements IResumeDao {

	/**
	 *保存简历信息 
	 */
	@Override
	public void saveUserResume(Resume resume) {
		super.save(resume);
	}

	/**
	 * 修改简历信息
	 */
	@Override
	public void updateResumeById(Resume resume) {
		super.update(resume);
	}
	
	/**
	 * 取指定用户所有简历信息
	 */
	@Override
	public List<Resume> getAllResumeByAccount(String userAccount) {
		String hql = "from Resume r where r.personalUser.userAccount='"+userAccount+"'";
		Query query = super.createQuery(hql, null);
		List<Resume> resumeList = query.list();
		return resumeList;
	}

	/**
	 * 取指定简历信息
	 */
	@Override
	public Resume getResumeById(Integer id) {
		return super.get(id);
	}
}
