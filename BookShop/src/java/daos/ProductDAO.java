package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import models.Product;
import utils.Connector;

public class ProductDAO {

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

    //this function will add a new product
    public void addNewProduct() throws Exception {
    }

    // this function will get products
    public ArrayList<Product> getProducts() throws Exception {
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            Product product;
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                Integer productId = rs.getInt("productId");
                Integer categoryId = rs.getInt("categoryId");
                String name = rs.getString("name");
                String imageUrl = rs.getString("image");
                Integer quantity = rs.getInt("quantity");
                Double price = rs.getDouble("price");
                String description = rs.getString("description");
                Date publishedDate = rs.getDate("publishedDate");
                product = new Product(productId, categoryId, name, imageUrl, quantity, price, description, publishedDate);
                products.add(product);
            }
        } finally {
            this.closeConnection();
        }
        return products;
    }
}
