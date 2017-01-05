package org.springside.examples.quickstart.service.module;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springside.examples.quickstart.entity.Module;
import org.springside.examples.quickstart.repository.ModuleDao;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

//Spring Bean的标识.
@Component
//类中所有public函数都纳入事务管理的标识.
@Transactional
public class ModuleService {

	private ModuleDao moduleDao;

	public Module getModule(Long id) {
		return moduleDao.findOne(id);
	}

	public void saveModule(Module entity) {
		moduleDao.save(entity);
	}

	public void deleteModule(Long id) {
		moduleDao.delete(id);
	}

	public List<Module> getAllModule() {
		return (List<Module>) moduleDao.findAll();
	}

	public Page<Module> getUserModule(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<Module> spec = buildSpecification(userId, searchParams);

		return moduleDao.findAll(spec, pageRequest);
	}

	/**
	 * 创建分页请求.
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "id");
		} else if ("title".equals(sortType)) {
			sort = new Sort(Direction.ASC, "title");
		}

		return new PageRequest(pageNumber - 1, pagzSize, sort);
	}

	/**
	 * 创建动态查询条件组合.
	 */
	private Specification<Module> buildSpecification(Long userId, Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
		Specification<Module> spec = DynamicSpecifications.bySearchFilter(filters.values(), Module.class);
		return spec;
	}

	@Autowired
	public void setModuleDao(ModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
}
