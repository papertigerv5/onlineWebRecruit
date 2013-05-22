package com.onlinehr.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.onlinehr.dao.INewsDao;
import com.onlinehr.domain.News;
import com.onlinehr.utils.Page;

@Repository
@Qualifier(value="newsDao")
public class NewsDaoImpl extends BaseDao<News> implements INewsDao {
	/**
	 * 取资讯信息
	 */
	@Override
	public List<News> getNewsList() {
		return super.loadAll();
	}
	/**
	 * 通过id获取资讯
	 */
	@Override 
	public News getNewsById(int id) {
		return super.get(id);
	}
	/**
	 * 删除指定资讯
	 */
	@Override
	public void deleteNewsById(News news) {
		super.remove(news);
	}

	/**
	 * 修改指定资讯
	 */
	@Override 
	public void updateNews(News news) {
		super.update(news);
	}
	/**
	 * 保存资讯
	 */
	@Override
	public void saveNews(News news) {
		super.save(news);
	}
	/**
	 * 分页查询
	 */
	@Override
	public Page getNewsByPage(int pageNo, int pageSize) {
		String hql = "from News";
		return super.pagedQuery(hql, pageNo, pageSize, null);
	}
	
	/**
	 * 按资讯类别取资讯信息
	 * @param type
	 * @return
	 */
	public List<News> getNewsByType(int type){
		String hql = "from News t where t.type="+type+" order by t.orderNum,t.addTime";
		
		Query query = super.createQuery(hql, null); //(Query) hibernateTemplate.find(hql);
		List<News> newsList =  query.list();
		
		return newsList;
	}
}
