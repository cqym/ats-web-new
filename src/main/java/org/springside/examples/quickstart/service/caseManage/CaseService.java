package org.springside.examples.quickstart.service.caseManage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.quickstart.entity.CaseNode;
import org.springside.examples.quickstart.entity.XmlConfig;
import org.springside.examples.quickstart.repository.CaseDao;
import org.springside.examples.quickstart.repository.XmlConfigDao;


//Spring Bean的标识.
@Component
//类中所有public函数都纳入事务管理的标识.
@Transactional
public class CaseService {
	private CaseDao caseDao;
	private XmlConfigDao xmlConfigDao;
	
	public XmlConfigDao getXmlConfigDao() {
		return xmlConfigDao;
	}
	@Autowired
	public void setXmlConfigDao(XmlConfigDao xmlConfigDao) {
		this.xmlConfigDao = xmlConfigDao;
	}

	public CaseDao getCaseDao() {
		return caseDao;
	}

	@Autowired
	public void setCaseDao(CaseDao caseDao) {
		this.caseDao = caseDao;
	}

	public void saveCaseNode(CaseNode entity) {
		caseDao.save(entity);
	}

	public void deleteCaseNode(Long id) {
		CaseNode curentNode = caseDao.findOne(id);
		caseDao.delete(id);
		List<CaseNode> list = caseDao.findByParentId(curentNode.getParentId());
		if(list.isEmpty()){
			CaseNode parentNode = caseDao.findOne(curentNode.getParentId());
			parentNode.setLeaf(1);
			caseDao.save(parentNode);
		}
	}

	public CaseNode getCaseNodeById(Long id){
		return caseDao.findOne(id);
	}
	
	public List<CaseNode> getAllCaseNode() {
		return (List<CaseNode>) caseDao.findAll();
	}

	public List<CaseNode> getChildren(Long parentId) {
		// TODO Auto-generated method stub
		return caseDao.findByParentId(parentId);
	}

	public void createNewCaseNode(CaseNode newNode) {
		CaseNode parentNode = caseDao.findOne(newNode.getParentId());
		if(parentNode.getLeaf() == 1){
			parentNode.setLeaf(0);
			caseDao.save(parentNode);
		}
		caseDao.save(newNode);
	}

	public void renameCaseNode(CaseNode newNode) {
		CaseNode curentNode = caseDao.findOne(newNode.getId());
		curentNode.setText(newNode.getText());
		caseDao.save(curentNode);
	}

	public void saveCaseInfo(CaseNode newNode) {
		CaseNode curentNode = caseDao.findOne(newNode.getId());
		curentNode.setText(newNode.getText());
		curentNode.setPriority(newNode.getPriority());
		curentNode.setDiscription(newNode.getDiscription());
		curentNode.setCaseStep(newNode.getCaseStep());
		
		XmlConfig xmlConfig = xmlConfigDao.findOne(newNode.getXmlConfig().getId());
		curentNode.setXmlConfig(xmlConfig);
		caseDao.save(curentNode);
	}
}
