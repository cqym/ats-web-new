package org.springside.examples.quickstart.service.versionTask;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.quickstart.entity.CaseNode;
import org.springside.examples.quickstart.entity.VerTaskCaseStep;
import org.springside.examples.quickstart.entity.VersionTask;
import org.springside.examples.quickstart.entity.VersionTaskCase;
import org.springside.examples.quickstart.entity.XmlConfigDetail;
import org.springside.examples.quickstart.repository.CaseDao;
import org.springside.examples.quickstart.repository.VersionTaskCaseDao;
import org.springside.examples.quickstart.repository.VersionTaskDao;
//Spring Bean的标识.
@Component
//类中所有public函数都纳入事务管理的标识.
@Transactional
public class VersionTaskService {

	private VersionTaskDao versionTaskDao;
	private VersionTaskCaseDao versionTaskCaseDao;
	private CaseDao caseDao;
	
	 @Transactional(readOnly = true)  
	public List<VersionTask> getChildren(Long parentId) {
		List<VersionTask> list = versionTaskDao.findByParentId(parentId);
		for (VersionTask vTask : list) {
			vTask.setTaskCases(null);
		}
		return list;
	}

	public void createNewVersionTask(VersionTask newNode) {
		VersionTask parentNode = versionTaskDao.findOne(newNode.getParentId());
		if(parentNode.getLeaf() == 1){
			parentNode.setLeaf(0);
			versionTaskDao.save(parentNode);
		}
		versionTaskDao.save(newNode);
	}

	public void renameVersionTask(VersionTask newNode) {
		// TODO Auto-generated method stub
		VersionTask curentNode = versionTaskDao.findOne(newNode.getId());
		curentNode.setText(newNode.getText());
		versionTaskDao.save(curentNode);
	}

	public void deleteVersionTask(Long id) {
		VersionTask curentNode = versionTaskDao.findOne(id);
		versionTaskDao.delete(id);
		List<VersionTask> list = versionTaskDao.findByParentId(curentNode.getParentId());
		if(list.isEmpty()){
			VersionTask parentNode = versionTaskDao.findOne(curentNode.getParentId());
			parentNode.setLeaf(1);
			versionTaskDao.save(parentNode);
		}
	}

	@Transactional(readOnly = true)  
	public VersionTask getVersionTaskById(Long id) {
		VersionTask rt = versionTaskDao.findOne(id);
		List<VersionTaskCase> taskCases = rt.getTaskCases();
		if(taskCases == null){
			return rt;
		}
		for (VersionTaskCase c : taskCases) {
			c.setVersionTask(null);
			c.setCaseSteps(null);
		}
		return rt;
	}

	public void saveVersionTask(VersionTask newNode) {
		versionTaskDao.save(newNode);
	}

	public VersionTaskDao getVersionTaskDao() {
		return versionTaskDao;
	}
	
	@Autowired
	public void setVersionTaskDao(VersionTaskDao versionTaskDao) {
		this.versionTaskDao = versionTaskDao;
	}

	public VersionTaskCaseDao getVersionTaskCaseDao() {
		return versionTaskCaseDao;
	}
	@Autowired
	public void setVersionTaskCaseDao(VersionTaskCaseDao versionTaskCaseDao) {
		this.versionTaskCaseDao = versionTaskCaseDao;
	}

	public CaseDao getCaseDao() {
		return caseDao;
	}
	@Autowired
	public void setCaseDao(CaseDao caseDao) {
		this.caseDao = caseDao;
	}

	public VersionTaskCase addCase(VersionTaskCase newNode) {
		CaseNode caseInfo = caseDao.findOne(newNode.getCaseNode().getId());
		
		VersionTaskCase dbvtc = new VersionTaskCase();
		dbvtc.setCaseNode(caseInfo);
		dbvtc.setCreateDate(new Date());
		dbvtc.setDiscription(caseInfo.getDiscription());
		dbvtc.setRunResult(0);
		dbvtc.setStatus(0);
		dbvtc.setText(caseInfo.getText());
		dbvtc.setUpdateDate(new Date());
		dbvtc.setUser(newNode.getUser());
		dbvtc.setVersionTask(newNode.getVersionTask());
		
		List<XmlConfigDetail> steps = caseInfo.getXmlConfig().getDetail();
		
		List<VerTaskCaseStep> caseSteps = new ArrayList<VerTaskCaseStep>();
		for (XmlConfigDetail xcd : steps) {
			VerTaskCaseStep it = new VerTaskCaseStep();
			it.setDescription(xcd.getDescription());
			it.setGxParams(xcd.getGxParams());
			it.setOrderNum(xcd.getOrderNum());
			it.setRequestContent(xcd.getRequestContent());
			it.setRequestParams(xcd.getRequestParams());
			it.setResponseContent(xcd.getResponseContent());
			it.setResponseParams(xcd.getResponseParams());
			it.setRunResult(0);
			it.setStatus(0);
			it.setStepName(xcd.getStepName());
			it.setVersionTaskCase(dbvtc);
			caseSteps.add(it );
		}
		dbvtc.setCaseSteps(caseSteps);
		
		versionTaskCaseDao.save(dbvtc);
		
		return dbvtc;
	}

	public void delTaskCaseByIds(Long[] taskCaseIds) {
		for (int i = 0; i < taskCaseIds.length; i++) {
			versionTaskCaseDao.delete(taskCaseIds[i]);
		}
	}

}
