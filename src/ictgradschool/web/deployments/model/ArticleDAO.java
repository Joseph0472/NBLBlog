package ictgradschool.web.deployments.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
    private static Article getArticleFromResultSet(ResultSet rs) throws SQLException {
        return new Article(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getInt(5),
                rs.getDate(6)
        );
    }

    public static List<Article> getAllArticles(Connection conn) throws SQLException {

        List<Article> articles = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {

            try (ResultSet rs =
                         stmt.executeQuery("SELECT id, title, content, imageFilename,userId,date FROM fp_articles")) {

                while (rs.next()) {
                    Article article = getArticleFromResultSet(rs);
                    articles.add(article);
                }

            }

        }

        return articles;

    }

    public static Article getArticleById(int id, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT id, title, content, imageFilename,userId,date FROM fp_articles WHERE id = ?")) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    return getArticleFromResultSet(rs);

                } else {
                    return null;
                }

            }

        }

    }

    public static List<Article> getArticleByUser(int user_id, Connection conn) throws SQLException {
        List<Article> articles = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT id, title, content, imageFilename,userId,date FROM fp_articles WHERE userId = ?")) {

            stmt.setInt(1, user_id);
            System.out.println(user_id);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    Article article = getArticleFromResultSet(rs);
                    articles.add(article);

                }

            }

        }
        return articles;
    }
    public static Article getArticleByTitle(String title, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT id, title, content, imageFilename,userId,date FROM fp_articles WHERE title = ?")) {

            stmt.setString(1, title);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    return getArticleFromResultSet(rs);

                } else {
                    return null;
                }

            }

        }

    }

    public static void updateArticle(Article article, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "update fp_articles set title = ?, content = ?, imageFilename = ?, date = ? where id = ?")){

            stmt.setString(1,article.getTitle());
            stmt.setString(2,article.getContent());
            stmt.setString(3,article.getImageFilename());
            stmt.setDate(4,article.getDate());
            stmt.setInt(5,article.getId());

        }

    }



    public static boolean insertArticle(Article article, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO fp_articles (title, content,imageFilename,userId,date) VALUES (?, ?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getImageFilename());
            stmt.setInt(4, article.getUserId());
            stmt.setDate(5,article.getDate());


            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                return false;
            }

            try (ResultSet keys = stmt.getGeneratedKeys()) {
                keys.next(); // Move to the fist row.
                int id = keys.getInt(1);
                article.setId(id);

                return true;
            }

        }

    }

    public static boolean insertImage(Article article, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "update fp_articles set  imageFilename = '?' where id = ?",
                Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, article.getImageFilename());
            stmt.setInt(2, article.getId());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                return false;
            }

            try (ResultSet keys = stmt.getGeneratedKeys()) {
                keys.next(); // Move to the fist row.
                int id = keys.getInt(1);
                article.setId(id);

                return true;
            }

        }

    }

    public static boolean deleteArticle(int id, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "DELETE FROM fp_articles WHERE id = ?")) {

            stmt.setInt(1, id);
            int rowsAffected = stmt.executeUpdate();
            return (rowsAffected == 1);

        }

    }
//    public static List<Article> getArticleByAnything(String anything, Connection conn) throws SQLException {
//        List<Article> articles = new ArrayList<>();
//        try (PreparedStatement stmt = conn.prepareStatement(
//                "SELECT a.id, title, content, imageFilename,userId,date FROM fp_articles a inner join fp_userLogin b on a.userId = b.id\n" +
//                        "WHERE userId like '%2%' or title like '%2%' or content like '%2%' or username like '%2%' or date like '%2%';")) {
//
//            stmt.setInt(1, Integer.parseInt(anything));
//
//            try (ResultSet rs = stmt.executeQuery()) {
//
//                while (rs.next()) {
//
//                    Article article = getArticleFromResultSet(rs);
//                    articles.add(article);
//
//                }
//
//            }
//
//        }
//        return articles;
//    }


}
