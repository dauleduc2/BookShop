package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import models.Order;
import models.Product;
import utils.Connector;

public class OrderDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    // close connection of database
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

    // add a new order
    public boolean addNewOrder(ArrayList<Product> products, Integer status, String userId, String consigneeName, String address, String phoneNumber) throws Exception {
        String uuid = UUID.randomUUID().toString().substring(0, 30);
        boolean isTrue = true;
        try {
            PreparedStatement preStm1;
            conn = Connector.getConnection();
            conn.setAutoCommit(false);

            // insert order to db
            String sqlOrder = "INSERT INTO bookshop_order (orderId, status, userId, consigneeName, address, phoneNumber) VALUES (?, ?, ?, ?, ?, ?)";
            preStm1 = conn.prepareStatement(sqlOrder);
            preStm1.setString(1, uuid);
            preStm1.setInt(2, status);
            preStm1.setString(3, userId);
            preStm1.setString(4, consigneeName);
            preStm1.setString(5, address);
            preStm1.setString(6, phoneNumber);
            preStm1.executeUpdate();

            // insert order items to db
            for (Product product : products) {
                String sql = "INSERT INTO bookshop_order_item (orderId, quantity, price, productId) VALUES (?, ?, ?, ?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, uuid);
                preStm.setInt(2, product.getQuantity());
                preStm.setFloat(3, product.getPrice());
                preStm.setInt(4, product.getProductId());
                preStm.executeUpdate();
            }

            // commit if success
            conn.commit();
        } catch (Exception e) {
            isTrue = false;
            conn.rollback();
        } finally {
            this.closeConnection();
        }
        return isTrue;
    }

    // get order by orderId
    public Order getOrderByOrderId(String orderId) throws Exception {
        Order order = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_order WHERE orderId=?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String userId = rs.getString("userId");
                Integer status = rs.getInt("status");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                String consigneeName = rs.getString("consigneeName");
                Date createDate = rs.getDate("createDate");
                order = new Order(orderId, userId, createDate, status, address, phoneNumber, consigneeName);
            }
        } finally {
            this.closeConnection();
        }
        return order;
    }

    public ArrayList<Order> getOrdersByUserId(String userId) throws Exception {
        ArrayList<Order> orders = new ArrayList<Order>();
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_order WHERE userId=? ORDER BY createDate DESC";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userId);
            rs = preStm.executeQuery();
            Order order = null;
            while (rs.next()) {
                String orderId = rs.getString("orderId");
                Integer status = rs.getInt("status");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                String consigneeName = rs.getString("consigneeName");
                Date createDate = rs.getDate("createDate");
                order = new Order(orderId, userId, createDate, status, address, phoneNumber, consigneeName);
                orders.add(order);
            }
        } finally {
            this.closeConnection();
        }
        return orders;
    }

    // update order status
    public boolean updateOrderStatus(String orderId, String userId, Integer status) throws Exception {
        boolean isTrue = true;
        try {
            conn = Connector.getConnection();
            String sql = "UPDATE bookshop_order SET status = ? WHERE orderId = ? AND userId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, status);
            preStm.setString(2, orderId);
            preStm.setString(3, userId);
            preStm.executeUpdate();
        } finally {
            isTrue = false;
            this.closeConnection();
        }
        return isTrue;
    }

    // update order status
    public boolean updateOrderStatus(String orderId, Integer status) throws Exception {
        boolean isTrue = true;
        try {
            conn = Connector.getConnection();
            String sql = "UPDATE bookshop_order SET status = ? WHERE orderId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, status);
            preStm.setString(2, orderId);
            preStm.executeUpdate();
        } finally {
            isTrue = false;
            this.closeConnection();
        }
        return isTrue;
    }

    // get all orders
    public ArrayList<Order> getAllOrder() throws Exception {
        ArrayList<Order> orders = new ArrayList<Order>();
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_order ORDER BY createDate DESC";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            Order order = null;
            while (rs.next()) {
                String orderId = rs.getString("orderId");
                String userId = rs.getString("userId");
                Integer status = rs.getInt("status");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                String consigneeName = rs.getString("consigneeName");
                Date createDate = rs.getDate("createDate");
                order = new Order(orderId, userId, createDate, status, address, phoneNumber, consigneeName);
                orders.add(order);
            }
        } finally {
            this.closeConnection();
        }
        return orders;
    }
}
