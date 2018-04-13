package DB;

import WTT.Email;
import WTT.Locatii;
import WTT.Utilizator;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Created by Silviu Iancu on 4/12/2018.
 */
public class DatabaseOperation {


    Connection connect = null;
    public List<String> getTest() {

        List<String> data = null;
        data = new ArrayList<String>();
        try {
            ConnectionHelper conStr = new ConnectionHelper();
            connect = conStr.connectionclasss();        // Connect to database
            if (connect == null) {

            } else {
                // Change below query according to your own database.
                String query = "select * from test";
                Statement stmt = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    String nume = rs.getString(1);
                    String prenume = rs.getString(2);
                    data.add(nume + prenume);
                }

                connect.close();
            }
        } catch (Exception ex) {
           System.out.print(ex.getMessage());
        }

        return data;
    }

    public List<Locatii> getLocation() {

        List<Locatii> data =  new ArrayList<Locatii>();
        try {
            ConnectionHelper conStr = new ConnectionHelper();
            connect = conStr.connectionclasss();        // Connect to database
            if (connect == null) {

            } else {
                // Change below query according to your own database.
                String query = "select * from locatii order by nume_oras ASC";
                Statement stmt = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    Locatii locatie = new Locatii();
                    locatie.setId(rs.getInt(1));
                    locatie.setNumeOras(rs.getString(2));
                    locatie.setIdCat1(rs.getInt(3));
                    locatie.setIdCat2(rs.getInt(4));
                    locatie.setLat(rs.getString(5));
                    locatie.setLon(rs.getString(6));
                    data.add(locatie);
                }
                connect.close();
            }
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }

        return data;
    }

    public List<Utilizator> getUsers() {

        List<Utilizator> data =  new ArrayList<Utilizator>();
        try {
            ConnectionHelper conStr = new ConnectionHelper();
            connect = conStr.connectionclasss();        // Connect to database
            if (connect == null) {

            } else {
                // Change below query according to your own database.
                String query = "select * from user order by nume ASC";
                Statement stmt = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    Utilizator utilizator= new Utilizator();
                    utilizator.setId(rs.getInt(1));
                    utilizator.setNume(rs.getString(2));
                    utilizator.setEmail(rs.getString(3));
                    utilizator.setParola(rs.getString(4));
                    utilizator.setCodConfirmare(rs.getString(5));
                    utilizator.setActiv(rs.getInt(6));
                    data.add(utilizator);
                }
                connect.close();
            }
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }

        return data;
    }


    public List<Email> getEmail() {

        List<Email> data =  new ArrayList<Email>();
        try {
            ConnectionHelper conStr = new ConnectionHelper();
            connect = conStr.connectionclasss();        // Connect to database
            if (connect == null) {

            } else {
                // Change below query according to your own database.
                String query = "select * from email order by id asc";
                Statement stmt = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    Email email= new Email();
                    email.setId(rs.getInt(1));
                    email.setNumeUtilizator(rs.getString(2));
                    email.setEmailFrom(rs.getString(3));
                    email.setEmailTo(rs.getString(4));
                    email.setEmailSubject(rs.getString(5));
                    email.setEmailBody(rs.getString(6));
                    email.setEmailDateAndTime(String.valueOf(rs.getString(7)));
                    email.setEmailRead(rs.getInt(8));
                    data.add(email);
                }
                connect.close();
            }
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }

        return data;
    }


    public String logIn (String userName , String password) {
        String data = "";
        String codConfirmare = "nobody";
        try {
            ConnectionHelper conStr = new ConnectionHelper();
            connect = conStr.connectionclasss();        // Connect to database
            if (connect == null) {

            } else {
                // Change below query according to your own database.
                String query = "select * from user  where email = '" +userName +"' and parola = '"+password+"' and activ = 1";
                Statement stmt = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    codConfirmare = rs.getString(5);
                    if(codConfirmare.equals("ADMIN"))
                        data = "ADMIN";
                    else
                        data = "utilizator";
                }
                connect.close();
            }
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }

        return data;
    }
}
