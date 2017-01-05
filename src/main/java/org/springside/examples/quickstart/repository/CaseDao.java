package org.springside.examples.quickstart.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springside.examples.quickstart.entity.CaseNode;

public interface CaseDao extends PagingAndSortingRepository<CaseNode, Long>, JpaSpecificationExecutor<CaseNode>{

	Page<CaseNode> findByUserId(Long id, Pageable pageRequest);

	@Modifying
	@Query("delete from CaseNode caseNode where caseNode.user.id=?1")
	void deleteByUserId(Long id);
	
	@Modifying
	@Query("select caseNode from CaseNode caseNode where caseNode.parentId=?1")
	List<CaseNode> findByParentId(Long parentId);
}
