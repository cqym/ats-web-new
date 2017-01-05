package org.springside.examples.quickstart.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name = "ss_case")
public class CaseNode extends IdEntity{
	private String text;
    private Long parentId;
    private Integer leaf;
    private String discription;
    
    private String priority;
    private String caseStep;
    private XmlConfig xmlConfig;
    
    private Date createDate;
	private Date updateDate;
	private User user;
	
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
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
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public Integer getLeaf() {
		return leaf;
	}
	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}
	
	@javax.persistence.Transient
	public Boolean getChildren() {
		return this.leaf == 0;
	}
	
	@javax.persistence.Transient
	public String getType() {
		if(parentId == 0){
			return "root";
		}else if(this.leaf == 0){//有下级
			return "folder";
		}
		return "default";
	}
	
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getCaseStep() {
		return caseStep;
	}
	public void setCaseStep(String caseStep) {
		this.caseStep = caseStep;
	}
	@OneToOne
	@JoinColumn(name = "xml_config_id")
	public XmlConfig getXmlConfig() {
		return xmlConfig;
	}
	
	public void setXmlConfig(XmlConfig xmlConfig) {
		this.xmlConfig = xmlConfig;
	}
	
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
