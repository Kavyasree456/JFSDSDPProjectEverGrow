package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.sdp.model.Investor;

@Repository
public interface InvestorRepository extends JpaRepository<Investor, Integer>{
	@Query("select i from Investor i where i.email=?1 and i.password=?2")
	public Investor checkInvestorLogin(String email, String password);
}
