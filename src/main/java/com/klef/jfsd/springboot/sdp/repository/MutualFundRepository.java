package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.sdp.model.MutualFund;

@Repository
public interface MutualFundRepository extends JpaRepository<MutualFund, Integer>{

}
