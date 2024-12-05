package com.klef.jfsd.springboot.sdp.service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.klef.jfsd.springboot.sdp.model.Aadhar;
import com.klef.jfsd.springboot.sdp.model.Cart;
import com.klef.jfsd.springboot.sdp.model.Checkouts;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;
import com.klef.jfsd.springboot.sdp.model.TransactionHistory;
import com.klef.jfsd.springboot.sdp.repository.AadharRepository;
import com.klef.jfsd.springboot.sdp.repository.CartRepository;
import com.klef.jfsd.springboot.sdp.repository.CheckOutsRepository;
import com.klef.jfsd.springboot.sdp.repository.InvestorRepository;
import com.klef.jfsd.springboot.sdp.repository.MutualFundRepository;
import com.klef.jfsd.springboot.sdp.repository.TransactionHistoryRepository;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;

import jakarta.annotation.PostConstruct;

@Service
public class InvestorServiceImpl implements InvestorService{

	@Autowired
	private InvestorRepository investorRepository;
	
	@Autowired
	private AadharRepository aadharRepository;
	
	@Autowired
	private MutualFundRepository mutualFundRepository;
	
	@Autowired 
	private CartRepository cartRepository;
	
	@Autowired
	private CheckOutsRepository checkOutsRepository;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private TransactionHistoryRepository transactionHistoryRepository;
	
	

	
	@Override
	public String Register(Investor investor) {
	    String aadhar = investor.getProofOfIdentity();
	    Optional<Aadhar> aadharOptional = aadharRepository.checkAadhar(aadhar, false);

	    if (aadharOptional.isPresent()) {
	        Aadhar aadharObject = aadharOptional.get();
	        investor.setVerified(true);

	        aadharObject.setAadharUsed(true);
	        aadharRepository.save(aadharObject);
	    } else {
	        investor.setVerified(false); 
	    }

	    try {
	        investorRepository.save(investor);
	    } catch (DataIntegrityViolationException e) {
	        return "Error: Duplicate entry found. Please check the email, phone number, or proof of identity.";
	    }

	    // If successful, return success message
	    return "Investor Registered Successfully";
	}


	@Override
	public Investor checkLogin(String email, String password) {
		return investorRepository.checkInvestorLogin(email, password);
	}

	@Override
	public List<MutualFund> viewAllFunds() {
		return mutualFundRepository.findAll();
	}

	
	public void addToCart(Long investorId, Long fundId) {
        Cart cart = new Cart();
        cart.setInvestorId(investorId);
        cart.setFundId(fundId);
        cartRepository.save(cart);
    }

	@Override
	public List<Cart> viewCartById(Long id) {
		return cartRepository.findByInvestorId(id);
	}

	@Override
	public MutualFund viewFundById(long id) {
		return mutualFundRepository.findById((int) id).orElse(null);
	}

	@Override
	public String updateInvestor(Investor investor) {
		investorRepository.save(investor);
		return "Updates Succesffully";
	}

	@Override
	public String removeFromCart(long iid, long fid) {
		 cartRepository.deleteByInvestorIdAndFundId(iid, fid);
		 return "Removed from cart succcessfully";
	}

	@Override
	public String addCheckOut(Checkouts checkouts) {
		checkOutsRepository.save(checkouts);
		return "Added successfully";
	}

	@Override
	public List<Checkouts> viewAllCheckouts() {
		return checkOutsRepository.findAll();
	}
	
	public List<Object> viewAllApiFunds(){
	    Object[] funds = restTemplate.getForObject("https://api.mfapi.in/mf", Object[].class);
	    List<Object> fundsList=Arrays.asList(funds);
	    return fundsList.size()>10?fundsList.subList(0,10):fundsList;
	}

	
	public String addMoney(Double money, Investor investor) {
		Double oldBalance=investor.getCurrentBalance();
		investor.setCurrentBalance(oldBalance+money);
		investorRepository.save(investor);
		return "Money Added successfully";
	}
	

	public String withdrawMoney(Double withdrawAmount, Investor investor) {
	    Double oldBalance = investor.getCurrentBalance();
	    investor.setCurrentBalance(oldBalance - withdrawAmount);
	    investorRepository.save(investor);
	    return "Money withdrawn successfully";
	}


	@Override
	public String saveTransaction(TransactionHistory transactionHistory) {
		 transactionHistoryRepository.save(transactionHistory);
		 return "Transaction Saved successfully";
	}


	@Override
	public List<TransactionHistory> viewAllTransactions() {
		return transactionHistoryRepository.findAll();
	}


}
