package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.sdp.model.Checkouts;

public interface CheckOutsRepository extends JpaRepository<Checkouts, Long>{

}
