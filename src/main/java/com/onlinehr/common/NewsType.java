package com.onlinehr.common;

/**
 *   资讯类型
 * @author firmideal
 *
 */
public enum NewsType {
	NEWS_INFORMATION(1),
	NEWS_INDUSTRY(2);
	private int value;
	public int getValue(){
		return this.value;
	}
	private NewsType(int value){
		this.value = value;
	}
}
