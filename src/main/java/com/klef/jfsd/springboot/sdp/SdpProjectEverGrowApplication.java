package com.klef.jfsd.springboot.sdp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class SdpProjectEverGrowApplication {

	public static void main(String[] args) {
		SpringApplication.run(SdpProjectEverGrowApplication.class, args);
		System.out.println("Project running....");
	}
	@Bean
	public RestTemplate restTemplate() {
		RestTemplate restTemplate=new RestTemplate();
		return restTemplate;
	}
}
