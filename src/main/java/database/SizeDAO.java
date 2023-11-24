package database;

import model.Category;
import model.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SizeDAO implements IDAO<Size>{

    @Override
    public ArrayList<Size> selectAll() {
        ArrayList<Size> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM size";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                int sizeId = rs.getInt("sizeId");
                String sizeName = rs.getString("sizeName");
                int sizePrice = rs.getInt("sizePrice");

                Size size = new Size(sizeId, sizeName, sizePrice);
                result.add(size);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Size selectById(Size size) {
        Size result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM size WHERE sizeId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, size.getSizeId());

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int sizeId = rs.getInt("sizeId");
                String sizeName = rs.getString("sizeName");
                int sizePrice = rs.getInt("sizePrice");

                result = new Size(sizeId, sizeName, sizePrice);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Size size) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO size VALUES (?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, size.getSizeId());
            ps.setString(2, size.getSizeName());
            ps.setInt(3, size.getSizePrice());

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
    public int insertAll(ArrayList<Size> arr) {
        int count = 0;
        for (Size size : arr) {
            count += this.insert(size);
        }
        return count;
    }

    @Override
    public int delete(Size size) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM size WHERE sizeId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, size.getSizeId());

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
    public int deleteAll(ArrayList<Size> arr) {
        int count = 0;
        for (Size size : arr) {
            count += this.delete(size);
        }
        return count;
    }

    @Override
    public int update(Size size) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE size" +
                    " SET " +
                    " sizeName = ?" +
                    " sizePrice = ?" +
                    " WHERE sizeId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, size.getSizeName());
            ps.setInt(2, size.getSizePrice());
            ps.setInt(3, size.getSizeId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkSizeExist(String sizeName) {
        boolean result = false;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM size WHERE sizeName = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, sizeName);

            // Execute query
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
