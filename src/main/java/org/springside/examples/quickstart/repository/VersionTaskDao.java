package org.springside.examples.quickstart.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springside.examples.quickstart.entity.VersionTask;


public interface VersionTaskDao extends PagingAndSortingRepository<VersionTask, Long>, JpaSpecificationExecutor<VersionTask>{

	Page<VersionTask> findByUserId(Long id, Pageable pageRequest);

	@Modifying
	@Query("delete from VersionTask versionTask where versionTask.user.id=?1")
	void deleteByUserId(Long id);
	
	@Modifying
	@Query("select versionTask from VersionTask versionTask where versionTask.parentId=?1")
	List<VersionTask> findByParentId(Long parentId);

}
