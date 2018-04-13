package WTT;

/**
 * Created by Silviu Iancu on 4/13/2018.
 */
public class Utilizator {

    private Integer id;
    private String nume;
    private String email;
    private String parola;
    private String codConfirmare;
    private Integer activ;


    public Utilizator() {
    }

    public Utilizator(Integer id, String nume, String email, String parola, String codConfirmare, Integer activ) {
        this.id = id;
        this.nume = nume;
        this.email = email;
        this.parola = parola;
        this.codConfirmare = codConfirmare;
        this.activ = activ;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getParola() {
        return parola;
    }

    public void setParola(String parola) {
        this.parola = parola;
    }

    public String getCodConfirmare() {
        return codConfirmare;
    }

    public void setCodConfirmare(String codConfirmare) {
        this.codConfirmare = codConfirmare;
    }

    public Integer getActiv() {
        return activ;
    }

    public void setActiv(Integer activ) {
        this.activ = activ;
    }
}
