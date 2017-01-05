package org.springside.examples.quickstart.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

@Entity
@Table(name = "ss_version_task")
public class VersionTask extends IdEntity{
	private String text;
	private Long parentId;
	private Integer leaf;
	private String discription;
	private User user;
	private Date createDate;
	private Date updateDate;
	private Integer status;
	private Integer runResult;
	
	private List<VersionTaskCase> taskCases;
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	public Integer getLeaf() {
		return leaf;
	}
	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getRunResult() {
		return runResult;
	}
	public void setRunResult(Integer runResult) {
		this.runResult = runResult;
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
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="task_id")
	public List<VersionTaskCase> getTaskCases() {
		return taskCases;
	}
	public void setTaskCases(List<VersionTaskCase> taskCases) {
		this.taskCases = taskCases;
	}
}
