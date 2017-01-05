package org.springside.examples.quickstart.web.moduleManage;

import java.util.Date;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.examples.quickstart.entity.Module;
import org.springside.examples.quickstart.entity.User;
import org.springside.examples.quickstart.service.account.ShiroDbRealm.ShiroUser;
import org.springside.examples.quickstart.service.module.ModuleService;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/module")
public class ModuleController {
	private static final String PAGE_SIZE = "5";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "名称");
	}

	@Autowired
	private ModuleService moduleService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = getCurrentUserId();

		Page<Module> modules = moduleService.getUserModule(userId, searchParams, pageNumber, pageSize, sortType);

		model.addAttribute("modules", modules);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "module/moduleList";
	}

	@RequestMapping(value = "select", method = RequestMethod.GET)
	public String select(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = getCurrentUserId();

		Page<Module> modules = moduleService.getUserModule(userId, searchParams, pageNumber, pageSize, sortType);

		model.addAttribute("modules", modules);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "module/moduleSelectList";
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("module", new Module());
		model.addAttribute("action", "create");
		return "module/moduleForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@Valid Module newModule, RedirectAttributes redirectAttributes) {
		User user = new User(getCurrentUserId());
		newModule.setUser(user);
		newModule.setCreateDate(new Date());
		newModule.setUpdateDate(new Date());
		moduleService.saveModule(newModule);
		redirectAttributes.addFlashAttribute("message", "创建任务成功");
		return "redirect:/module/";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("module", moduleService.getModule(id));
		model.addAttribute("action", "update");
		return "module/moduleForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("module") Module module, RedirectAttributes redirectAttributes) {
		moduleService.saveModule(module);
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/module/";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		moduleService.deleteModule(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/module/";
	}

	@ResponseBody
	@RequestMapping(value = "getDetail/{id}", method = RequestMethod.GET)
	public Module getDetail(@PathVariable("id") Long id, Model model) {
		return moduleService.getModule(id);
	}
	
	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getModule(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
		if (id != -1) {
			model.addAttribute("module", moduleService.getModule(id));
		}
	}

	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
}
