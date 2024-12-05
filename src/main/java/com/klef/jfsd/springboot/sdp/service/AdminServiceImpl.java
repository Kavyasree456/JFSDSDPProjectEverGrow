package com.klef.jfsd.springboot.sdp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.sdp.model.ActivityLogs;
import com.klef.jfsd.springboot.sdp.model.Admin;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;
import com.klef.jfsd.springboot.sdp.repository.ActivityLogsRepository;
import com.klef.jfsd.springboot.sdp.repository.AdminRepository;
import com.klef.jfsd.springboot.sdp.repository.InvestorRepository;
import com.klef.jfsd.springboot.sdp.repository.MutualFundRepository;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private InvestorRepository investorRepository;
	@Autowired
	private MutualFundRepository mutualFundRepository;
	@Autowired
	private ActivityLogsRepository activityLogsRepository; 

	@Override
	public Admin isAdminLogin(String email, String password) {
		return adminRepository.checkAdminLogin(email, password);
	}

	@Override
	public List<Investor> viewAllInvestors() {
		return investorRepository.findAll();
	}

	@Override
	public Investor viewInvestor(int id) {
		return investorRepository.findById(id).get();
	}

	@Override
	public String verifyInvestor(int id) {
	    Optional<Investor> optionalInvestor = investorRepository.findById(id);

	    if (optionalInvestor.isPresent()) {
	        Investor investor = optionalInvestor.get();
	        investor.setVerified(true);
	        investorRepository.save(investor);
	        
	        return "Investor verified successfully";
	    } else {
	        return "Investor not found. Please try again.";
	    }
	}
	@Override
	public String deleteInvestor(int id) {
		investorRepository.deleteById(id);
		return "Investor Deleted Successfully";
	}
	
	
	
	
	

	@Override
	public String addFund(MutualFund fund) {
		mutualFundRepository.save(fund);
		return "Fund added successfully";
	}

	@Override
	public List<MutualFund> viewAllFunds() {
		return mutualFundRepository.findAll();
	}

	@Override
	public String updateAdmin(Admin admin) {
		adminRepository.save(admin);
		return "Admin updated successfully";
	}

	@Override
	public String deleteFund(int id) {
		 mutualFundRepository.deleteById(id);
		 return "Deleted Successfully";
	}

	@Override
	public String insertActivityLog(ActivityLogs activityLogs) {
		 activityLogsRepository.save(activityLogs);
		 return "Inserted Successfully";
	}

	@Override
	public List<ActivityLogs> viewAllActivityLogs() {
		return activityLogsRepository.findAll();
	}

	@Override
	public String editFund(MutualFund mutualFund) {
		mutualFundRepository.save(mutualFund);
		return "Updated Successfully";
	}

	@Override
	public MutualFund viewFundById(long id) {
		return mutualFundRepository.findById((int) id).get();
	}

	


}
