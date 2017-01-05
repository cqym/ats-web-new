package org.springside.examples.quickstart.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "ss_version_task_case")
public class VersionTaskCase extends IdEntity{
	private String text;
	private String discription;
	private User user;
	private Date createDate;
	private Date updateDate;
	private CaseNode caseNode;
	private Integer status;
	private Integer runResult;
	
	private List<VerTaskCaseStep> caseSteps;
	private VersionTask versionTask;
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
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
	
	@ManyToOne
	@JoinColumn(name = "case_id")
	public CaseNode getCaseNode() {
		return caseNode;
	}
	public void setCaseNode(CaseNode caseNode) {
		this.caseNode = caseNode;
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
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="ver_task_case_id")
	public List<VerTaskCaseStep> getCaseSteps() {
		return caseSteps;
	}
	public void setCaseSteps(List<VerTaskCaseStep> caseSteps) {
		this.caseSteps = caseSteps;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false)
	@JoinColumn(name="task_id")
	public VersionTask getVersionTask() {
		return versionTask;
	}
	public void setVersionTask(VersionTask versionTask) {
		this.versionTask = versionTask;
	}
	
	
}
