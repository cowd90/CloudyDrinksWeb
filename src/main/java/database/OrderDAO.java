package database;

import model.Cart;
import model.Order;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class OrderDAO implements IDAO<Order>{

    @Override
    public ArrayList<Order> selectAll() {
        ArrayList<Order> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM tbl_order";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {

                String orderId = rs.getString("orderId");
                String receiverName = rs.getString("receiverName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                int orderStatusId = rs.getInt("orderStatusId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                int totalPrice = rs.getInt("totalPrice");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Order order = new Order(userId, productId, sizeId, quantity, totalPrice, note, time, orderId, receiverName, phoneNumber, address, orderStatusId);
                result.add(order);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Order selectById(String id) {
        Order result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM tbl_order WHERE orderId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                String orderId = rs.getString("orderId");
                String receiverName = rs.getString("receiverName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                int orderStatusId = rs.getInt("orderStatusId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                int totalPrice = rs.getInt("totalPrice");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                result = new Order(userId, productId, sizeId, quantity, totalPrice, note, time, orderId, receiverName, phoneNumber, address, orderStatusId);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Order order) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO tbl_order VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, order.getOrderId());
            ps.setString(2, order.getReceiverName());
            ps.setString(3, order.getPhoneNumber());
            ps.setString(4, order.getAddress());
            ps.setInt(5, order.getOrderStatusId());
            ps.setString(6, order.getUserId());
            ps.setInt(7, order.getProductId());
            ps.setInt(8, order.getSizeId());
            ps.setInt(9, order.getQuantity());
            ps.setInt(10, order.getTotalPrice());
            ps.setString(11, order.getNote());
            ps.setTimestamp(12, order.getTime());

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
    public int insertAll(ArrayList<Order> arr) {
        int count = 0;
        for (Order order : arr) {
            count += this.insert(order);
        }
        return count;
    }

    @Override
    public int delete(Order order) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM tbl_order WHERE orderId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, order.getOrderId());

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
    public int deleteAll(ArrayList<Order> arr) {
        int count = 0;
        for (Order order : arr) {
            count += this.delete(order);
        }
        return count;
    }

    @Override
    public int update(Order order) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE tbl_order" +
                    " SET " +
                    " orderStatusId = ?," +
                    " time = ?" +
                    " WHERE orderId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, order.getOrderStatusId());
            ps.setTimestamp(2, order.getTime());
            ps.setString(3, order.getOrderId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Order> selectDelivering(String uid) {
        ArrayList<Order> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM tbl_order \n" +
                    "WHERE userId = ? && orderStatusId = 1 \n" +
                    "ORDER BY time DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, uid);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                String orderId = rs.getString("orderId");
                String receiverName = rs.getString("receiverName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                int orderStatusId = rs.getInt("orderStatusId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                int totalPrice = rs.getInt("totalPrice");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Order order = new Order(userId, productId, sizeId, quantity, totalPrice, note, time, orderId, receiverName, phoneNumber, address, orderStatusId);
                result.add(order);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Order> selectDelivered(String uid) {
        ArrayList<Order> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM tbl_order \n" +
                    "WHERE userId = ? && orderStatusId = 2 \n" +
                    "ORDER BY time DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, uid);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                String orderId = rs.getString("orderId");
                String receiverName = rs.getString("receiverName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                int orderStatusId = rs.getInt("orderStatusId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                int totalPrice = rs.getInt("totalPrice");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Order order = new Order(userId, productId, sizeId, quantity, totalPrice, note, time, orderId, receiverName, phoneNumber, address, orderStatusId);
                result.add(order);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Order> selectCancelItems(String uid) {
        ArrayList<Order> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM tbl_order \n" +
                    "WHERE userId = ? && orderStatusId = 0 \n" +
                    "ORDER BY time DESC";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, uid);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                String orderId = rs.getString("orderId");
                String receiverName = rs.getString("receiverName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                int orderStatusId = rs.getInt("orderStatusId");
                String userId = rs.getString("userId");
                int productId = rs.getInt("productId");
                int sizeId = rs.getInt("sizeId");
                int quantity = rs.getInt("quantity");
                int totalPrice = rs.getInt("totalPrice");
                String note = rs.getString("note");
                Timestamp time = rs.getTimestamp("time");

                Order order = new Order(userId, productId, sizeId, quantity, totalPrice, note, time, orderId, receiverName, phoneNumber, address, orderStatusId);
                result.add(order);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public String getProductNameById(int id) {
        String result = "";
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT product.productName\n" +
                    "FROM product\n" +
                    "INNER JOIN tbl_order \n" +
                    "ON product.productId = tbl_order.productId\n" +
                    "WHERE tbl_order.productId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                result = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public String getSizeNameById(int id) {
        String result = "";
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT size.sizeName\n" +
                    "FROM size\n" +
                    "INNER JOIN tbl_order \n" +
                    "ON size.sizeId = tbl_order.sizeId\n" +
                    "WHERE tbl_order.sizeId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                result = rs.getString(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
