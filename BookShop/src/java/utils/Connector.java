package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

    /**
     * Get connection
     *
     * @return
     */
    public static Connection getConnection() {
        Connection connection = null;
        String IP = "localhost";
        String instanceName = "MSSQLSERVER";
        String port = "1433";
        String db = "BookShop";
        String username = "sa";
        String password = "1234567890";

        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port + ";databaseName=" + db + ";user="
                + username + ";password=" + password;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url);
            System.out.println("Connection to database successfull");
        } catch (SQLException error) {
            error.printStackTrace();
        } catch (ClassNotFoundException error) {
            error.printStackTrace();
        }

        return connection;
    }
}
