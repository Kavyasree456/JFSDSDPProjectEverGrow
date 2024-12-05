package com.klef.jfsd.springboot.sdp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.sdp.model.Aadhar;

@Repository
public interface AadharRepository extends JpaRepository<Aadhar, Integer>{
	@Query("select a from Aadhar a where a.aadharNumber=?1 and a.aadharUsed=?2")
    Optional<Aadhar> checkAadhar(String aadharNumber, boolean aadharUsed);
}
