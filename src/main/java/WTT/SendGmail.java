package WTT;

import DB.DatabaseOperation;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

/**
 * Created by Silviu Iancu on 4/16/2018.
 */
public class SendGmail {

    final String username= "worldtipstravel@gmail.com";
    final String password = "Houriapalace1!";
    final String[] recipient = {"dansilviuiancu@gmail.com"};

    public SendGmail() {
    }

    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException ae) {
            ae.printStackTrace();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }

    public void sendEmail(String nume,String email,String parola){
        String[]recipient = new String[1];
        recipient[0]=email;
        sendFromGMail(username, password, recipient, "TEST", "BODY");
    }

    public void sendEmailAdmin(String nume,String emailTo,String emailFrom,String subject,String body){
        String[]recipient = new String[1];
        recipient[0]=emailTo;
        sendFromGMail(username, password, recipient, subject, body);
    }

    public static String codUnicDeIndentificare="";

    public static final void getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 10) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        codUnicDeIndentificare = salt.toString();
    }
}
