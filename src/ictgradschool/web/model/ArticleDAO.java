package ictgradschool.web.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ArticleDAO {
    private static Article getArticleFromResultSet(ResultSet rs) throws SQLException {
        return new Article(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getInt(5),
                rs.getDate(6),
                rs.getString(7)
        );
    }

    public static List<Article> getAllArticles(Connection conn) throws SQLException {

        List<Article> articles = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {

            try (ResultSet rs =
                         stmt.executeQuery("SELECT id, title, content, imageFilename,userId,date,username FROM fp_articles")) {

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
                "SELECT id, title, content, imageFilename,userId,date,username FROM fp_articles WHERE id = ?")) {

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
                "SELECT id, title, content, imageFilename,userId,date,username FROM fp_articles WHERE userId = ?")) {

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

    public static List<Article> getArticleByTitle(String title, Connection conn) throws SQLException {

        List<Article> articles = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT id, title, content, imageFilename,userId,date,username FROM fp_articles WHERE title LIKE ?")) {

            stmt.setString(1, title);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    Article article = getArticleFromResultSet(rs);
                    articles.add(article);

                    System.out.println(articles);
                }

            }

        }

        return articles;
    }


    public static void updateArticle(Article article, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "update fp_articles set title = ?, content = ?, imageFilename = ?, date = ?, username = ? where id = ?")){

            stmt.setString(1,article.getTitle());
            stmt.setString(2,article.getContent());
            stmt.setString(3,article.getImageFilename());
            stmt.setDate(4,article.getDate());
            stmt.setString(5, article.getUsername());
            stmt.setInt(6,article.getId());
            stmt.executeUpdate();
        }

    }



    public static boolean insertArticle(Article article, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO fp_articles (title, content,imageFilename,userId,date, username) VALUES (?, ?,?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, article.getTitle());
            stmt.setString(2, article.getContent());
            stmt.setString(3, article.getImageFilename());
            stmt.setInt(4, article.getUserId());
            stmt.setDate(5,article.getDate());
            stmt.setString(6, article.getUsername());


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


    // add new method here by SHI

    public static List<Article> sortArticleByUsername (List<Article> articleList, Connection conn) throws SQLException{
        Comparator<Article> articleComparator = new Comparator<Article>() {
            @Override
            public int compare(Article o1, Article o2) {
                System.out.println("have we got to compare by username : " + o1.getTitle() + o2.getUsername());

                return o1.getUsername().toLowerCase().compareTo(o2.getUsername().toLowerCase());
            }
        };
        Collections.sort(articleList, articleComparator);
        return articleList;
    }

    public static List<Article> sortArticleByTitle (List<Article> articleList, Connection conn) throws SQLException{
        Comparator<Article> articleComparator = new Comparator<Article>() {
            @Override
            public int compare(Article o1, Article o2) {
                System.out.println("have we got to compare by title : " + o1.getTitle() + o2.getTitle());

                return o1.getTitle().toLowerCase().compareTo(o2.getTitle().toLowerCase());
            }
        };
        Collections.sort(articleList, articleComparator);
        return articleList;
    }

    public static List<Article> sortArticleByTime(List<Article> articleList, Connection conn) throws SQLException{
        Comparator<Article> articleComparator = new Comparator<Article>() {
            @Override
            public int compare(Article o1, Article o2) {
                return o1.getDate().compareTo(o2.getDate());
            }
        };
        Collections.sort(articleList, articleComparator);
        return articleList;
    }

    public static List<Article> getArticleByTime(String keyword, Connection conn) throws SQLException {
        List<Article> articles = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM fp_articles WHERE date = ?")) {

            stmt.setString(1, keyword);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    Article article = getArticleFromResultSet(rs);
                    articles.add(article);

                    System.out.println(articles);
                }

            }
            return articles;
        }
    }

    public static List<Article> getArticleByUsername(String keyword, Connection conn) throws SQLException{
        List<Article> articles = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM fp_articles WHERE username LIKE ?")) {

            stmt.setString(1, keyword);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    Article article = getArticleFromResultSet(rs);
                    articles.add(article);

                    System.out.println(articles);
                }

            }
            return articles;
        }
    }


    public static List<Article> getArticlesByUsernameOrTitle(String keyword, Connection conn) throws SQLException {
        List<Article> articles = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM fp_articles WHERE username LIKE ? OR title LIKE ?")) {

            stmt.setString(1, keyword);
            stmt.setString(2, keyword);

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {

                    Article article = getArticleFromResultSet(rs);
                    articles.add(article);

                    System.out.println(articles);
                }

            }
            return articles;

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
