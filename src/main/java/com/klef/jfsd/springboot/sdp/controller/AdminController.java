package com.klef.jfsd.springboot.sdp.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.sdp.model.ActivityLogs;
import com.klef.jfsd.springboot.sdp.model.Admin;
import com.klef.jfsd.springboot.sdp.model.Investor;
import com.klef.jfsd.springboot.sdp.model.MutualFund;
import com.klef.jfsd.springboot.sdp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/test")
	public ModelAndView test() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@GetMapping("/adminlogin")
	public ModelAndView adminLogin() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("admin-login");
		return mv;
	}
	@PostMapping("/checklogin")
	public ModelAndView checklogin(HttpServletRequest request) {
		HttpSession session=request.getSession();
		
		
	    String username = request.getParameter("email");
	    String password = request.getParameter("password");

	    Admin admin = adminService.isAdminLogin(username, password);
	    ModelAndView mv = new ModelAndView();
	    
	    if (admin != null) {
	    	session.setAttribute("admin", admin);
	    	//session.setMaxInactiveInterval(5);
	        mv.setViewName("admin-dashboard"); 
	        mv.addObject("admin", admin); 
	    } else {
	        mv.setViewName("admin-login"); 
	        mv.addObject("errorMessage", "Login Failed"); 
	    }
	    return mv;
	}
	@GetMapping("admin-dashboard")
	public ModelAndView admindashboard() {
		ModelAndView mv=new ModelAndView("admin-dashboard");
		
		return mv;
	}
	
	@GetMapping("admin-profile")
	public ModelAndView adminprofile() {
		ModelAndView mv=new ModelAndView("admin-profile");
		
		return mv;
	}
	@PostMapping("updateadminprofile")
	public ModelAndView updateProfile(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		
		
		String firstname=request.getParameter("firstName");
		String lastname=request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		
		admin.setFirstName(firstname);
		admin.setLastName(lastname);
		admin.setPhoneNumber(phoneNumber);
		admin.setPassword(password);
		
		
		 
		session.setAttribute("admin", admin);
	    mv.setViewName("redirect:/admin-profile");
		return mv;
	}
	
	@GetMapping("viewAllInvestors")
	public ModelAndView viewAllInvestors() {
		ModelAndView mv=new ModelAndView("admin-viewall");
		List<Investor> investors = adminService.viewAllInvestors();
        mv.addObject("investors", investors);
		
		return mv;
	}
	@GetMapping("admin-viewuserdetails")
	public ModelAndView viewUserDetails(@RequestParam("id") int userId) {
	    ModelAndView mv = new ModelAndView("admin-viewuserdetails"); 
	    Investor investor = adminService.viewInvestor(userId);
	    mv.addObject("user", investor); 
	    return mv;
	}
	
	@GetMapping("admin-verifyuser")
	public ModelAndView verifyUser(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.verifyInvestor(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewAllInvestors");
	    
	    
	    return mv;
	}
	@GetMapping("admin-deleteuser")
	public ModelAndView deleteuser(@RequestParam("id") int id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.deleteInvestor(id);
	    
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewAllInvestors");
	    
	    return mv;
	}
	
	
	@GetMapping("admin-deletefund")
	public ModelAndView adminDeleteFund( @RequestParam("id") int id, HttpServletRequest request ) {
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();
		
		
		String msg=  adminService.deleteFund(id);
		session.setAttribute("msg", msg);
	    mv.setViewName("redirect:/viewAllFunds");
	    
		return mv;
	}
	@GetMapping("admin-editfund")
	public ModelAndView adminEditFund(@RequestParam("id") int id, HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();
	    
	    MutualFund fund = adminService.viewFundById(id);
	    
	    if (fund != null) {
	        mv.addObject("fund", fund);
	        mv.setViewName("admin-editFund");  
	    } else {
	        session.setAttribute("msg", "Fund not found.");
	        mv.setViewName("redirect:/admin-viewallfunds");
	    }
	    
	    return mv;
	}
	@PostMapping("admin-updatefund")
	public String adminUpdateFund(HttpServletRequest request, @RequestParam("fundImage") MultipartFile file) {
	    HttpSession session = request.getSession();

	    Long id = Long.parseLong(request.getParameter("id"));
	    String fundName = request.getParameter("fundName");
	    String category = request.getParameter("category");
	    double nav = Double.parseDouble(request.getParameter("nav"));
	    double expenseRatio = Double.parseDouble(request.getParameter("expenseRatio"));
	    String riskLevel = request.getParameter("riskLevel");
	    Date launchDate = Date.valueOf(request.getParameter("launchDate"));  

	    MutualFund fund = adminService.viewFundById(id);

	    if (fund != null) {
	        fund.setFundName(fundName);
	        fund.setCategory(category);
	        fund.setNav(nav);
	        fund.setExpenseRatio(expenseRatio);
	        fund.setRiskLevel(riskLevel);
	        fund.setLaunchDate(launchDate);
	        if (file != null && !file.isEmpty()) {
	            try {
	                String fileName = file.getOriginalFilename();
	                String uploadDir = "/Users/nukalapradeep/Desktop/SATYAS FOLDER/2024-25 ODD SEM/JFSD/SDP/SDPProjectEverGrow/src/main/webapp/fundImages"; 
	                File uploadFile = new File(uploadDir, fileName);
	                file.transferTo(uploadFile);
	                
	                fund.setImagePath(uploadDir + "/" + fileName);
	            } catch (IOException e) {
	                session.setAttribute("msg", "Failed to upload image.");
	                return "redirect:/admin-editfund?id=" + id;
	            }
	        }

	        adminService.editFund(fund);
	        session.setAttribute("msg", "Fund updated successfully.");
	    } else {
	        session.setAttribute("msg", "Fund not found.");
	    }

	    return "redirect:/viewAllFunds";
	}



	
	
	@GetMapping("addFunds")
	public ModelAndView addFunds() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("admin-addFund");
		
		return mv;
	}
	@PostMapping("add-fund")
	public ModelAndView addFund(HttpServletRequest request, @RequestParam("fundImage") MultipartFile file) {
	    ModelAndView mv = new ModelAndView();
	    String fundName = request.getParameter("fundName");
	    String category = request.getParameter("category");
	    double nav = Double.parseDouble(request.getParameter("nav"));
	    double expenseRatio = Double.parseDouble(request.getParameter("expenseRatio"));
	    String riskLevel = request.getParameter("riskLevel");
	    String launchDate = request.getParameter("launchDate");
	    double returnValue=Double.parseDouble(request.getParameter("expectedAnnualReturnRate"));

	    MutualFund fund = new MutualFund();
	    fund.setFundName(fundName);
	    fund.setCategory(category);
	    fund.setNav(nav);
	    fund.setExpenseRatio(expenseRatio);
	    fund.setRiskLevel(riskLevel);
	    fund.setLaunchDate(java.sql.Date.valueOf(launchDate));
	    fund.setExpectedAnnualReturnRate(returnValue);

	    if (!file.isEmpty() && (file.getContentType().equals("image/jpeg") || file.getContentType().equals("image/png"))) {
	        try {
	            String uploadDir = request.getServletContext().getRealPath("/fundImages/");
	            File directory = new File(uploadDir);
	            if (!directory.exists()) {
	                directory.mkdirs(); 
	            }

	            String fileName = file.getOriginalFilename();
	            String filePath = uploadDir + File.separator + fileName;
	            file.transferTo(new File(filePath));
	            
	            fund.setImagePath("fundImages/" + fileName);

	        } catch (Exception e) {
	            e.printStackTrace();
	            mv.addObject("msg", "Error uploading file.");
	            mv.setViewName("ErrorPage");
	            return mv;
	        }
	    } else {
	        mv.addObject("msg", "Please upload a valid JPEG or PNG image.");
	        mv.setViewName("ErrorPage");
	        return mv;
	    }

	    String msg = adminService.addFund(fund);
	    mv.addObject("msg", msg);
	    mv.setViewName("redirect:/viewAllFunds");
	    return mv;
	}

	
	@GetMapping("viewAllFunds")
	public ModelAndView viewAllFunds() {
		ModelAndView mv=new ModelAndView();
		List<MutualFund> Funds=adminService.viewAllFunds();
		mv.addObject("funds",Funds);
		mv.setViewName("admin-viewallfunds");
		return mv;
	}
	
	@GetMapping("adminfeedback")
	public ModelAndView adminfeedback() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin-feedback");
		return mv;
	}
	
	@GetMapping("adminuseractivites")
	public ModelAndView adminuseractivites() {
		ModelAndView mv = new ModelAndView();
		List<ActivityLogs> activityLogs=adminService.viewAllActivityLogs();
		
		mv.addObject("activitylogs", activityLogs);
		mv.setViewName("admin-useractivites");
		return mv;
	}
	
	
	
	
	
	
	
	
	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		HttpSession session=request.getSession();
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
}
