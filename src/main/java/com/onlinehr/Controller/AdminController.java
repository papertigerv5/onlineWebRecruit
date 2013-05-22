package com.onlinehr.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.onlinehr.common.PublicProperty;
import com.onlinehr.domain.PositionType;
import com.onlinehr.domain.News;
import com.onlinehr.service.IAdminService;
import com.onlinehr.utils.Page;

/**
 * 后台管理Controller
 * @author firmideal
 *
 */

@Controller
@RequestMapping(value="admin")
public class AdminController {
	
	/**
	 * 默认列表页大小
	 */
	private final static int DEFAULT_POSITION_PAGESIZE = 20;
	private final static int DEFAULT_NEWS_PAGESIZE = 20;
	
	/**
	 * 默认列表开始页
	 */
	private final static int DEFAULT_POSITION_STARTPAGE = 1;
	
	
	/**
	 * 职位信息列表页面
	 */
	@Value("admin/position_list")
	private String positionIndexPage;
    
	
	/**
	 * 修改职位页面
	 */
	@Value("admin/position_update")
	private String positionUpdatePage;
	
	/**
	 * 添加职位页面
	 */
	@Value("admin/position_add")
	
	private String positionAddPage;
	
	/**
	 * 注入后台管理 Service
	 */
	@Autowired
	@Qualifier(value="adminService")
	private IAdminService adminService;
	/**
	 * 职位列表
	 */
	@Value("admin/job_list")
	private String jobIndexPage;
	/**
	 * 职位添加
	 */
	@Value("admin/job_add")
	private String jobAddPage;
	
	/**
	 * 资讯信息列表页面
	 */
	@Value("admin/news_list")
	private String newsIndexPage;
	/**
	 * 修改资讯页面
	 */
	@Value("admin/news_update")
	private String newsUpdatePage;

	/**
	 * 添加资讯页面
	 */
	@Value("admin/news_add")
	private String newsAddPage;

	
	/**
	 * 取职位列表
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/position/index",method=RequestMethod.GET)
	public String getPositionList(HttpServletRequest request,ModelMap modelMap){
		int pageNo = request.getParameter("pageNo")==null||"".equals(request.getParameter("pageNo"))?1:Integer.parseInt(request.getParameter("pageNo"));
		Page positionPage = adminService.getPositionByPage(pageNo, DEFAULT_POSITION_PAGESIZE);
		modelMap.addAttribute("positionPage", positionPage);
		return this.positionIndexPage;
	}
	
	/**
	 * 转到添加职位信息页
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/position/addpage",method=RequestMethod.GET)
	public String toPositionAdd(ModelMap modelMap){
		return this.positionAddPage;
	}
	
	@RequestMapping(value="/job/index",method=RequestMethod.GET)
	public String getJobList(HttpServletRequest request){
		/*JobDao jobDao = new JobDao();
		List<Job> jobList = jobDao.getJob();
		request.setAttribute("jobList", jobList);
		*/
		return "admin/job_list";
		
	}
	@RequestMapping(value="/job/addpage",method=RequestMethod.GET)
	public String toJobAdd(ModelMap modelMap){
		return this.jobAddPage;
	}
	
	/**
	 * 添加职位信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/position/add",method=RequestMethod.POST)
	public String addPositionType(PositionType positionType,ModelMap modelMap){
		//插入操作
		this.adminService.addPositionType(positionType);
		
		//取职位列表
		Page positionPage = adminService.getPositionByPage(DEFAULT_POSITION_STARTPAGE, DEFAULT_POSITION_PAGESIZE);
		modelMap.addAttribute("positionPage", positionPage);
		return this.positionIndexPage;
	}
	
	/**
	 * 删除职位信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/position/delete",method=RequestMethod.GET)
	public String deletePositionType(HttpServletRequest request,ModelMap modelMap){
		
		int positionId = Integer.parseInt(request.getParameter("id"));
		
		PositionType positionType = new PositionType();
		positionType.setPositionId(positionId);
		
		this.adminService.deletePositionTypeById(positionType);
		//取职位列表
		Page positionPage = adminService.getPositionByPage(DEFAULT_POSITION_STARTPAGE, DEFAULT_POSITION_PAGESIZE);
		modelMap.addAttribute("positionPage", positionPage);
		return this.positionIndexPage;
	}
	/**
	 * 修改职位信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/position/update",method=RequestMethod.POST)
	public String updatePositionType(PositionType positionType,ModelMap modelMap){
		//修改操作
		this.adminService.updatePositionType(positionType);
		//取职位列表
		Page positionPage = adminService.getPositionByPage(DEFAULT_POSITION_STARTPAGE, DEFAULT_POSITION_PAGESIZE);
		modelMap.addAttribute("positionPage", positionPage);
		return this.positionIndexPage;
	}
	
	/**
	 * 根据ID取职位信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/position/get",method=RequestMethod.GET)
	public String getPostionById(HttpServletRequest request,ModelMap modelMap){
		int positionId = Integer.parseInt(request.getParameter("id"));
		
		//取对应职位信息
		PositionType positionType = this.adminService.getPositionTypeById(positionId);
		
		request.setAttribute("positionType", positionType);
		return this.positionUpdatePage;
	}
		
	/**
	 * 取资讯列表
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/news/index",method=RequestMethod.GET)
	public String getNewsList(HttpServletRequest request,ModelMap modelMap){
		int pageNo = request.getParameter("pageNo")==null||"".equals(request.getParameter("pageNo"))?1:Integer.parseInt(request.getParameter("pageNo"));

		Page newsList = adminService.getNewsByPage(pageNo, DEFAULT_NEWS_PAGESIZE);
		List<Map<String, Object>> newsTypeList = PublicProperty.getNewsTypeList();
		
		modelMap.addAttribute("newsTypeList", newsTypeList);
		modelMap.addAttribute("newsList", newsList);
		return this.newsIndexPage;
	}
	
	
	/**
	 * 转到添加资讯信息页
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/news/addpage",method=RequestMethod.GET)
	public String toNewsAdd(ModelMap modelMap){
		List<Map<String, Object>> newsTypeList = PublicProperty.getNewsTypeList();
		modelMap.addAttribute("newsTypeList", newsTypeList);
		return this.newsAddPage;
	}
	/**
	 * 添加资讯信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/news/add",method=RequestMethod.POST)
	public String addNews(HttpServletRequest request,News news,ModelMap modelMap){
		news.setUserAccount("");// 从session中取，暂时没做登录，所以先给默认值
		
		//插入操作
		this.adminService.addNews(news);
		
		//取资讯列表
		int pageNo = request.getParameter("pageNo")==null||"".equals(request.getParameter("pageNo"))?1:Integer.parseInt(request.getParameter("pageNo"));
		Page newsList = adminService.getNewsByPage(pageNo, DEFAULT_NEWS_PAGESIZE);
		List<Map<String, Object>> newsTypeList = PublicProperty.getNewsTypeList();
		
		modelMap.addAttribute("newsTypeList", newsTypeList);
		modelMap.addAttribute("newsList", newsList);
		return this.newsIndexPage;	
	}
	/**
	 * 删除资讯
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/news/delete",method=RequestMethod.GET)
	public String deleteNews(HttpServletRequest request,ModelMap modelMap){
		
		int newsId = Integer.parseInt(request.getParameter("id"));
		
		News news = new News();
		news.setNewsId(newsId);
		
		this.adminService.deleteNewsById(news);
		//取资讯列表
		int pageNo = request.getParameter("pageNo")==null||"".equals(request.getParameter("pageNo"))?1:Integer.parseInt(request.getParameter("pageNo"));
		Page newsList = adminService.getNewsByPage(pageNo, DEFAULT_NEWS_PAGESIZE);
		List<Map<String, Object>> newsTypeList = PublicProperty.getNewsTypeList();
		
		modelMap.addAttribute("newsTypeList", newsTypeList);
		modelMap.addAttribute("newsList", newsList);
		return this.newsIndexPage;	
	}
	/**
	 * 根据ID获取资讯信息
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/news/get",method=RequestMethod.GET)
	public String getNewsById(HttpServletRequest request,ModelMap modelMap){
		int newsId = Integer.parseInt(request.getParameter("id"));
		
		List<Map<String, Object>> newsTypeList = PublicProperty.getNewsTypeList();
		modelMap.addAttribute("newsTypeList", newsTypeList);
		
		//取对应资讯信息
		News news = this.adminService.getNewsById(newsId);
		request.setAttribute("news", news);
		return this.newsUpdatePage;
	}
	/**
	 * 修改资讯
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/news/update",method=RequestMethod.POST)
	public String updateNews(HttpServletRequest request,News news,ModelMap modelMap){
		news.setUserAccount("");
		//修改操作
		this.adminService.updateNews(news);
		//取资讯列表
		int pageNo = request.getParameter("pageNo")==null||"".equals(request.getParameter("pageNo"))?1:Integer.parseInt(request.getParameter("pageNo"));
		Page newsList = adminService.getNewsByPage(pageNo, DEFAULT_NEWS_PAGESIZE);
		List<Map<String, Object>> newsTypeList = PublicProperty.getNewsTypeList();
		
		modelMap.addAttribute("newsTypeList", newsTypeList);
		modelMap.addAttribute("newsList", newsList);
		return this.newsIndexPage;	
	}
	
	
	
	
}
