package org.springside.examples.quickstart.web.caseManage;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.examples.quickstart.entity.CaseNode;
import org.springside.examples.quickstart.entity.User;
import org.springside.examples.quickstart.service.account.ShiroDbRealm.ShiroUser;
import org.springside.examples.quickstart.service.caseManage.CaseService;

@Controller
@RequestMapping(value = "/case")
public class CaseController {

	@Autowired
	private CaseService caseService;
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("action", "create");
		return "caseconfig/caseConfig";
	}
	
	@RequestMapping(value = "getChildren", method = RequestMethod.GET)
	public @ResponseBody List<CaseNode> getChildren(Long parentId, RedirectAttributes redirectAttributes) {
		//User user = new User(getCurrentUserId());
		return caseService.getChildren(parentId);
	}
	
	
	@RequestMapping(value = "createNode", method = RequestMethod.POST)
	public @ResponseBody CaseNode createNode(@RequestBody CaseNode newNode, RedirectAttributes redirectAttributes) {
		User user = new User(getCurrentUserId());
		newNode.setUser(user);
		newNode.setCreateDate(new Date());
		newNode.setUpdateDate(new Date());
		caseService.createNewCaseNode(newNode);
		return newNode;
	}
	
	@RequestMapping(value = "renameNode", method = RequestMethod.POST)
	public @ResponseBody CaseNode renameNode(@RequestBody CaseNode newNode, RedirectAttributes redirectAttributes) {
		newNode.setUpdateDate(new Date());
		caseService.renameCaseNode(newNode);
		return newNode;
	}
	
	@RequestMapping(value = "delNode", method = RequestMethod.POST)
	public @ResponseBody String delNode(@RequestBody CaseNode newNode, RedirectAttributes redirectAttributes) {
		caseService.deleteCaseNode(newNode.getId());
		return "true";
	}
	
	@RequestMapping(value = "getCaseNodeById/{id}", method = RequestMethod.GET)
	public @ResponseBody CaseNode getCaseNodeById(@PathVariable("id")Long id, RedirectAttributes redirectAttributes) {
		return caseService.getCaseNodeById(id);
	}
	
	@RequestMapping(value = "saveCaseInfo", method = RequestMethod.POST)
	public @ResponseBody CaseNode saveCaseInfo(@RequestBody CaseNode newNode, RedirectAttributes redirectAttributes) {
		newNode.setUpdateDate(new Date());
		caseService.saveCaseInfo(newNode);
		return newNode;
	}
	
	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
}
