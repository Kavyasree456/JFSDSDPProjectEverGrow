package com.klef.jfsd.springboot.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Checkouts {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long userId;

    @Column(nullable = false)
    private Long fundId;

    @Column(nullable = false)
    private double amount;
    
    @Column(nullable = false)
    private String category;

   
    
    public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(nullable = false)
    private int years;

	@Override
	public String toString() {
		return "Checkouts [id=" + id + ", userId=" + userId + ", fundId=" + fundId + ", amount=" + amount
				 + ", years=" + years + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getFundId() {
		return fundId;
	}

	public void setFundId(Long fundId) {
		this.fundId = fundId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}
	
}
