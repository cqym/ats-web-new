package org.springside.examples.quickstart.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.CascadeType;

import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name = "ss_xml_config")
public class XmlConfig extends IdEntity{

	private String title;
	private String description;
	private Date createDate;
	private Date updateDate;
	private User user;
	private List<XmlConfigDetail> detail;
	
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
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="xml_config_id")
	
	public List<XmlConfigDetail> getDetail() {
		return detail;
	}
	public void setDetail(List<XmlConfigDetail> detail) {
		this.detail = detail;
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
