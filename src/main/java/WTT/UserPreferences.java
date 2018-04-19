package WTT;

/**
 * Created by Silviu Iancu on 4/19/2018.
 */
public class UserPreferences {
    Integer id;
    String areCopii;
    String statusRelatie;
    String calatorii;
    String id_calatorie1;
    String id_calatorie2;
    String buget;
    String idLocatii;

    public UserPreferences() {
    }

    public UserPreferences(Integer id, String areCopii, String statusRelatie, String calatorii, String id_calatorie1, String id_calatorie2, String buget, String idLocatii) {
        this.id = id;
        this.areCopii = areCopii;
        this.statusRelatie = statusRelatie;
        this.calatorii = calatorii;
        this.id_calatorie1 = id_calatorie1;
        this.id_calatorie2 = id_calatorie2;
        this.buget = buget;
        this.idLocatii = idLocatii;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreCopii() {
        return areCopii;
    }

    public void setAreCopii(String areCopii) {
        this.areCopii = areCopii;
    }

    public String getStatusRelatie() {
        return statusRelatie;
    }

    public void setStatusRelatie(String statusRelatie) {
        this.statusRelatie = statusRelatie;
    }

    public String getCalatorii() {
        return calatorii;
    }

    public void setCalatorii(String calatorii) {
        this.calatorii = calatorii;
    }

    public String getId_calatorie1() {
        return id_calatorie1;
    }

    public void setId_calatorie1(String id_calatorie1) {
        this.id_calatorie1 = id_calatorie1;
    }

    public String getId_calatorie2() {
        return id_calatorie2;
    }

    public void setId_calatorie2(String id_calatorie2) {
        this.id_calatorie2 = id_calatorie2;
    }

    public String getBuget() {
        return buget;
    }

    public void setBuget(String buget) {
        this.buget = buget;
    }

    public String getIdLocatii() {
        return idLocatii;
    }

    public void setIdLocatii(String idLocatii) {
        this.idLocatii = idLocatii;
    }
}
