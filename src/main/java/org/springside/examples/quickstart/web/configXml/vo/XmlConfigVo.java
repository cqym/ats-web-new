package org.springside.examples.quickstart.web.configXml.vo;

import java.util.Date;

import org.springside.examples.quickstart.entity.User;

public class XmlConfigVo {
	private String title;
	private String description;
	private Date createDate;
	private Date updateDate;
	private User user;
	private XmlConfigDetailVo[] detail;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public XmlConfigDetailVo[] getDetail() {
		return detail;
	}
	public void setDetail(XmlConfigDetailVo[] detail) {
		this.detail = detail;
	}
	
	
}
