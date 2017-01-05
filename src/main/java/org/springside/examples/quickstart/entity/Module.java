package org.springside.examples.quickstart.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name = "ss_module")
public class Module extends IdEntity{

	private String title;
	private String clientType;
	private String requestCmd;
	private String responseCmd;
	private Date createDate;
	private Date updateDate;
	private User user;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getClientType() {
		return clientType;
	}
	public void setClientType(String clientType) {
		this.clientType = clientType;
	}
	public String getRequestCmd() {
		return requestCmd;
	}
	public void setRequestCmd(String requestCmd) {
		this.requestCmd = requestCmd;
	}
	public String getResponseCmd() {
		return responseCmd;
	}
	public void setResponseCmd(String responseCmd) {
		this.responseCmd = responseCmd;
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
	
	// JPA 基于USER_ID列的多对一关系定义
		@ManyToOne
		@JoinColumn(name = "user_id")
		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		@Override
		public String toString() {
			return ToStringBuilder.reflectionToString(this);
		}
}
