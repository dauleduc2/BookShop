package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Category;
import utils.Connector;

public class CategoryDAO {

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

    //this function will add a new category
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
}
