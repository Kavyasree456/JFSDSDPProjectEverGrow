package com.klef.jfsd.springboot.sdp.model;

import java.sql.Blob;
import java.util.Date;
import jakarta.persistence.*;

@Entity
public class Investor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 50)
    private String firstName;

    @Column(nullable = false, length = 50)
    private String lastName;

    @Column(nullable = false, unique = true, length = 100)
    private String email;

    @Column(nullable = false, length = 10, unique = true)
    private String phoneNumber;

    @Column(nullable = false)
    private Date dob;

    @Column(nullable = false, length = 50)
    private String state;

    @Column(nullable = false, length = 50)
    private String country;

    @Column(nullable = false, length = 100, unique = true)
    private String proofOfIdentity;

    @Column(nullable = false, length = 100)
    private String password;
    
    @Column
    private Double currentBalance;


	public Double getCurrentBalance() {
		return currentBalance;
	}

	public void setCurrentBalance(Double currentBalance) {
		this.currentBalance = currentBalance;
	}

	@Column(nullable = false)
    private boolean verified;  
    
    @Column(name="Image")
    private Blob profileImage;

    
    @Override
	public String toString() {
		return "Investor [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", dob=" + dob + ", state=" + state + ", country=" + country
				+ ", proofOfIdentity=" + proofOfIdentity + ", password=" + password + ", currentBalance="
				+ currentBalance + ", verified=" + verified + ", profileImage=" + profileImage + "]";
	}
    
    public Blob getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(Blob profileImage) {
		this.profileImage = profileImage;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProofOfIdentity() {
        return proofOfIdentity;
    }

    public void setProofOfIdentity(String proofOfIdentity) {
        this.proofOfIdentity = proofOfIdentity;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }
}
