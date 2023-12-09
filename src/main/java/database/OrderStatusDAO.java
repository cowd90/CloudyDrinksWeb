package database;

import model.OrderStatus;
import model.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrderStatusDAO implements IDAO<OrderStatus>{

    @Override
    public ArrayList<OrderStatus> selectAll() {
        ArrayList<OrderStatus> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM order_status";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                int orderStatusId = rs.getInt("orderStatusId");
                String description = rs.getString("description");

                OrderStatus orderStatus = new OrderStatus(orderStatusId, description);
                result.add(orderStatus);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public OrderStatus selectById(String id) {
        OrderStatus result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM order_status WHERE orderStatusId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int orderStatusId = rs.getInt("orderStatusId");
                String description = rs.getString("description");

                result = new OrderStatus(orderStatusId, description);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(OrderStatus orderStatus) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO order_status VALUES (?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, orderStatus.getOrderStatusId());
            ps.setString(2, orderStatus.getDescription());

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
    public int insertAll(ArrayList<OrderStatus> arr) {
        int count = 0;
        for (OrderStatus orderStatus : arr) {
            count += this.insert(orderStatus);
        }
        return count;
    }

    @Override
    public int delete(OrderStatus orderStatus) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM order_status WHERE orderStatusId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, orderStatus.getOrderStatusId());

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
    public int deleteAll(ArrayList<OrderStatus> arr) {
        int count = 0;
        for (OrderStatus orderStatus : arr) {
            count += this.delete(orderStatus);
        }
        return count;
    }

    @Override
    public int update(OrderStatus orderStatus) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE order_status" +
                    " SET " +
                    " description = ?" +
                    " WHERE orderStatusId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, orderStatus.getDescription());
            ps.setInt(2, orderStatus.getOrderStatusId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
