package database;

import model.Product;
import model.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO implements IDAO<Product>{

    @Override
    public ArrayList<Product> selectAll() {
        ArrayList<Product> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM product";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String productDesc = rs.getString("productDesc");
                int catId = rs.getInt("catId");

                Product product = new Product(productId, productName, productImage, productDesc, catId);
                result.add(product);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Product selectById(Product product) {
        Product result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM product WHERE productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, product.getProductId());

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                String productDesc = rs.getString("productDesc");
                int catId = rs.getInt("catId");

                result = new Product(productId, productName, productImage, productDesc, catId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Product product) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Product> arr) {
        return 0;
    }

    @Override
    public int delete(Product product) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Product> arr) {
        return 0;
    }

    @Override
    public int update(Product product) {
        return 0;
    }


//    @Override
//    public int insert(Product product) {
//        int result = 0;
//
//        try {
//            // Create db connection
//            Connection connect = JDBCUtil.getConnection();
//
//            // Create sql statement
//            String sql = "INSERT INTO size VALUES (?, ?, ?)";
//            PreparedStatement ps = connect.prepareStatement(sql);
//
//            ps.setInt(1, size.getSizeId());
//            ps.setString(2, size.getSizeName());
//            ps.setInt(3, size.getSizePrice());
//
//            // Execute query
//            result = ps.executeUpdate();
//
//            // Close connection
//            JDBCUtil.closeConnection(connect);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return result;
//    }
//
//    @Override
//    public int insertAll(ArrayList<Size> arr) {
//        int count = 0;
//        for (Size size : arr) {
//            count += this.insert(size);
//        }
//        return count;
//    }
//
//    @Override
//    public int delete(Size size) {
//        int result = 0;
//        try {
//            // Create db connection
//            Connection connect = JDBCUtil.getConnection();
//
//            // Create sql statement
//            String sql = "DELETE FROM size WHERE sizeId = ?";
//            PreparedStatement ps = connect.prepareStatement(sql);
//            ps.setInt(1, size.getSizeId());
//
//            // Execute query
//            result = ps.executeUpdate();
//
//            // Close connection
//            JDBCUtil.closeConnection(connect);
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return result;
//    }
//
//    @Override
//    public int deleteAll(ArrayList<Size> arr) {
//        int count = 0;
//        for (Size size : arr) {
//            count += this.delete(size);
//        }
//        return count;
//    }
//
//    @Override
//    public int update(Size size) {
//        int result = 0;
//        try {
//            // Create db connection
//            Connection connect = JDBCUtil.getConnection();
//
//            // Create sql statement
//            String sql = "UPDATE size" +
//                    " SET " +
//                    " sizeName = ?" +
//                    " sizePrice = ?" +
//                    " WHERE sizeId = ?";
//            PreparedStatement ps = connect.prepareStatement(sql);
//
//            ps.setString(1, size.getSizeName());
//            ps.setInt(2, size.getSizePrice());
//            ps.setInt(3, size.getSizeId());
//
//            // Execute query
//            result = ps.executeUpdate();
//
//            // Close connection
//            JDBCUtil.closeConnection(connect);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
//    public boolean checkSizeExist(String sizeName) {
//        boolean result = false;
//        try {
//            // Create db connection
//            Connection connect = JDBCUtil.getConnection();
//
//            // Create sql statement
//            String sql = "SELECT * FROM size WHERE sizeName = ?";
//            PreparedStatement ps = connect.prepareStatement(sql);
//            ps.setString(1, sizeName);
//
//            // Execute query
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                result = true;
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return result;
//    }
}
