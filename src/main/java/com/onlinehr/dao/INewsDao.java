package com.onlinehr.dao;

import java.util.List;

import com.onlinehr.domain.News;
import com.onlinehr.utils.Page;


/**
 * 资讯表操作
 * @author chenhaiqi
 *
 */
public interface INewsDao{
	/**
	 * 取资讯列表
	 * @return
	 */
	public List<News> getNewsList();
	/**
	 * 通过id获取资讯
	 * @param id
	 * @return
	 */
	public News getNewsById(int id);
	/**
	 * 删除指定资讯
	 * @param news
	 */
	public void deleteNewsById(News news);
	/**
	 * 修改指定资讯
	 * @param news
	 */
	public void updateNews(News news);
	
	/**
	 * 保存资讯
	 * @param news
	 */
	public void saveNews(News news);
	/**
	 * 分页查询
	 * @return
	 */
	public Page getNewsByPage(int pageNo, int pageSize);
	
	/**
	 * 按资讯类别取资讯信息
	 * @param type
	 * @return
	 */
	public List<News> getNewsByType(int type);
}


