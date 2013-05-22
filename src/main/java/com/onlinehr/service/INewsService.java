package com.onlinehr.service;

import java.util.List;

import com.onlinehr.domain.News;

/**
 * 资讯类操作
 * @author firmideal
 *
 */
public interface INewsService {

	/**
	 * 根据ID取对应资讯信息
	 * @param news
	 * @return
	 */
	public News getNewsById(News news);
	
	/**
	 * 取指定类别的资讯列表
	 * @return
	 */
	public List<News> getNewList(int newsType);
	
	/**
	 * 按资讯类别取资讯信息
	 * @param type
	 * @return
	 */
	public List<News> getNewsByType(int type);
}
