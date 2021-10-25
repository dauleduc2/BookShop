package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
    public void addNewProduct(Product product) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "INSERT INTO bookshop_product (name, image, quantity, price, description, publishedDate, categoryId) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preStm = conn.prepareStatement(sql);
            //
            preStm.setString(1, product.getName());
            preStm.setString(2, product.getImageUrl());
            preStm.setInt(3, product.getQuantity());
            preStm.setFloat(4, product.getPrice());
            preStm.setString(5, product.getDescription());
            preStm.setString(6, product.getPublishedDate());
            preStm.setInt(7, product.getCategoryId());

            //
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }

    // this function will get products
    public ArrayList<Product> getNewProducts() throws Exception {
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            Product product;
            conn = Connector.getConnection();
            String sql = "SELECT TOP 24 * FROM bookshop_product ORDER BY publishedDate DESC";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                Integer productId = rs.getInt("productId");
                Integer categoryId = rs.getInt("categoryId");
                String name = rs.getString("name");
                String imageUrl = rs.getString("image");
                Integer quantity = rs.getInt("quantity");
                Float price = rs.getFloat("price");
                String description = rs.getString("description");
                String publishedDate = rs.getString("publishedDate");
                String createdDate = rs.getString("createdDate");
                product = new Product(productId, categoryId, name, imageUrl, quantity, price, description, publishedDate, createdDate);
                products.add(product);
            }
        } finally {
            this.closeConnection();
        }
        return products;
    }

    public Product getProductById(Integer productId) throws Exception {
        Product product = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product WHERE productId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, productId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                Integer categoryId = rs.getInt("categoryId");
                String name = rs.getString("name");
                String imageUrl = rs.getString("image");
                Integer quantity = rs.getInt("quantity");
                Float price = rs.getFloat("price");
                String description = rs.getString("description");
                String publishedDate = rs.getString("publishedDate");
                String createdDate = rs.getString("createdDate");
                product = new Product(productId, categoryId, name, imageUrl, quantity, price, description, publishedDate, createdDate);
            }
        } finally {
            this.closeConnection();
        }
        return product;
    }
}
