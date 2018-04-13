package WTT;

/**
 * Created by Silviu Iancu on 4/13/2018.
 */
public class Locatii {
    private Integer id;
    private String numeOras;
    private Integer idCat1;
    private Integer idCat2;
    private String lat;
    private String lon;

    public Locatii() {
    }

    public Locatii(Integer id, String numeOras, Integer idCat1, Integer idCat2, String lat, String lon) {
        this.id = id;
        this.numeOras = numeOras;
        this.idCat1 = idCat1;
        this.idCat2 = idCat2;
        this.lat = lat;
        this.lon = lon;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumeOras() {
        return numeOras;
    }

    public void setNumeOras(String numeOras) {
        this.numeOras = numeOras;
    }

    public Integer getIdCat1() {
        return idCat1;
    }

    public void setIdCat1(Integer idCat1) {
        this.idCat1 = idCat1;
    }

    public Integer getIdCat2() {
        return idCat2;
    }

    public void setIdCat2(Integer idCat2) {
        this.idCat2 = idCat2;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLon() {
        return lon;
    }

    public void setLon(String lon) {
        this.lon = lon;
    }
}
