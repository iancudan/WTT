package DB;

import WTT.Email;
import WTT.Locatii;
import WTT.Utilizator;

import java.sql.*;
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


    public List<Email> getEmail(String emailTO) {

        List<Email> data =  new ArrayList<Email>();
        try {
            ConnectionHelper conStr = new ConnectionHelper();
            connect = conStr.connectionclasss();        // Connect to database
            if (connect == null) {

            } else {
                // Change below query according to your own database.
                String query = "select * from email where email_to ='"+emailTO+"' order by id asc";
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

    public int insertUtilizator(Utilizator user) {

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database
        if (connect == null){}

        int res = -1;
        if (user == null) {
            return res;
        }
        try {
            String query = "INSERT INTO user(nume,email,parola,cod_confirmare) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = null;
            preparedStatement = connect.prepareStatement(query);
            preparedStatement.setString(1, user.getNume());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getParola());
            preparedStatement.setString(4,user.getCodConfirmare());
            res = preparedStatement.executeUpdate();
            connect.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }


    public Integer checkUniqueEmail (String email){
        Integer uniqueEmail=1;

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database

        if (connect == null) {
            return uniqueEmail;
        } else {
            // Change below query according to your own database.
            String query = "select count(*) from user where email = '"+email +"'";
            try {
                Statement stmt  = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    uniqueEmail = rs.getInt(1);
                }
                connect.close();
                return uniqueEmail;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return uniqueEmail;
    }

    public String checkConfirmationCode(String email){
        String codConfirmare="";

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database

        if (connect == null) {
            return codConfirmare;
        } else {
            // Change below query according to your own database.
            String query = "select cod_confirmare from user where email = '"+email +"'";
            try {
                Statement stmt  = connect.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    codConfirmare = rs.getString(1);
                }
                connect.close();
                return codConfirmare;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return codConfirmare;
    }

    public void activateUser (String email) {

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database
        if (connect == null)
        {

        }
        if (!email.equals("")) {
            try {
                String query = "UPDATE user SET activ = 1 where email = '" + email + "'";
                PreparedStatement preparedStatement = null;
                preparedStatement = connect.prepareStatement(query);
                preparedStatement.executeUpdate();
                connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public void readEmail (String emailId) {

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database
        if (connect == null)
        {

        }
        if (emailId != null) {
            try {
                String query = "UPDATE email SET email_read = 1 where id = " + Integer.valueOf(emailId);
                PreparedStatement preparedStatement = null;
                preparedStatement = connect.prepareStatement(query);
                preparedStatement.executeUpdate();
                connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void insertMessage (Email email) {

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database
        if (connect == null)
        {

        }
        if (email != null) {
            try {
                String query = "insert into email (nume_utilizator,email,email_to,email_subject,email_body) VALUES(?,?,?,?,?)";
                PreparedStatement preparedStatement = null;
                preparedStatement = connect.prepareStatement(query);
                preparedStatement.setString(1, email.getNumeUtilizator());
                preparedStatement.setString(2,email.getEmailFrom());
                preparedStatement.setString(3,email.getEmailTo());
                preparedStatement.setString(4,email.getEmailSubject());
                preparedStatement.setString(5,email.getEmailBody());
                preparedStatement.executeUpdate();
                connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public void updateUserPass (String email,String parola,String oldPass) {

        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database
        if (connect == null)
        {

        }
        if (email != null) {
            try {
                String query = "UPDATE user SET parola ='"+parola+"'  where email = '" + email+"' and parola = '"+ oldPass +"'";
                PreparedStatement preparedStatement = null;
                preparedStatement = connect.prepareStatement(query);
                preparedStatement.executeUpdate();
                connect.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public List<Locatii> oraseVizitate(String email) {
        String[] oraseVIDs=null;
        List<String> oraseVizitate = new ArrayList<String>();
        List<Locatii> data = new ArrayList<Locatii>();
        ConnectionHelper conStr = new ConnectionHelper();
        connect = conStr.connectionclasss();        // Connect to database
        if (connect == null)
        {

        }
        if (email != null) {
                String query = "select id_locatii from user_preferences where id_user = (select id from user where email ='" + email + "')";
                try {
                    Statement stmt = connect.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                       String oV= rs.getString(1);
                       oraseVIDs = new String[oV.split(",").length];
                       oraseVIDs = oV.split(",");
                       for(int i =0;i<oraseVIDs.length;i++){
                           oraseVizitate.add(oraseVIDs[i]);
                       }

                    }
                    //
                    String querylocatii = "select * from locatii where id in ("+oraseVizitate.toString().replace("[","").replace("]","")+")";
                    Statement stmtLocatii = connect.createStatement();
                    ResultSet rsLocatii = stmtLocatii.executeQuery(querylocatii);
                    while (rsLocatii.next()) {
                        Locatii locatie = new Locatii();
                        locatie.setId(rsLocatii.getInt(1));
                        locatie.setNumeOras(rsLocatii.getString(2));
                        locatie.setIdCat1(rsLocatii.getInt(3));
                        locatie.setIdCat2(rsLocatii.getInt(4));
                        locatie.setLat(rsLocatii.getString(5));
                        locatie.setLon(rsLocatii.getString(6));
                        data.add(locatie);
                    }
                    connect.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
        return data;

    }


}
