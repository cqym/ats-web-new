package org.springside.examples.quickstart.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;


@Entity
@Table(name = "ss_xml_config_detail")
public class XmlConfigDetail extends IdEntity{
	
	private String stepName;
	private Integer orderNum;
	private String description;
	private String requestContent;
	private String responseContent;
	private String requestParams;
	private String responseParams;
	private String gxParams;
	//private XmlConfig xmlConfig;

	public String getStepName() {
		return stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

//	@ManyToOne
//	@JoinColumn(name = "xml_config_id")
//	public XmlConfig getXmlConfig() {
//		return xmlConfig;
//	}
//
//	public void setXmlConfig(XmlConfig xmlConfig) {
//		this.xmlConfig = xmlConfig;
//	}
	
	public String getGxParams() {
		return gxParams;
	}

	public void setGxParams(String gxParams) {
		this.gxParams = gxParams;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
