package org.springside.examples.quickstart.web.configXml;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.examples.quickstart.entity.Module;
import org.springside.examples.quickstart.entity.User;
import org.springside.examples.quickstart.entity.XmlConfig;
import org.springside.examples.quickstart.service.account.ShiroDbRealm.ShiroUser;
import org.springside.examples.quickstart.service.configXml.XmlConfigService;
import org.springside.modules.mapper.JsonMapper;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

@Controller
@RequestMapping(value = "/xmlConfig")
public class XmlConfigController {
	private static final String PAGE_SIZE = "15";
	private static JsonMapper binder = JsonMapper.nonDefaultMapper();
	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "名称");
	}

	@Autowired
	private XmlConfigService xmlConfigService;

	@RequestMapping(method = RequestMethod.GET)
	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = getCurrentUserId();

		Page<XmlConfig> xmlconfigs = xmlConfigService.getUserXmlConfig(userId, searchParams, pageNumber, pageSize, sortType);

		model.addAttribute("xmlconfigs", xmlconfigs);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "xmlconfig/xmlConfigList";
	}

	@RequestMapping(value = "select", method = RequestMethod.GET)
	public String select(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
			ServletRequest request) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		Long userId = getCurrentUserId();

		Page<XmlConfig> xmlconfigs = xmlConfigService.getUserXmlConfig(userId, searchParams, pageNumber, pageSize, sortType);

		model.addAttribute("xmlconfigs", xmlconfigs);
		model.addAttribute("sortType", sortType);
		model.addAttribute("sortTypes", sortTypes);
		// 将搜索条件编码成字符串，用于排序，分页的URL
		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

		return "xmlconfig/xmlconfigSelectList";
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("xmlConfig", new XmlConfig());
		model.addAttribute("xmlConfigJSON", binder.toJson(new XmlConfig()));
		model.addAttribute("action", "create");
		return "xmlconfig/xmlConfigForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public @ResponseBody String create(@RequestBody XmlConfig newXmlConfig, RedirectAttributes redirectAttributes) {
		User user = new User(getCurrentUserId());
		newXmlConfig.setUser(user);
		newXmlConfig.setCreateDate(new Date());
		newXmlConfig.setUpdateDate(new Date());
		xmlConfigService.saveXmlConfig(newXmlConfig);
		redirectAttributes.addFlashAttribute("message", "创建任务成功");
		return "redirect:/xmlconfig/";
	}
	
	@RequestMapping(value = "getXmlConfigById/{id}", method = RequestMethod.GET)
	public @ResponseBody XmlConfig getXmlConfigById(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		return xmlConfigService.getXmlConfigById(id);
	}
	
	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		XmlConfig xmlconfig = xmlConfigService.getXmlConfigById(id);
		model.addAttribute("xmlConfig",xmlconfig);
		model.addAttribute("xmlConfigJSON", binder.toJson(xmlconfig));
		model.addAttribute("action", "update");
		return "xmlconfig/xmlConfigForm";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public @ResponseBody String update(@RequestBody XmlConfig newXmlConfig, RedirectAttributes redirectAttributes) {
		User user = new User(getCurrentUserId());
		newXmlConfig.setUser(user);
		newXmlConfig.setUpdateDate(new Date());
		xmlConfigService.saveXmlConfig(newXmlConfig);
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/xmlconfig/";
	}
	
	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
}
