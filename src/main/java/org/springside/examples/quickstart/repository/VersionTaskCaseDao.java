package org.springside.examples.quickstart.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springside.examples.quickstart.entity.VersionTaskCase;

public interface VersionTaskCaseDao extends PagingAndSortingRepository<VersionTaskCase, Long>, JpaSpecificationExecutor<VersionTaskCase>{

}
