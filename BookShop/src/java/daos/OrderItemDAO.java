package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Product;
import utils.Connector;

public class OrderItemDAO {

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

    public void addNewOrderItems(String orderId, Product product) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "INSERT INTO bookshop_order_item (orderId, quantity, price, productId) VALUES (?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderId);
            preStm.setInt(2, product.getQuantity());
            preStm.setFloat(3, product.getPrice());
            preStm.setInt(4, product.getProductId());
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }
}
