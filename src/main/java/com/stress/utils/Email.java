/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stress.utils;

import com.sun.mail.smtp.SMTPMessage;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



/**
 *
 * @author DELL
 */
public class Email {

    public static boolean sendEmail(String email, String code,String content,String subject) {
        boolean test = false;

        String toEmail = email;
        final String fromEmail = "carbookingstress@gmail.com";
        final String password = "wrlwvsuuhklrkaip";
        
        try {
            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            
            //set email message details
            MimeMessage mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject(subject);
            String message = content+ code;
            mess.setText(message, "utf-8");
            Transport.send(mess);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    
    public static Session buildGoogleSession() {
        Properties mailProps = new Properties();
        mailProps.put("mail.transport.protocol", "smtp");
        mailProps.put("mail.host", "smtp.gmail.com");
        mailProps.put("mail.from", "minhhieutb321@gmail.com");
        mailProps.put("mail.smtp.starttls.enable", "true");
        mailProps.put("mail.smtp.port", "587");
        mailProps.put("mail.smtp.auth", "true");
        // final, because we're using it in the closure below
        final PasswordAuthentication usernamePassword = new PasswordAuthentication(
                "minhhieutb321@gmail.com", "mhezhvupjnessnss");
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return usernamePassword;
            }
        };
        Session session = Session.getInstance(mailProps, auth);
        session.setDebug(true);
        return session;

    }
    
    public static Message buildMessageWithEmbeddedImage(Session session)
            throws MessagingException, IOException {
        SMTPMessage m = new SMTPMessage(session);
        MimeMultipart content = new MimeMultipart("related");

        // ContentID is used by both parts
        String cid = ContentIdGenerator.getContentId();

        // HTML part
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setText("<html><head>"
                + "<title>This is not usually displayed</title>"
                + "</head>\n"
                + "<body><div><b>Hi there!</b></div>"
                +"<table class=\"body-wrap\">"                
                +"<tbody><tr>"    
                +"<td></td>"        
                +"<td class=\"container\" width=\"600\">"        
                +"<div class=\"content\">"            
                +"<table class=\"main\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">"                
                +"<tbody><tr>"                    
                +"<td class=\"content-wrap aligncenter\">"                        
                +"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">"                            
                +"<tbody><tr>"                                
                +"<td class=\"content-block\">"                                    
                +"<h2>Thanks for using our app</h2>"                                        
                +" </td>"                                   
                +"</tr>"                                
                +"<tr>"                                
                +"<td class=\"content-block\">"                                    
                +"<table class=\"invoice\">"                                        
                +"<tbody><tr>"                                            
                +"<td>Anna Smith<br>Invoice #12345<br>June 01 2015</td>"                                                
                +"</tr>"                                            
                +"<tr>"                                            
                +"<td>"                                                
                +"<table class=\"invoice-items\" cellpadding=\"0\" cellspacing=\"0\">"                                                    
                +"<tbody><tr>"                                                        
                +"<td>Service 1</td>"                                                            
                +" <td class=\"alignright\">$ 20.00</td>"                                                           
                +"</tr>"                                                        
                +"<tr>"                                                        
                +"<td>Service 2</td>"                                                            
                +"<td class=\"alignright\">$ 10.00</td>"                                                            
                +"</tr>"                                                        
                +"<tr>"                                                        
                +"<td>Service 3</td>"                                                            
                +"<td class=\"alignright\">$ 6.00</td>"                                                            
                +" </tr>"                                                       
                +"<tr class=\"total\">"                                                        
                +"<td class=\"alignright\" width=\"80%\">Total</td>"                                                            
                +"<td class=\"alignright\">$ 36.00</td>"                                                            
                +"</tr>"                                                        
                +"</tbody></table>"                                                    
                +"</td>"                                                
                +"</tr>"                                            
                +"</tbody></table>"                                        
                +"</td>"                                    
                +"</tr>"                                
                +"<tr>"                                
                +"<td class=\"content-block\">"                                    
                +"<a href=\"#\">View in browser</a>"                                        
                +"</td>"                                    
                +"</tr>"                                
                +"<tr>"                                
                +"<td class=\"content-block\">"                                    
                +"Company Inc. 123 Van Ness, San Francisco 94102"                                        
                +"</td>"                                    
                +"</tr>"                                
                +"</tbody></table>"                            
                +"</td>"                        
                +"</tr>"                    
                +"</tbody></table>"                
                +"<div class=\"footer\">"                
                +"<table width=\"100%\">"                    
                +"<tbody><tr>"                        
                +"<td class=\"aligncenter content-block\">Questions? Email <a href=\"mailto:\">support@company.inc</a></td>"                            
                +"</tr>"                        
                +"</tbody></table>"                    
                +"</div></div>"                
                +"</td>"        
                +"<td></td>"        
                +"</tr>"    
                +"</tbody></table>"
                + "<div>I hope you like it!</div></body></html>",
                "US-ASCII", "html");
        content.addBodyPart(textPart);

        // Image part
        MimeBodyPart imagePart = new MimeBodyPart();
        imagePart.attachFile("C:\\Users\\minhh\\Desktop\\SWP\\SE1610_Group_Stress\\src\\main\\webapp\\client\\img\\b3.jpg");
        imagePart.setContentID("<" + cid + ">");
        imagePart.setDisposition(MimeBodyPart.INLINE);
        content.addBodyPart(imagePart);

        m.setContent(content);
        m.setSubject("Demo HTML message");
        return m;
    }
    
    public static void addressAndSendMessage(Message message, String recipient)
            throws AddressException, MessagingException {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        Transport.send(message);
    }
    public static void main(String[] args) throws MessagingException, IOException {
        Session session = buildGoogleSession();
        Message withImage = buildMessageWithEmbeddedImage(session);
        addressAndSendMessage(withImage, "minhhieutb321@gmail.com");
    }
}
