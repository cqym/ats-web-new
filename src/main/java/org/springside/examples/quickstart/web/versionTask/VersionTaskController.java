package org.springside.examples.quickstart.web.versionTask;

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
import org.springside.examples.quickstart.entity.User;
import org.springside.examples.quickstart.entity.VersionTask;
import org.springside.examples.quickstart.entity.VersionTaskCase;
import org.springside.examples.quickstart.service.account.ShiroDbRealm.ShiroUser;
import org.springside.examples.quickstart.service.versionTask.VersionTaskService;

@Controller
@RequestMapping(value = "/verTask")
public class VersionTaskController {
	@Autowired
	private VersionTaskService versionTaskService;
	
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("action", "create");
		return "versionTask/versionTaskView";
	}
	
	@RequestMapping(value = "getChildren", method = RequestMethod.GET)
	public @ResponseBody List<VersionTask> getChildren(Long parentId, RedirectAttributes redirectAttributes) {
		//User user = new User(getCurrentUserId());
		return versionTaskService.getChildren(parentId);
	}
	
	
	@RequestMapping(value = "createNode", method = RequestMethod.POST)
	public @ResponseBody VersionTask createNode(@RequestBody VersionTask newNode, RedirectAttributes redirectAttributes) {
		User user = new User(getCurrentUserId());
		newNode.setUser(user);
		newNode.setCreateDate(new Date());
		newNode.setUpdateDate(new Date());
		versionTaskService.createNewVersionTask(newNode);
		return newNode;
	}
	
	@RequestMapping(value = "renameNode", method = RequestMethod.POST)
	public @ResponseBody VersionTask renameNode(@RequestBody VersionTask newNode, RedirectAttributes redirectAttributes) {
		newNode.setUpdateDate(new Date());
		versionTaskService.renameVersionTask(newNode);
		return newNode;
	}
	
	@RequestMapping(value = "delNode", method = RequestMethod.POST)
	public @ResponseBody String delNode(@RequestBody VersionTask newNode, RedirectAttributes redirectAttributes) {
		versionTaskService.deleteVersionTask(newNode.getId());
		return "true";
	}
	
	@RequestMapping(value = "getVersionTaskById/{id}", method = RequestMethod.GET)
	public @ResponseBody VersionTask getVersionTaskById(@PathVariable("id")Long id, RedirectAttributes redirectAttributes) {
		return versionTaskService.getVersionTaskById(id);
	}
	
	@RequestMapping(value = "saveVersionTask", method = RequestMethod.POST)
	public @ResponseBody VersionTask saveVersionTask(@RequestBody VersionTask newNode, RedirectAttributes redirectAttributes) {
		newNode.setUpdateDate(new Date());
		versionTaskService.saveVersionTask(newNode);
		return newNode;
	}
	
	@RequestMapping(value = "addCase", method = RequestMethod.POST)
	public @ResponseBody VersionTaskCase addCase(@RequestBody VersionTaskCase newNode, RedirectAttributes redirectAttributes) {
		newNode.setUser(new User(getCurrentUserId()));
		return versionTaskService.addCase(newNode);
		
	}
	
	@RequestMapping(value = "delTaskCaseByIds", method = RequestMethod.POST)
	public @ResponseBody String delTaskCaseByIds(@RequestBody Long taskCaseIds[], RedirectAttributes redirectAttributes) {
		versionTaskService.delTaskCaseByIds(taskCaseIds);
		return "true";
		
	}
	
	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
}
