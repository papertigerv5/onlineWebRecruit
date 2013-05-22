package com.onlinehr.Controller;

import com.onlinehr.domain.PersonalUser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 首页功能
 * @author firmideal
 *
 */
@Controller
public class IndexController {


	/**
	 * 打开首页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index.html",method=RequestMethod.GET)
	public String toIndexPage(ModelMap model){
		//取热门招聘列表(按一定条件取前N条)
		
		//取企业视频列表(按一定条件取前N条)
		
		//取视频简历列表(按一定条件取前N条)
		
		//取热门职位列表(按一定条件取前N条)
		
		//取职场资讯信息(按一定条件取前N条)

		//取广告位列表(按一定条件取前N条)

        //取该系统中的所有的用户角色

		return indexPageView;
	}


    @Value("index")
    private String indexPageView;
}
