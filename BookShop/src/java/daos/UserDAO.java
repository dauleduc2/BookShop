package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.User;
import utils.Connector;

public class UserDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    //this function will close connection of database
    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }

        if (preStm != null) {
            preStm.close();
        }

        if (conn != null) {
            conn.close();
        }
    }

    //this function will add a new user
    public void addNewUser(User user) {

    }

    // this function will get a user by id
    public User getUserById(String id) throws Exception {
        User user = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_user WHERE userId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String password = rs.getString("password");
                Integer roleId = rs.getInt("roleId");
                user = new User(id, roleId, fullName, email, address, phone, password);
            }
        } finally {
            this.closeConnection();
        }
        return user;
    }

    // this function will get a user by email
    public User getUserByEmail(String email) throws Exception {
        User user = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_user WHERE email = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, email);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String userId = rs.getString("userId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String password = rs.getString("password");
                Integer roleId = rs.getInt("roleId");
                user = new User(userId, roleId, fullName, email, address, phone, password);
            }
        } finally {
            this.closeConnection();
        }
        return user;
    }
}
