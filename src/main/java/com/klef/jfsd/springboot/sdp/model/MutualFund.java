package com.klef.jfsd.springboot.sdp.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class MutualFund {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String fundName;

    @Column(nullable = false, length = 50)
    private String category; 

    @Column(nullable = false)
    private double nav;  

    @Column(nullable = false)
    private double expenseRatio;

    @Column(nullable = false, length = 50)
    private String riskLevel;  

    @Column(nullable = false)
    private Date launchDate;
    
    @Override
	public String toString() {
		return "MutualFund [id=" + id + ", fundName=" + fundName + ", category=" + category + ", nav=" + nav
				+ ", expenseRatio=" + expenseRatio + ", riskLevel=" + riskLevel + ", launchDate=" + launchDate
				+ ", expectedAnnualReturnRate=" + expectedAnnualReturnRate + ", active=" + active + ", imagePath="
				+ imagePath + "]";
	}

	@Column(nullable = false)
    private double expectedAnnualReturnRate;

    public double getExpectedAnnualReturnRate() {
		return expectedAnnualReturnRate;
	}

	public void setExpectedAnnualReturnRate(double expectedAnnualReturnRate) {
		this.expectedAnnualReturnRate = expectedAnnualReturnRate;
	}

	@Column(nullable = false)
    private boolean active = true;
    
    @Column(length = 255)
    private String imagePath;
    

    public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFundName() {
		return fundName;
	}

	public void setFundName(String fundName) {
		this.fundName = fundName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getNav() {
		return nav;
	}

	public void setNav(double nav) {
		this.nav = nav;
	}

	public double getExpenseRatio() {
		return expenseRatio;
	}

	public void setExpenseRatio(double expenseRatio) {
		this.expenseRatio = expenseRatio;
	}

	public String getRiskLevel() {
		return riskLevel;
	}

	public void setRiskLevel(String riskLevel) {
		this.riskLevel = riskLevel;
	}

	public Date getLaunchDate() {
		return launchDate;
	}

	public void setLaunchDate(Date launchDate) {
		this.launchDate = launchDate;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}
