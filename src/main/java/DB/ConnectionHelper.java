package DB;

import sun.rmi.runtime.Log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Ramona on 4/1/2018.
 */

public class ConnectionHelper {

    String ip,db,DBUserNameStr,DBPasswordStr;
    static Connection con;

    public Connection connectionclasss()
    {

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://server.yourz.ro:3306/worldtips","worldtips","1xw50MhJLGDi47L4");
            //con=DriverManager.getConnection("jdbc:mysql://192.168.0.158:3306/world","root","admin");

        }
        catch (SQLException se)
        {
            System.out.println("error here 1 : "+ se.getMessage());
        }
        catch (ClassNotFoundException se)
        {
            System.out.println("error here 2 : "+ se.getMessage());
        }
        catch (Exception se)
        {
            System.out.println("error here 3 : "+ se.getMessage());
        }
        return con;
    }
}