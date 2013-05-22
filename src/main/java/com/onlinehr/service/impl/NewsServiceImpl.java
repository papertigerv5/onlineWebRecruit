package com.onlinehr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.onlinehr.dao.INewsDao;
import com.onlinehr.domain.News;
import com.onlinehr.service.INewsService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 资讯信息操作
 * @author firmideal
 *
 */
@Transactional
@Service
@Qualifier(value="newsService")
public class NewsServiceImpl implements INewsService {

	@Autowired
	@Qualifier(value="newsDao")
	private INewsDao newsDao;
	@Override
	public List<News> getNewList(int newsType) {
		return newsDao.getNewsList();
	}

	@Override
	public News getNewsById(News news) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<News> getNewsByType(int type) {
		return newsDao.getNewsByType(type);
	}

}
