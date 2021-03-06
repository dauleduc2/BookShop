package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.Category;
import utils.Connector;

public class CategoryDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

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

    // add a new category
    public void addNewCategory(Category category) throws Exception {
        try {
            conn = Connector.getConnection();
            String sql = "INSERT INTO bookshop_category (name) VALUES (?)";
            preStm = conn.prepareStatement(sql);
            //
            preStm.setString(1, category.getName());
            //
            preStm.executeUpdate();
        } finally {
            this.closeConnection();
        }
    }

    // get Category by name
    public Category getCategoryByName(String caterogyName) throws Exception {
        Category category = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_category WHERE name = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, caterogyName);
            rs = preStm.executeQuery();
            if (rs.next()) {
                Integer categoryId = rs.getInt("categoryId");
                String name = rs.getString("name");
                String createdDate = rs.getString("createdDate");
                category = new Category(categoryId, name, createdDate);
            }
        } finally {
            this.closeConnection();
        }
        return category;
    }
    // get Category by name

    public Category getCategoryByID(int Id) throws Exception {
        Category category = null;
        try {
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_category WHERE categoryId = ?";
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, Id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                Integer categoryId = rs.getInt("categoryId");
                String name = rs.getString("name");
                String createdDate = rs.getString("createdDate");
                category = new Category(categoryId, name, createdDate);
            }
        } finally {
            this.closeConnection();
        }
        return category;
    }

    // get all categories
    public ArrayList<Category> getAllCategory() throws Exception {
        ArrayList<Category> categories = new ArrayList<Category>();
        try {
            Category category = null;
            conn = Connector.getConnection();
            String sql = "SELECT * FROM bookshop_category";
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                Integer categoryId = rs.getInt("categoryId");
                String name = rs.getString("name");
                String createdDate = rs.getString("createdDate");
                category = new Category(categoryId, name, createdDate);
                categories.add(category);
            }
        } finally {
            this.closeConnection();
        }
        return categories;
    }
}
