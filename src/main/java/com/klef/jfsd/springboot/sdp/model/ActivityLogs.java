package com.klef.jfsd.springboot.sdp.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
public class ActivityLogs {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "investor_id", nullable = false)
    private Long investorId;

    @Column(name = "investor_name", nullable = false)
    private String investorName;

    @Column(name = "activity", nullable = false)
    private String activity;

    @Column(name = "timestamp", nullable = false)
    private LocalDateTime timestamp;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getInvestorId() {
		return investorId;
	}

	public void setInvestorId(Long investorId) {
		this.investorId = investorId;
	}

	public String getInvestorName() {
		return investorName;
	}

	public void setInvestorName(String investorName) {
		this.investorName = investorName;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public LocalDateTime getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(LocalDateTime timestamp) {
		this.timestamp = timestamp;
	}
    
    
}
