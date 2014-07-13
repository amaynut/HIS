package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectToDB {
    public static Connection ConnectToMySQL() {
        Connection c;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/hospital";
            c = DriverManager.getConnection(url, "root", "penpony46");
            c.setAutoCommit(true);
            return c;
        } catch (ClassNotFoundException ex) {
            System.out.println("Couldn't load the driver OJDBC");
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println("SQL Error");
            System.out.println(ex);
        }
        return null;
    }

}
