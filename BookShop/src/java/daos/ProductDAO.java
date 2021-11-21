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

    // add a new product
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

    // get products
    public ArrayList<Product> getProductToShow() throws Exception {
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            Product product;
            conn = Connector.getConnection();
            String sql = "SELECT TOP 24 * FROM bookshop_product ORDER BY createdDate DESC";
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

    // get product by given id
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

    // update product information
    public void updateProduct(Integer productId, String name, String image, Integer quantity, Float price, String description, String publishedDate, Integer categoryId) throws Exception {

        try {
            conn = Connector.getConnection();
            String sql = "UPDATE bookshop_product "
                    + "SET name = ?, image = ?, quantity = ?, price = ?, description = ?, publishedDate = ?, categoryId = ? WHERE productId = ?;";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, name);
            preStm.setString(2, image);
            preStm.setInt(3, quantity);
            preStm.setFloat(4, price);
            preStm.setString(5, description);
            preStm.setString(6, publishedDate);
            preStm.setInt(7, categoryId);
            preStm.setInt(8, productId);
            preStm.executeUpdate();

        } finally {
            this.closeConnection();
        }
    }

    // get product by name
    public Product getProductByName(String name) throws Exception {
        Product product = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product WHERE name = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, name);
            rs = preStm.executeQuery();
            if (rs.next()) {
                Integer productId = rs.getInt("productId");
                Integer categoryId = rs.getInt("categoryId");
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

    // search product by name
    public ArrayList<Product> searchProductByName(String name) throws Exception {
        ArrayList<Product> productList = new ArrayList<Product>();
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product WHERE name LIKE ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + name + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                Integer productId = rs.getInt("productId");
                String productName = rs.getString("name");
                String imageUrl = rs.getString("image");
                Integer quantity = rs.getInt("quantity");
                Integer categoryId = rs.getInt("categoryId");
                Float price = rs.getFloat("price");
                String description = rs.getString("description");
                String publishedDate = rs.getString("publishedDate");
                String createdDate = rs.getString("createdDate");
                Product product = new Product(productId, categoryId, productName, imageUrl, quantity, price, description, publishedDate, createdDate);
                productList.add(product);
            }
        } finally {
            this.closeConnection();
        }
        return productList;
    }

    // update product quantity
    public void updateProductQuantity(Integer quantity, Integer productId) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "UPDATE bookshop_product SET quantity = ? WHERE productId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, quantity);
            preStm.setInt(2, productId);
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }

    // get products by categoryId
    public ArrayList<Product> getProductsByCategoryId(Integer categoryId) throws Exception {
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            Product product = null;
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product WHERE categoryId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, categoryId);
            rs = preStm.executeQuery();
            while (rs.next()) {
                Integer productId = rs.getInt("productId");
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

    // get product with filter
    public ArrayList<Product> getProducts(Integer categoryId, Float minPrice, Float maxPrice) throws Exception {
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            Product product = null;
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product WHERE categoryId = ? AND price BETWEEN ? AND ?";
            if (categoryId == null) {
                sql = "SELECT * FROM bookshop_product WHERE price BETWEEN ? AND ? ORDER BY publishedDate DESC";
                preStm = conn.prepareStatement(sql);
                preStm.setFloat(1, minPrice);
                preStm.setFloat(2, maxPrice);
            } else {
                preStm = conn.prepareStatement(sql);
                preStm.setInt(1, categoryId);
                preStm.setFloat(2, minPrice);
                preStm.setFloat(3, maxPrice);
            }
            rs = preStm.executeQuery();
            while (rs.next()) {
                Integer productId = rs.getInt("productId");
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

    public ArrayList<Product> getProductForAdmin(Integer offset, Integer limit) throws Exception {
        ArrayList<Product> products = new ArrayList<Product>();
        try {
            Product product = null;
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_product ORDER BY createdDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, offset);
            preStm.setInt(2, limit);
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
}
