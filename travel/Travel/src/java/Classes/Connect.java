/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author sai
 */
public class Connect {

    public static Connection con;

    public static Connection connectDb() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travel", "root", "root");
            System.out.println("Connected");
            return con;
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
