package com.klef.jfsd.springboot.sdp.service;

import com.klef.jfsd.springboot.sdp.model.FundAdvisor;

public interface FundAdvisorService {
	public FundAdvisor validateLogin(String email, String password) ;
	public boolean registerFundAdvisor(FundAdvisor fundAdvisor);
}
