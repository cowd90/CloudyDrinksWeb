package database;

import model.News;
import model.Product;
import model.Size;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NewsDAO implements IDAO<News>{

    @Override
    public ArrayList<News> selectAll() {
        ArrayList<News> result = new ArrayList<>();
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM news";
            PreparedStatement ps = connect.prepareStatement(sql);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Create object from db
            while (rs.next()) {
                int newsId = rs.getInt("newsId");
                String title = rs.getString("title");
                String img = rs.getString("img");
                String content = rs.getString("content");

                News news = new News(newsId, title, img, content);
                result.add(news);

            }

            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public News selectById(String id) {
        News result = null;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "SELECT * FROM news WHERE newsId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, id);

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Get data from db

            while (rs.next()) {
                int newsId = rs.getInt("newsId");
                String title = rs.getString("title");
                String img = rs.getString("img");
                String content = rs.getString("content");

                result = new News(newsId, title, img, content);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(News news) {
        int result = 0;

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "INSERT INTO size VALUES (?, ?, ?, ?)";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setInt(1, news.getNewsId());
            ps.setString(2, news.getTitle());
            ps.setString(3, news.getImg());
            ps.setString(4, news.getContent());

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
    public int insertAll(ArrayList<News> arr) {
        int count = 0;
        for (News news : arr) {
            count += this.insert(news);
        }
        return count;
    }

    @Override
    public int delete(News news) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "DELETE FROM news WHERE newsId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setInt(1, news.getNewsId());

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
    public int deleteAll(ArrayList<News> arr) {
        int count = 0;
        for (News news : arr) {
            count += this.delete(news);
        }
        return count;
    }

    @Override
    public int update(News news) {
        int result = 0;
        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            // Create sql statement
            String sql = "UPDATE news" +
                    " SET " +
                    " title = ?" +
                    " img = ?" +
                    " content = ?" +
                    " WHERE newsId = ?";
            PreparedStatement ps = connect.prepareStatement(sql);

            ps.setString(1, news.getTitle());
            ps.setString(2, news.getImg());
            ps.setString(3, news.getContent());
            ps.setInt(4, news.getNewsId());

            // Execute query
            result = ps.executeUpdate();

            // Close connection
            JDBCUtil.closeConnection(connect);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public ArrayList<News> select3NewNews() {
        ArrayList<News> list = new ArrayList<>();
        String query = "SELECT * FROM news\n" +
                "ORDER BY newsId DESC\n" +
                "LIMIT 3";

        try {
            // Create db connection
            Connection connect = JDBCUtil.getConnection();

            PreparedStatement ps = connect.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int newsId = rs.getInt("newsId");
                String title = rs.getString("title");
                String img = rs.getString("img");
                String content = rs.getString("content");

                News news = new News(newsId, title, img, content);
                list.add(news);
            }
        } catch (Exception e) {

        }
        return list;
    }
}
