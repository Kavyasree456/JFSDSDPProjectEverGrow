package com.klef.jfsd.springboot.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.klef.jfsd.springboot.sdp.model.Cart;


public interface CartRepository extends JpaRepository<Cart, Long> {
    List<Cart> findByInvestorId(Long investorId);
    
    @Transactional
    @Modifying
    @Query("DELETE FROM Cart c WHERE c.investorId = ?1 AND c.fundId = ?2")
    void deleteByInvestorIdAndFundId(Long investorId, Long fundId);
    
}
