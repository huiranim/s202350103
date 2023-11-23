package com.choongang.s202350103.htService;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EmailService {
	private final JavaMailSender javaMailSender;

    public void sendEmail(String to, String subject, String text) {
    	System.out.println("sendEmail service Start");
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        
        System.out.println("sendEmail message--> " + message);
        try {
        	javaMailSender.send(message);
		} catch (Exception e) {
			System.out.println("EmailService Exception -> " + e.getMessage());
		}
    }
}
