package org.springside.examples.quickstart.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ss_ver_task_case_step")
public class VerTaskCaseStep extends IdEntity{
	private Integer orderNum;
	private String stepName;
	private String description;
	private String requestContent;
	private String responseContent;
	private String requestParams;
	private String responseParams;
	private String gxParams;
	private Integer status;
	private Integer runResult;
	
	private VersionTaskCase versionTaskCase;

	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	public String getStepName() {
		return stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public String getResponseContent() {
		return responseContent;
	}

	public void setResponseContent(String responseContent) {
		this.responseContent = responseContent;
	}

	public String getRequestParams() {
		return requestParams;
	}

	public void setRequestParams(String requestParams) {
		this.requestParams = requestParams;
	}

	public String getResponseParams() {
		return responseParams;
	}

	public void setResponseParams(String responseParams) {
		this.responseParams = responseParams;
	}

	public Integer getRunResult() {
		return runResult;
	}

	public void setRunResult(Integer runResult) {
		this.runResult = runResult;
	}

	public String getGxParams() {
		return gxParams;
	}

	public void setGxParams(String gxParams) {
		this.gxParams = gxParams;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	

	@ManyToOne
	@JoinColumn(name = "ver_task_case_id")
	public VersionTaskCase getVersionTaskCase() {
		return versionTaskCase;
	}

	public void setVersionTaskCase(VersionTaskCase versionTaskCase) {
		this.versionTaskCase = versionTaskCase;
	}
	
	
	
}
