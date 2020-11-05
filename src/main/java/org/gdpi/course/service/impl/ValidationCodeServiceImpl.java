package org.gdpi.course.service.impl;

import lombok.Data;
import org.gdpi.course.entity.EmailCode;
import org.gdpi.course.service.ValidationCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * @author zhf
 */
@Service
@ConfigurationProperties(prefix = "validation.mail")
@Data
public class ValidationCodeServiceImpl implements ValidationCodeService {
    @Resource
    private JavaMailSenderImpl javaMailSender;
    private String template = "验证码为:{code}  {timeout}分钟内有效";
    private Integer timeout = 10;
    private String subject = "课程管理平台";

    private final String dataKey="data";
    private final String folderName="mail/";

    @Resource
    private TemplateEngine templateEngine;

    @Override
    public EmailCode sendEmailCode(String to) throws MessagingException {

        EmailCode emailCode = EmailCode.simpleMaleCode(to);
        emailCode.setTimeout(emailCode.getTimeout().plusMinutes(timeout));

        String msg = template.replace("{code}", emailCode.getCode())
                .replace("{timeout}", timeout+"");


        MimeMessageHelper messageHelper = new MimeMessageHelper(javaMailSender.createMimeMessage());

        messageHelper.setTo(to);
        messageHelper.setText(msg, true);
        messageHelper.setSubject(subject);
        messageHelper.setFrom(javaMailSender.getUsername());

        javaMailSender.send(messageHelper.getMimeMessage());


        return emailCode;
    }

    /**
     * Thymeleaf 模板邮件
     * @param to
     * @throws MessagingException
     */
    @Override
    public EmailCode sendThymeleafMail(String to,String templateName) throws MessagingException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        EmailCode emailCode = EmailCode.simpleMaleCode(to);
        emailCode.setTimeout(emailCode.getTimeout().plusMinutes(timeout));
        helper.setFrom(javaMailSender.getUsername());
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(generateStrFromTemplate(emailCode,templateName), true);
        javaMailSender.send(mimeMessage);

        return emailCode;
    }
    private String generateStrFromTemplate(EmailCode emailCode,String templateName){
        Context context = new Context();
        context.setVariable(dataKey, emailCode);
        //使用thymeleaf模板引擎渲染内容
        //此处渲染的文件默认以项目的templates文件夹作为根路径
        return templateEngine.process(folderName+ templateName, context);
    }
}
