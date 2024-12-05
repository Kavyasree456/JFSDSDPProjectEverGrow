package com.klef.jfsd.springboot.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.springboot.sdp.model.TransactionHistory;

public interface TransactionHistoryRepository extends JpaRepository<TransactionHistory, Long> {

}
