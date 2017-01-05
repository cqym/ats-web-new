package org.springside.examples.quickstart.service.configXml;

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
import org.springside.examples.quickstart.entity.XmlConfig;
import org.springside.examples.quickstart.repository.XmlConfigDao;
import org.springside.modules.persistence.DynamicSpecifications;
import org.springside.modules.persistence.SearchFilter;
import org.springside.modules.persistence.SearchFilter.Operator;

//Spring Bean的标识.
@Component
//类中所有public函数都纳入事务管理的标识.
@Transactional
public class XmlConfigService {
	private XmlConfigDao xmlConfigDao;

	public XmlConfigDao getXmlConfigDao() {
		return xmlConfigDao;
	}

	public void saveXmlConfig(XmlConfig entity) {
		xmlConfigDao.save(entity);
	}

	public void deleteXmlCoinfig(Long id) {
		xmlConfigDao.delete(id);
	}

	public XmlConfig getXmlConfigById(Long id){
		return xmlConfigDao.findOne(id);
	}
	
	public List<XmlConfig> getAllXmlConfig() {
		return (List<XmlConfig>) xmlConfigDao.findAll();
	}
	
	public Page<XmlConfig> getUserXmlConfig(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
			String sortType) {
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
		Specification<XmlConfig> spec = buildSpecification(userId, searchParams);

		return xmlConfigDao.findAll(spec, pageRequest);
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
	private Specification<XmlConfig> buildSpecification(Long userId, Map<String, Object> searchParams) {
		Map<String, SearchFilter> filters = SearchFilter.parse(searchParams);
		filters.put("user.id", new SearchFilter("user.id", Operator.EQ, userId));
		Specification<XmlConfig> spec = DynamicSpecifications.bySearchFilter(filters.values(), XmlConfig.class);
		return spec;
	}

	@Autowired
	public void setXmlConfigDao(XmlConfigDao xmlConfigDao) {
		this.xmlConfigDao = xmlConfigDao;
	}
}
