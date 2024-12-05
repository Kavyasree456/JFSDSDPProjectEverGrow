package com.klef.jfsd.springboot.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Aadhar {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    

	@Column(nullable = false, unique = true, length = 12)
    private String aadharNumber;	
    
    @Column(nullable = false)
    private boolean aadharUsed;
    
    
    
    
    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAadharNumber() {
		return aadharNumber;
	}

	public void setAadharNumber(String aadharNumber) {
		this.aadharNumber = aadharNumber;
	}

	public boolean isAadharUsed() {
		return aadharUsed;
	}

	public void setAadharUsed(boolean aadharUsed) {
		this.aadharUsed = aadharUsed;
	}
}
