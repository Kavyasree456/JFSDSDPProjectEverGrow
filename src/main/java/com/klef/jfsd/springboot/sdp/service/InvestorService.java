package com.klef.jfsd.springboot.sdp.service;

import java.util.List;

import com.klef.jfsd.springboot.sdp.model.Cart;
import com.klef.jfsd.springboot.sdp.model.Checkouts;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;
import com.klef.jfsd.springboot.sdp.model.TransactionHistory;

public interface InvestorService {
	public String Register(Investor investor);
	public Investor checkLogin(String email, String password);
	public String updateInvestor(Investor investor);
	
	public List<MutualFund> viewAllFunds();
	public List<Object> viewAllApiFunds();
	public MutualFund viewFundById(long id);
	
	
    public void addToCart(Long investorId, Long fundId) ;
    public List<Cart> viewCartById(Long id);
    public String removeFromCart(long iid,long fid);
    
    public String addCheckOut(Checkouts checkouts);
    public List<Checkouts> viewAllCheckouts();
    
    public String addMoney(Double money, Investor investor);
    public String withdrawMoney(Double withdrawAmount, Investor investor);
    public String saveTransaction(TransactionHistory transactionHistory);
    public List<TransactionHistory> viewAllTransactions();
}
