package util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Email {
    static final String from = "tienn.dungg.980@gmail.com";
    static final String password = "frqflmqgfdvriyyn";

    public static boolean sendEmail(String to, String title, String content) {

        // Properties:
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587, SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Session
        Session session = Session.getInstance(props, auth);

        // Create a message
        MimeMessage mmsg = new MimeMessage(session);

        try {
            // Content type
            mmsg.addHeader("Content-type", "text/html; charset=UTF-8");

            // Set sender
            mmsg.setFrom(from);

            // Set Recipients
            mmsg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Create email title
            mmsg.setSubject(title);

            // Set sending date
            mmsg.setSentDate(new Date());

            // Email reply
            //mmsg.setReplyTo(InternetAddress.parse(from, false));

            // Set email content
            mmsg.setContent(content, "text/html; charset=UTF-8");

            // Send email
            Transport.send(mmsg);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
