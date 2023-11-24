package database;

import model.Category;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class CategoryDAO implements IDAO<Category>{

    @Override
    public ArrayList<Category> selectAll() {
        ArrayList<Category> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM category";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                int catId = rs.getInt("catId");
                String catName = rs.getString("catName");

                Category category = new Category(catId, catName);
                result.add(category);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Category selectById(Category category) {
        Category result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM category WHERE catId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, category.getCatId());

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int catId = rs.getInt("catId");
                String catName = rs.getString("catName");

                result = new Category(catId, catName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Category category) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO category VALUES (?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, category.getCatId());
            ps.setString(2, category.getCatName());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<Category> arr) {
        int count = 0;
        for (Category category : arr) {
            count += this.insert(category);
        }
        return count;
    }

    @Override
    public int delete(Category category) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM category WHERE catId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, category.getCatId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Category> arr) {
        int count = 0;
        for (Category category : arr) {
            count += this.delete(category);
        }
        return count;
    }

    @Override
    public int update(Category category) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE category" +
                    " SET " +
                    " catName = ?" +
                    " WHERE catId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, category.getCatName());
            ps.setInt(2, category.getCatId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkCategoryExist(String catName) {
        boolean result = false;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM category WHERE catName = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, catName);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
