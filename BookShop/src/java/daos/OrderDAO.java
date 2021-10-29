package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.UUID;
import models.Product;
import utils.Connector;

public class OrderDAO {

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

    //this function will add a new order
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
//            OrderItemDAO orderItemDao = new OrderItemDAO();
            for (Product product : products) {
                String sql = "INSERT INTO bookshop_order_item (orderId, quantity, price, productId) VALUES (?, ?, ?, ?)";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, uuid);
                preStm.setInt(2, product.getQuantity());
                preStm.setFloat(3, product.getPrice());
                preStm.setInt(4, product.getProductId());
                preStm.executeUpdate();
                //orderItemDao.addNewOrderItems(uuid, product);
            }

            // update quantity
            ProductDAO productDao = new ProductDAO();
            Product p = null;
            for (Product product : products) {
                p = productDao.getProductById(product.getProductId());
                productDao.updateProductQuantity(p.getQuantity() - product.getQuantity(), product.getProductId());
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
}
