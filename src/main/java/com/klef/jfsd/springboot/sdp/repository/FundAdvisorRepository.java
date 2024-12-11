package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.sdp.model.Admin;
import com.klef.jfsd.springboot.sdp.model.FundAdvisor;

import java.util.List;

@Repository
public interface FundAdvisorRepository extends JpaRepository<FundAdvisor, Long> {
	@Query("select a from FundAdvisor a where a.email=?1 and a.password=?2")
	public FundAdvisor checkFundAdvisorLogin(String username, String password);
}
