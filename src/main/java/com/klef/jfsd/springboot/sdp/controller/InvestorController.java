package com.klef.jfsd.springboot.sdp.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.sdp.model.ActivityLogs;
import com.klef.jfsd.springboot.sdp.model.Cart;
import com.klef.jfsd.springboot.sdp.model.Checkouts;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;
import com.klef.jfsd.springboot.sdp.model.TransactionHistory;
import com.klef.jfsd.springboot.sdp.service.AdminService;
import com.klef.jfsd.springboot.sdp.service.InvestorService;
import com.klef.jfsd.springboot.sdp.service.StripeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InvestorController {
	
	@Autowired
	private InvestorService investorService;
	@Autowired
	private AdminService adminService;
	

	
//	
//	@GetMapping("/")
//	public ModelAndView homepage() {
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("index");
//		return mv;
//	}
	
	@GetMapping("investorlogin")
	public ModelAndView investorlogin() {
		ModelAndView mv=new ModelAndView("login");
		
		
		return mv;
	}
	
	@PostMapping("/checkinvestorlogin")
	public ModelAndView checkInvestorLogin(HttpServletRequest request) {
	    String email = request.getParameter("login-email");
	    String password = request.getParameter("login-password");
	    ModelAndView mv = new ModelAndView();

	    System.out.println(email + " " + password);

	    Investor investor = investorService.checkLogin(email, password);

	    if (investor == null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("error", "Check your credentials");
	        mv.setViewName("redirect:/investorlogin"); 
	    } else if (!investor.isVerified()) {
	        mv.addObject("msg", "Your account is not verified. Kindly contact Admin (in Contact page)");
	        mv.setViewName("ErrorPage");
	        System.out.println(investor.toString()+"");
	    } else {
	        HttpSession session = request.getSession();
	        session.setAttribute("investor", investor);
	        List<MutualFund> fund=investorService.viewAllFunds();
			session.setAttribute("funds", fund);
			System.out.println(fund);
			
			
			//activity log code rasaaaaaaaaaa
//			long id=investor.getId();
//			String activity="Logged In" ;
//			String name=investor.getFirstName()+" "+investor.getLastName();
//			
//			logActivity(id, activity, name);
			
			
	        
	        mv.setViewName("redirect:/dashboard");
	        System.out.println(investor.toString());
	    }
	    return mv;
	}
	@GetMapping("/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("dashboard");
		HttpSession session=request.getSession();
		Investor investor=(Investor) session.getAttribute("investor");
		
		if(investor==null) {
			mv.setViewName("/");
		}
		long id=investor.getId();
		System.out.println("Id: "+id);
		List<Checkouts> checkouts=investorService.viewAllCheckouts();
		
		List<Checkouts> investorcheckout=new ArrayList<Checkouts>();
		for(Checkouts c:checkouts) {
			if(c.getUserId()==id) {
				investorcheckout.add(c);
			}
		}
		mv.addObject("checkouts", investorcheckout);
		return mv;
	}

	
	
	@PostMapping("/register")
	public ModelAndView register(HttpServletRequest request, @RequestParam("profileimage") MultipartFile file) throws SerialException, SQLException, IOException {
	    ModelAndView mv = new ModelAndView();
	    
	    try {
	        byte[] bytes = file.getBytes();
	        Blob profilepic = new javax.sql.rowset.serial.SerialBlob(bytes);

	        String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	        String email = request.getParameter("email");
	        String phoneNumber = request.getParameter("phoneNumber");
	        String dobString = request.getParameter("dob"); 
	        String state = request.getParameter("state");
	        String country = request.getParameter("country");
	        String proofOfIdentity = request.getParameter("proofOfIdentity");
	        String password = request.getParameter("password");

	        Date dob;
	        try {
	            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	            dob = formatter.parse(dobString);
	        } catch (ParseException e) {
	            e.printStackTrace();
	            // Set the error message in session and redirect to investor login
	            request.getSession().setAttribute("error", "Invalid date format.");
	            mv.setViewName("redirect:/investorlogin");
	            return mv;
	        }

	        Investor investor = new Investor();
	        investor.setFirstName(firstName);
	        investor.setLastName(lastName);
	        investor.setEmail(email);
	        investor.setPhoneNumber(phoneNumber);
	        investor.setDob(dob);
	        investor.setState(state);
	        investor.setCountry(country);
	        investor.setProofOfIdentity(proofOfIdentity);
	        investor.setPassword(password); 
	        investor.setProfileImage(profilepic);

	        investorService.Register(investor);

	        long id = investor.getId();
	        String activity = "Registered";
	        String name = investor.getFirstName() + " " + investor.getLastName();
	        logActivity(id, activity, name);

	        mv.setViewName("redirect:/investorlogin");
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println(e.getMessage());
	        request.getSession().setAttribute("error", "Registration failed. Please try again.");
	        mv.setViewName("redirect:/investorlogin");
	    }

	    return mv;
	}

	@GetMapping("displayprofimage")
	public ResponseEntity<byte[]> displayprodimagedemo(HttpServletRequest request) throws Exception
	{
	  HttpSession session=request.getSession();
	  Investor investor= (Investor)session.getAttribute("investor");
	  
	  byte [] imageBytes = null;
	  imageBytes = investor.getProfileImage().getBytes(1,(int) investor.getProfileImage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	  
	}
	
	@GetMapping("displayFunds")
	public ModelAndView viewAllFunds() {
		ModelAndView mv=new  ModelAndView();
		List<MutualFund> funds =  investorService.viewAllFunds();
		mv.addObject("funds", funds);
		mv.setViewName("app-displayFunds");
		System.out.println("Funds"+funds.get(0).getFundName());
		return mv;
	}
	
	
	@PostMapping("/addToCart")
    public ModelAndView addToCart(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("redirect:/cart");
		long investorId=Long.parseLong(request.getParameter("iid")); 
		long fundId=Long.parseLong(request.getParameter("fid")); 
        investorService.addToCart(investorId, fundId);
        return mv;
    }
	@PostMapping("removeFromCart")
	public ModelAndView removeFromCart(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		long investorId=Long.parseLong(request.getParameter("iid")); 
		long fundId=Long.parseLong(request.getParameter("fid")); 
		investorService.removeFromCart(investorId, fundId);
		
		mv.setViewName("redirect:/cart");
		return mv;
	}
	
	@GetMapping("cart")
	public ModelAndView cart(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("app-cart");
		HttpSession session=request.getSession();
		Investor investor=(Investor) session.getAttribute("investor");
		long id=investor.getId();
		
		List<Cart> cartItems=investorService.viewCartById(id);
		List<MutualFund> funds=new ArrayList<MutualFund>();
		for(Cart c:cartItems) {
			long fundid;
			if(c!=null) {
				fundid=c.getFundId();
				MutualFund mutualFund=investorService.viewFundById(fundid);
				if(!funds.contains(mutualFund)) {
					funds.add(mutualFund);
				}
			}
		}
		System.out.println(cartItems);
		mv.addObject("cartItems", funds);
		return mv;
	}

	
	
	
	@GetMapping("investorProfile")
	public ModelAndView investorProfile() {
		ModelAndView mv=new ModelAndView("app-profile");
		return mv;
	}
	
	@PostMapping("/updateProfile")
	public ModelAndView updateProfile(HttpServletRequest request, HttpSession session,@RequestParam("profilePicture") MultipartFile file) throws IOException, SerialException, SQLException {
		
		byte[] bytes = file.getBytes();
		Blob profilepic = new javax.sql.rowset.serial.SerialBlob(bytes);
	    ModelAndView mv = new ModelAndView();

	    Investor investor = (Investor) session.getAttribute("investor");
	    if (investor == null) {
	        mv.addObject("errorMessage", "Investor not found in session.");
	        mv.setViewName("redirect:/investorProfile");
	        return mv;
	    }
	    

	    String firstName = request.getParameter("firstName");
	    String lastName = request.getParameter("lastName");
	    String phoneNumber = request.getParameter("phoneNumber");
	    String state = request.getParameter("state");
	    String country = request.getParameter("country");
	    String dobStr = request.getParameter("dob");
	    String password = request.getParameter("password");

	    if (dobStr == null || dobStr.isEmpty()) {
	        mv.addObject("errorMessage", "Date of Birth is required.");
	        mv.setViewName("redirect:/investorProfile");
	        return mv;
	    }

	    Date dob;
	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        dob = formatter.parse(dobStr);
	    } catch (ParseException e) {
	        mv.addObject("errorMessage", "Invalid date format.");
	        mv.setViewName("redirect:/investorProfile");
	        return mv;
	    }

	    investor.setFirstName(firstName);
	    investor.setLastName(lastName);
	    investor.setPhoneNumber(phoneNumber);
	    investor.setState(state);
	    investor.setCountry(country);
	    investor.setPassword(password);
	    investor.setDob(dob);
	    investor.setProfileImage(profilepic);

	    investorService.updateInvestor(investor);

	    session.setAttribute("message", "Profile updated successfully");
	    session.setAttribute("investor", investor);
	    mv.setViewName("redirect:/investorProfile");

	    return mv;
	}

	
	
	
	@GetMapping("fundcalculator")
	public ModelAndView fundcalculator() {
		ModelAndView mv=new ModelAndView("app-fundcalculator");
		return mv;
	}
	
	
	
	@GetMapping("fundcomparer")
	public ModelAndView fundcomparer(HttpServletRequest request, HttpSession session) {
		ModelAndView mv=new ModelAndView("app-fundcomparer");	
		return mv;
	}
	
	@PostMapping("/addToCompare")
	public String addToCompare(@RequestParam("fundId") Long fundId, HttpSession session) {
	    List<MutualFund> funds = (List<MutualFund>) session.getAttribute("funds");
	    List<MutualFund> selectedFunds = (List<MutualFund>) session.getAttribute("selectedFunds");

	    if (selectedFunds == null) {
	        selectedFunds = new ArrayList<>();
	    }
	    if(selectedFunds.size() < 2) {
	        for (MutualFund fund : funds) {
	            if (fund.getId().equals(fundId) && !selectedFunds.contains(fund)) {
	                selectedFunds.add(fund);
	                break;
	            }
	        }
	    } else {
	        session.setAttribute("message", "You can compare only two funds at a time.");
	    }

	    session.setAttribute("selectedFunds", selectedFunds);
	    return "redirect:/fundcomparer";
	}

	
	
	
	@GetMapping("investmentGoals")
	public ModelAndView investmentGoals() {
		ModelAndView mv=new ModelAndView("app-investmentgoals");
		return mv;
	}
	@GetMapping("transactionHistory")
	public ModelAndView transactionHistory() {
		ModelAndView mv=new ModelAndView("app-transactionhistory");
		return mv;
	}
	@GetMapping("investorWallet")
	public ModelAndView investorWallet(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView("app-wallet");
		HttpSession session=request.getSession();
		
		
		mv.addObject( "investor", session.getAttribute("investor"));
		return mv;
	}
	
	@GetMapping("checkout")
	public ModelAndView showCheckoutPage(@RequestParam("iid")long iid, @RequestParam("fid") long fid) {
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("iid", iid);
		mv.addObject("fid", fid);
		MutualFund fund=adminService.viewFundById(fid);
		mv.addObject("fund", fund);
		mv.setViewName("app-checkout");
		
		System.out.println("IID: "+iid+"  fid: "+fid);
		return mv;
	}
	@PostMapping("processFixedAmountCheckout")
	public ModelAndView checkoutLumpSum(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		long iid=Long.parseLong(request.getParameter("iid"));
		long fid=Long.parseLong(request.getParameter("fid"));
		double amount=Double.parseDouble(request.getParameter("fixedAmount"));
		int years=Integer.parseInt(request.getParameter("years"));
		
		
		Checkouts checkouts=new Checkouts();
		checkouts.setUserId(iid);
		checkouts.setFundId(fid);
		checkouts.setAmount(amount);
		checkouts.setYears(years);
		checkouts.setCategory("fixed");
		System.out.println("nptg");
		mv.setViewName("redirect:/displayFunds");
		investorService.addCheckOut(checkouts);
		
		return mv;
	}
	
	@GetMapping("viewAllCheckOuts")
	public ModelAndView viewAllCheckOuts(HttpServletRequest request){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("app-viewAllCheckOuts");
		HttpSession session=request.getSession();
		Investor investor=(Investor) session.getAttribute("investor");
		long id=investor.getId();
		System.out.println("Id: "+id);
		List<Checkouts> checkouts=investorService.viewAllCheckouts();
		
		List<Checkouts> investorcheckout=new ArrayList<Checkouts>();
		for(Checkouts c:checkouts) {
			if(c.getUserId()==id) {
				investorcheckout.add(c);
			}
		}
		mv.addObject("checkouts", investorcheckout);
		return mv;
	}
	@GetMapping("viewCheckoutDetails")
	public ModelAndView viewCheckoutDetails(@RequestParam("checkoutId") long fundid) {
		ModelAndView mv=new ModelAndView("app-viewCheckoutDetails");
		MutualFund fund=investorService.viewFundById(fundid);
		System.out.println(fund.toString());
		
		mv.addObject("fund", fund);
		return mv;
	}
	
	
	public void logActivity(Long investorId, String activity, String investorName) {
        ActivityLogs activityLog = new ActivityLogs();
        activityLog.setInvestorId(investorId);
        activityLog.setActivity(activity);
        activityLog.setInvestorName(investorName);
        activityLog.setTimestamp(LocalDateTime.now());
        
        adminService.insertActivityLog(activityLog);
    }
	
	
	@GetMapping("viewAllAPIFunds")
	@ResponseBody
	public ModelAndView viewAllApiFunds(){
		List<Object> funds=investorService.viewAllApiFunds();
		ModelAndView mv=new ModelAndView("app-viewFundsByAPI");
		mv.addObject("funds", funds);
		return mv;
	}
	
	@PostMapping("/addMoney")
	public ModelAndView addMoney(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    Double money = Double.parseDouble(request.getParameter("money"));
	    HttpSession session = request.getSession();
	    Investor investor = (Investor) session.getAttribute("investor");
	    
	    String clientSecret = investorService.addMoney(money, investor);
	    
	    long id = investor.getId();
	    String activity = "Add Money (Rupees) " + money;
	    String name = investor.getFirstName() + " " + investor.getLastName();
	    logActivity(id, activity, name);
	    
	    TransactionHistory history = new TransactionHistory();
	    history.setUserId(id);
	    history.setTransactionType("Add Money");
	    history.setAmount(money);
	    history.setTransactionDate(LocalDateTime.now()); 
	    
	    investorService.saveTransaction(history);
	    
	    session.setAttribute("msg", "Please complete your payment.");
	    session.setAttribute("clientSecret", clientSecret);
	    session.setAttribute("investor", investor);
	    mv.setViewName("redirect:/investorWallet");
	    return mv;
	}
	
	

	@PostMapping("/withdrawMoney")
	public String withdrawMoney(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    Investor investor = (Investor) session.getAttribute("investor");
	    
	    try {
	        Double withdrawAmount = Double.parseDouble(request.getParameter("withdrawAmount"));
	        if (investor.getCurrentBalance() >= withdrawAmount) {
	            String msg = investorService.withdrawMoney(withdrawAmount, investor);
	            long id=investor.getId();
				String activity="With Draw (Rupees) "+ withdrawAmount;
				String name=investor.getFirstName()+" "+investor.getLastName();
				
				logActivity(id, activity, name);
	            session.setAttribute("msg", msg);
	        } else {
	            session.setAttribute("msg", "Insufficient balance for withdrawal.");
	        }
	        
	        session.setAttribute("investor", investor);  
	    } catch (NumberFormatException e) {
	        session.setAttribute("msg", "Invalid amount. Please enter a valid number.");
	    }
	    
	    return "redirect:/investorWallet";
	
	}
}
