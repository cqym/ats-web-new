package org.springside.examples.quickstart.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springside.examples.quickstart.entity.Module;
import org.springside.examples.quickstart.entity.XmlConfig;

public interface XmlConfigDao extends PagingAndSortingRepository<XmlConfig, Long>, JpaSpecificationExecutor<XmlConfig> {
	Page<Module> findByUserId(Long id, Pageable pageRequest);

	@Modifying
	@Query("delete from XmlConfig xc where xc.user.id=?1")
	void deleteByUserId(Long id);
}
