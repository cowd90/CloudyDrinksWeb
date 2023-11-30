package database;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class UserDAO implements IDAO<User>{
    @Override
    public ArrayList<User> selectAll() {
        ArrayList<User> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM user";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                String userId = rs.getString("userId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String verificationCode = rs.getString("verificationCode");
                Timestamp authCodeValidTime = rs.getTimestamp("authCodeValidTime");
                Boolean isVerified = rs.getBoolean("isVerified");

                User user = new User(userId, username, password, email, verificationCode, authCodeValidTime, isVerified);
                result.add(user);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public User selectById(String id) {
        User result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM user WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                String userId = rs.getString("userId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String verificationCode = rs.getString("verificationCode");
                Timestamp authCodeValidTime = rs.getTimestamp("authCodeValidTime");
                Boolean isVerified = rs.getBoolean("isVerified");

                result = new User(userId, username, password, email, verificationCode, authCodeValidTime, isVerified);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(User user) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, user.getUserId());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getVerificationCode());
            ps.setTimestamp(6, user.getAuthCodeValidTime());
            ps.setBoolean(7, user.isVerified());

            // Execute query
            result = ps.executeUpdate();

            System.out.println("Query: " + sql);
            System.out.println("Có " + result + " dòng đã bị thay đổi");

            // Close connection
            JDBCUtil.closeConnection(connect);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<User> arr) {
        int count = 0;
        for (User user : arr) {
            count += this.insert(user);
        }
        return count;
    }

    @Override
    public int delete(User user) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM user WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getUserId());

            // Execute query
            result = ps.executeUpdate();

            System.out.println("Query: " + sql);
            System.out.println("Có " + result + " dòng đã bị thay đổi");

            // Close connection
            JDBCUtil.closeConnection(connect);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<User> arr) {
        int count = 0;
        for (User user : arr) {
            count += this.delete(user);
        }
        return count;
    }

    @Override
    public int update(User user) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE user" +
                    " SET " +
                    " username = ?" +
                    ", password = ?" +
                    ", email = ?" +
                    ", verificationCode = ?" +
                    ", authCodeValidTime = ?" +
                    ", isVerified = ?" +
                    " WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getVerificationCode());
            ps.setTimestamp(5, user.getAuthCodeValidTime());
            ps.setBoolean(6, user.isVerified());
            ps.setString(7, user.getUserId());

            // Execute query
            result = ps.executeUpdate();

            System.out.println("Có " + result + " dòng được cập nhật");

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean checkUsernameExist(String username) {
        boolean result = false;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM user WHERE username = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, username);

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

    public User selectByUsernameAndPwd(User user) {
        User result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                String userId = rs.getString("userId");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String verificationCode = rs.getString("verificationCode");
                Timestamp authCodeValidTime = rs.getTimestamp("authCodeValidTime");
                Boolean isVerified = rs.getBoolean("isVerified");

                result = new User(userId, username, password, email, verificationCode, authCodeValidTime, isVerified);
                break;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean changePassword(User user) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE user SET password = ? WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getUserId());

            // Execute query
            result = ps.executeUpdate();

            System.out.println("Có " + result + " dòng được cập nhật");

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result > 0;
    }

    public int updateInfo(User user) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE user" +
                    " SET " +
                    " username = ?" +
                    ", password = ?" +
                    ", email = ?" +
                    ", verificationCode = ?" +
                    ", authCodeValidTime = ?" +
                    ", isVerified = ?" +
                    " WHERE userId = ?";

            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getVerificationCode());
            ps.setTimestamp(5, user.getAuthCodeValidTime());
            ps.setBoolean(6, user.isVerified());
            ps.setString(7, user.getUsername());

            // Execute query
            result = ps.executeUpdate();

            System.out.println("Có " + result + " dòng được cập nhật");

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int updateVerifyInformation(User user) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE user " +
                    " SET " +
                    " verificationCode = ?" +
                    ", authCodeValidTime = ?" +
                    ", isVerified = ?" +
                    " WHERE userId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getVerificationCode());
            ps.setTimestamp(2, user.getAuthCodeValidTime());
            ps.setBoolean(3, user.isVerified());
            ps.setString(4, user.getUserId());

            // Execute query
            result = ps.executeUpdate();

            System.out.println("Có " + result + " dòng được cập nhật");

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
