package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;
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
    public void addNewUser(User user) throws Exception {
        String uuid = UUID.randomUUID().toString().substring(0, 30);
        try {
            conn = Connector.getConnection();
            String sql = "INSERT INTO bookshop_user (userId, username, fullName, email, address, phone, avatar, password, roleId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            //
            preStm.setString(1, uuid);
            preStm.setString(2, user.getUsername());
            preStm.setString(3, user.getFullName());
            preStm.setString(4, user.getEmail());
            preStm.setString(5, null);
            preStm.setString(6, null);
            preStm.setString(7, null);
            preStm.setString(8, user.getPassword());
            preStm.setString(9, Integer.toString(user.getRoleId()));
            //
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
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
                String username = rs.getString("username");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                Integer roleId = rs.getInt("roleId");
                user = new User(id, roleId, username, fullName, email, address, phone, avatar, password);
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
                String username = rs.getString("username");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                Integer roleId = rs.getInt("roleId");
                user = new User(userId, roleId, username, fullName, email, address, phone, avatar, password);
            }
        } finally {
            this.closeConnection();
        }
        return user;
    }

    // this function will get a user by usrname
    public User getUserByUsername(String username) throws Exception {
        User user = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_user WHERE username = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String userId = rs.getString("userId");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                String password = rs.getString("password");
                Integer roleId = rs.getInt("roleId");
                user = new User(userId, roleId, username, fullName, email, address, phone, avatar, password);
            }
        } finally {
            this.closeConnection();
        }
        return user;
    }

    // this function will update profile of user
    public void updateUserProfile(String userId, String fullName, String email, String address, String phone, String avatar) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "UPDATE bookshop_user SET fullName = ?, email = ?, address = ?, phone = ?, avatar = ? WHERE userId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, fullName);
            preStm.setString(2, email);
            preStm.setString(3, address == "" ? null : address);
            preStm.setString(4, phone == "" ? null : phone);
            preStm.setString(5, avatar == "" ? null : avatar);
            preStm.setString(6, userId);
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }

    // this function will update password of user
    public void changePassword(String userid, String newPassword) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "UPDATE bookshop_user SET password = ? WHERE userId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, newPassword);
            preStm.setString(2, userid);
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }
}
