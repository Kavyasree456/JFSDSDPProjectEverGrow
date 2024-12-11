package com.klef.jfsd.springboot.sdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.sdp.model.FundAdvisor;
import com.klef.jfsd.springboot.sdp.repository.FundAdvisorRepository;

@Service
public class FundAdvisorServiceImpl implements FundAdvisorService{
	
	@Autowired
	FundAdvisorRepository  fundAdvisorRepository;
	
	public FundAdvisor validateLogin(String email, String password) {
        return fundAdvisorRepository.checkFundAdvisorLogin(email, password);
    }

	@Override
	public boolean registerFundAdvisor(FundAdvisor fundAdvisor) {
		fundAdvisorRepository.save(fundAdvisor);
		return false;
	}
}
