package com.klef.jfsd.springboot.sdp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.sdp.model.FundAdvisor;
import com.klef.jfsd.springboot.sdp.service.FundAdvisorService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FundAdvisorController {
	
	@Autowired
	FundAdvisorService fundAdvisorService;
	
	@GetMapping("fundAdvisorLogin")
	public ModelAndView fundAdvisorLogin() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("fundadvisor-login");
		return mv;
	}
	
	@PostMapping("checkfundadvisorlogin")
    public String checkFundAdvisorLogin(@RequestParam("login-email") String email, 
                                        @RequestParam("login-password") String password, 
                                        Model model) {
        FundAdvisor fundAdvisor = fundAdvisorService.validateLogin(email, password);
        if (fundAdvisor != null) {
            // Successful login
            return "fundadvisor-dashboard";  // Redirect to fund advisor's dashboard or homepage
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "fundadvisor-login";
        }
    }
	@PostMapping("registerFundAdvisor")
    public String registerFundAdvisor(HttpServletRequest request, Model model) {
        // Retrieve form data using HttpServletRequest
        String name = request.getParameter("name");
        String email = request.getParameter("register-email");
        String phone = request.getParameter("phone");
        int yearsOfExperience = Integer.parseInt(request.getParameter("yearsOfExperience"));
        String specialization = request.getParameter("specialization");
        String bio = request.getParameter("bio");
        String password = request.getParameter("password");
        System.out.println(email!=null?email:"notfound");

        FundAdvisor fundAdvisor = new FundAdvisor();
        fundAdvisor.setName(name);
        fundAdvisor.setEmail(email);
        fundAdvisor.setPhone(phone);
        fundAdvisor.setYearsOfExperience(yearsOfExperience);
        fundAdvisor.setSpecialization(specialization);
        fundAdvisor.setBio(bio);
        fundAdvisor.setPassword(password);

        boolean isRegistered = fundAdvisorService.registerFundAdvisor(fundAdvisor);
        if (isRegistered) {
            model.addAttribute("message", "Registration successful! Please log in.");
            return "redirect:/fundAdvisorLogin";
        } else {
            model.addAttribute("error", "Registration failed. Please try again.");
            return "fundadvisor-login";
        }
    }
	 @GetMapping("/fundadvisor-clientmanagement")
	    public String clientManagement() {
	        return "fundadvisor-clientmanagement";
	    }
}
