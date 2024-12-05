package com.klef.jfsd.springboot.sdp.service;

import org.springframework.stereotype.Service;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;

import jakarta.annotation.PostConstruct;

@Service
public class StripeService {

    private static final String SECRET_KEY = "sk_test_51Q2zfqGCZXTVQh0Q6LoAimkY0Dd9KcFkMkFDGPRaVM8ZNSNpqP10DQc9vrPhTVIY3iOS8xvV56K9S8s5AaRhOV2a00HcUPzCjv";

    @PostConstruct
    public void init() {
        Stripe.apiKey = SECRET_KEY;
    }

    public PaymentIntent createPaymentIntent(double amount) throws StripeException {
        PaymentIntentCreateParams params =
                PaymentIntentCreateParams.builder()
                        .setAmount((long) (amount * 100)) // Amount in cents
                        .setCurrency("usd")
                        .build();

        return PaymentIntent.create(params);
    }
}
