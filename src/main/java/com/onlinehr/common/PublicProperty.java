package com.onlinehr.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *  公共参数定义
 * @author Tyw
 *
 */
public class PublicProperty {
	
	private final static List<Map<String, Object>> newsTypeList = new ArrayList<Map<String, Object>>();
	
	/**
	 * 取资讯类另列表
	 */
	public final static List<Map<String, Object>> getNewsTypeList(){
		if(newsTypeList != null && newsTypeList.size() > 0){
			return newsTypeList;
		}
		
		Map<String, Object> type1 = new HashMap<String, Object>();
		Map<String, Object> type2 = new HashMap<String, Object>();
		Map<String, Object> type3 = new HashMap<String, Object>();
		Map<String, Object> type4 = new HashMap<String, Object>();
		Map<String, Object> type5 = new HashMap<String, Object>();
		
		type1.put("id", 1);
		type1.put("name", "职场资讯");
		type2.put("id", 2);
		type2.put("name", "简历指导");
		type3.put("id", 3);
		type3.put("name", "职场热点");
		type4.put("id", 4);
		type4.put("name", "劳动法苑");
		type5.put("id", 5);
		type5.put("name", "面试技巧");
		
		newsTypeList.add(type1);
		newsTypeList.add(type2);
		newsTypeList.add(type3);
		newsTypeList.add(type4);
		newsTypeList.add(type5);

		return newsTypeList;
	}
}
