package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

    public void addNewOrderItems(String orderId, ArrayList<Product> products) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "INSERT INTO bookshop_order_item (orderId, quantity, price, productId) VALUES ";
            for (int i = 0; i < products.size(); i++) {
                Product product = products.get(i);
                if (i == products.size() - 1) {
                    sql += "(N'" + orderId + "'," + product.getQuantity() + "," + product.getPrice() + "," + product.getProductId() + ")";
                } else {
                    sql += "(N'" + orderId + "'," + product.getQuantity() + "," + product.getPrice() + "," + product.getProductId() + "), ";
                }
            }
            System.out.println(sql);
            preStm = conn.prepareStatement(sql);
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }
}
