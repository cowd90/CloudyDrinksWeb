package database;

import model.Cart;
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
                int price = rs.getInt("price");
                String productDesc = rs.getString("productDesc");
                int catId = rs.getInt("catId");

                Product product = new Product(productId, productName, productImage, price, productDesc, catId);
                result.add(product);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Product selectById(String id) {
        Product result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM product WHERE productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                int price = rs.getInt("price");
                String productDesc = rs.getString("productDesc");
                int catId = rs.getInt("catId");

                result = new Product(productId, productName, productImage, price, productDesc, catId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Product product) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO product VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, product.getProductId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductImage());
            ps.setInt(4, product.getPrice());
            ps.setInt(5, product.getCatId());
            ps.setString(6, product.getProductDesc());

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
    public int insertAll(ArrayList<Product> arr) {
        int count = 0;
        for (Product product : arr) {
            count += this.insert(product);
        }
        return count;
    }

    @Override
    public int delete(Product product) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM product WHERE productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, product.getProductId());

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
    public int deleteAll(ArrayList<Product> arr) {
        int count = 0;
        for (Product product : arr) {
            count += this.delete(product);
        }
        return count;
    }

    @Override
    public int update(Product product) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE product" +
                    " SET " +
                    " productName = ?" +
                    " productImage = ?" +
                    " price = ?" +
                    " catId = ?" +
                    " productDesc = ?" +
                    " WHERE productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getProductImage());
            ps.setInt(3, product.getPrice());
            ps.setInt(4, product.getCatId());
            ps.setString(5, product.getProductDesc());
            ps.setInt(6, product.getProductId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Product> selectByCatId(String id) {
        ArrayList<Product> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM product WHERE catId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                int price = rs.getInt("price");
                String productDesc = rs.getString("productDesc");
                int catId = rs.getInt("catId");

                Product product = new Product(productId, productName, productImage, price, productDesc, catId);
                result.add(product);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public String getCatNameById(int id) {
        String result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT category.catName\n" +
                    "FROM product\n" +
                    "LEFT JOIN category ON category.catId = product.catId\n" +
                    "WHERE product.productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                result = rs.getString("catName");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public ArrayList<Size> getSizesByProductId(int id) {
        ArrayList<Size> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT size.*\n" +
                    "FROM product\n" +
                    "LEFT JOIN size ON size.productId = product.productId\n" +
                    "WHERE product.productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int sizeId = rs.getInt("sizeId");
                String sizeName = rs.getString("sizeName");
                int upSizePrice = rs.getInt("upSizePrice");
                int productId = rs.getInt("productId");

                Size size = new Size(sizeId, sizeName, upSizePrice, productId);
                result.add(size);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public ArrayList<Product> select6NewProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product \n" +
                "ORDER BY productId DESC\n" +
                "LIMIT 6";

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            PreparedStatement ps = connect.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                int price = rs.getInt("price");
                String productDesc = rs.getString("productDesc");
                int catId = rs.getInt("catId");

                Product product = new Product(productId, productName, productImage, price, productDesc, catId);
                list.add(product);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.select6NewProduct());
    }
}
