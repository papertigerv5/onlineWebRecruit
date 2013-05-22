package com.onlinehr.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 资讯信息表
 * @author chenhiqi
 *
 */
@Entity
@Table(name="news", catalog="onlinehr")
public class News extends BaseDomain{
	/**
	 * 资讯ID
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="news_id")
	private Integer newsId;
	
	/**
	 * 标题
	 */
	@Column(name="title", length=100, nullable=false)
	private String title;
	/**
	 * 类别
	 */
	@Column(name="type", length=2)
	private Integer type;
	/**
	 * 发布时间
	 */
	@Column(name="add_time", columnDefinition="timestamp default CURRENT_TIMESTAMP")
	private Date addTime;
	/**
	 * 发布者账号
	 */
	@Column(name="user_account")
	private String userAccount;
	/**
	 * 内容
	 */
	@Column(name="content")
	private String content;
	/**
	 * 权重值
	 */
	@Column(name="order_num")
	private Integer orderNum;
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
}
