package com.klef.jfsd.springboot.sdp.service;

import java.util.List;

import com.klef.jfsd.springboot.sdp.model.ActivityLogs;
import com.klef.jfsd.springboot.sdp.model.Admin;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;

public interface AdminService {
	public Admin isAdminLogin(String email, String password);
	public String updateAdmin(Admin admin);
	
	public List<Investor> viewAllInvestors();
	public Investor viewInvestor(int id);
	public String verifyInvestor(int id);
	public String deleteInvestor(int id);
	public String insertActivityLog(ActivityLogs activityLogs);
	public List<ActivityLogs> viewAllActivityLogs();
	
	public String addFund(MutualFund fund);
	public List<MutualFund> viewAllFunds();
	public MutualFund viewFundById(long id);
	public String editFund(MutualFund mutualFund);
	public String deleteFund(int id);
}
