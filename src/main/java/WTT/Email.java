package WTT;

/**
 * Created by Silviu Iancu on 4/13/2018.
 */
public class Email {

    private Integer id;
    private String numeUtilizator;
    private String emailFrom;
    private String emailTo;
    private String emailSubject;
    private String emailBody;
    private Integer emailRead;
    private String emailDateAndTime;

    public Email() {
    }

    public Email(Integer id, String numeUtilizator, String emailFrom, String emailTo, String emailSubject, String emailBody, Integer emailRead,String emailDateAndTime) {
        this.id = id;
        this.numeUtilizator = numeUtilizator;
        this.emailFrom = emailFrom;
        this.emailTo = emailTo;
        this.emailSubject = emailSubject;
        this.emailBody = emailBody;
        this.emailRead = emailRead;
        this.emailDateAndTime = emailDateAndTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumeUtilizator() {
        return numeUtilizator;
    }

    public void setNumeUtilizator(String numeUtilizator) {
        this.numeUtilizator = numeUtilizator;
    }

    public String getEmailFrom() {
        return emailFrom;
    }

    public void setEmailFrom(String emailFrom) {
        this.emailFrom = emailFrom;
    }

    public String getEmailTo() {
        return emailTo;
    }

    public void setEmailTo(String emailTo) {
        this.emailTo = emailTo;
    }

    public String getEmailSubject() {
        return emailSubject;
    }

    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

    public String getEmailBody() {
        return emailBody;
    }

    public void setEmailBody(String emailBody) {
        this.emailBody = emailBody;
    }

    public Integer getEmailRead() {
        return emailRead;
    }

    public void setEmailRead(Integer emailRead) {
        this.emailRead = emailRead;
    }

    public String getEmailDateAndTime() {
        return emailDateAndTime;
    }

    public void setEmailDateAndTime(String emailDateAndTime) {
        this.emailDateAndTime = emailDateAndTime;
    }
}
