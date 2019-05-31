package com.icia.blueballoon.util;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;


import com.icia.blueballoon.data.dto.*;

import lombok.*;

@Component
@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class MailUtil {
	@Autowired
	private JavaMailSender mailSender;
	public void sendMail(Mail mail) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom(mail.getSender());
		messageHelper.setTo(mail.getReceiver());
		messageHelper.setSubject(mail.getTitle());
		messageHelper.setText(mail.getContent(), true);
		mailSender.send(message);

	}

}
