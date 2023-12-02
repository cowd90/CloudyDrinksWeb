package database;

import model.Cart;
import model.News;
import model.Product;
import model.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class CartDAO implements IDAO<Cart>{

    @Override
    public ArrayList<Cart> selectAll() {
        ArrayList<Cart> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM cart";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                String cartId = rs.getString("cartId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Cart cart = new Cart(cartId, userId, productId, sizeId, quantity, note, time);
                result.add(cart);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Cart selectById(String pid, String sid) {
        Cart result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM cart WHERE productId = ? && sizeId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, pid);
            ps.setString(2, sid);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                String cartId = rs.getString("cartId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                result = new Cart(cartId, userId, productId, sizeId, quantity, note, time);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Cart cartItem) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO cart VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, cartItem.getCartId());
            ps.setString(2, cartItem.getUserId());
            ps.setInt(3, cartItem.getProductId());
            ps.setInt(4, cartItem.getSizeId());
            ps.setInt(5, cartItem.getQuantity());
            ps.setString(6, cartItem.getNote());
            ps.setTimestamp(7, cartItem.getTime());

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
    public int insertAll(ArrayList<Cart> arr) {
        return 0;
    }

    @Override
    public int delete(Cart product) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Cart> arr) {
        return 0;
    }

    @Override
    public int update(Cart cartItem) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE cart" +
                    " SET " +
                    " quantity = ?" +
                    " note = ?" +
                    " WHERE cartId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, cartItem.getQuantity());
            ps.setString(2, cartItem.getCartId());
            ps.setString(2, cartItem.getNote());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkIfExists(String productId, String sizeId) {
        boolean result = false;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM cart WHERE productId = ? && sizeId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, productId);
            ps.setString(2, sizeId);

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

    public ArrayList<Cart> selectAllItem(String uid) {
        ArrayList<Cart> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM cart WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, uid);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                String cartId = rs.getString("cartId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Cart cart = new Cart(cartId, userId, productId, sizeId, quantity, note, time);
                result.add(cart);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkIfUserHasCart(String userId) {
        boolean result = false;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM cart WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, userId);

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

    public ArrayList<Cart> select3Cart(String uid) {
        ArrayList<Cart> list = new ArrayList<>();
        String query = "SELECT * FROM cart \n" +
                "WHERE userId = ? \n" +
                "ORDER BY time DESC\n" +
                "LIMIT 3 ";

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            PreparedStatement ps = connect.prepareStatement(query);
            ps.setString(1, uid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String cartId = rs.getString("cartId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Cart cart = new Cart(cartId, userId, productId, sizeId, quantity, note, time);
                list.add(cart);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public int countCartQuantity(String uid) {
       int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM cart WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, uid);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                result++;

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

//    public static void main(String[] args) {
//        CartDAO cartDAO = new CartDAO();
//        System.out.println(cartDAO.countCartQuantity("1700706798560"));
//    }

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
