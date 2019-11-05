package ictgradschool.web.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    /*
    *children comment dao
    *
    *
    * */
    public static ChildrenComment getChildrenCommentById(int id, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM fp_childComment WHERE id = ?")) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    System.out.println("childrencomment dao ");
                    return new ChildrenComment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4),rs.getInt(5),rs.getDate(6), rs.getString(7));

                } else {
                    return null;
                }

            }

        }

    }
    public static List<ChildrenComment> getAllChildrenComment(Connection conn) throws SQLException {
        List<ChildrenComment> comments = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {
            try (ResultSet rs = stmt.executeQuery("SELECT * FROM fp_childComment")) {
                while (rs.next()) {
                    ChildrenComment comment = new ChildrenComment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4),rs.getInt(5),rs.getDate(6), rs.getString(7), rs.getString(8));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    public static List<ChildrenComment> getChildCommentByArticleId(int articleId, Connection conn) throws SQLException {
        try (PreparedStatement st = conn.prepareStatement("SELECT * FROM fp_childComment WHERE article_id = ?")) {
            List<ChildrenComment> comments = new ArrayList<>();
            st.setInt(1, articleId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    ChildrenComment comment = new ChildrenComment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getInt(5),rs.getDate(6), rs.getString(7), rs.getString(8));
                    comments.add(comment);
                }
            }
            return comments;

        }
    }

    public static void insertChildrenComment(ChildrenComment newComment, Connection conn) throws SQLException {

        try (PreparedStatement st = conn.prepareStatement("INSERT INTO fp_childComment " +
                        "(content, article_id, user_id,parent_id,date, username, avatarFilename) VALUES (?, ?, ?,?,?, ?, ?) ",
                Statement.RETURN_GENERATED_KEYS)) {
            st.setString(1, newComment.getContent());
            st.setInt(2, newComment.getArticleId());
            st.setInt(3, newComment.getUserId());
            st.setInt(4,newComment.getParentId());
            st.setDate(5, newComment.getDate());
            st.setString(6, newComment.getUsername());
            st.setString(7, newComment.getAvatarFilename());

            st.executeUpdate();

        }
    }

    public static void deleteChildrenComment(int id, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "DELETE FROM fp_childComment WHERE id = ?")) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        }

    }
    /*
     * parent comment dao
     *
     *
     * */
    public static ParentComment getParentCommentById(int id, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM fp_parentComment WHERE id = ?")) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    System.out.println("parentrencomment dao ");
                    return new ParentComment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getDate(5), rs.getString(6), rs.getString(7));

                } else {
                    return null;
                }

            }

        }

    }
    public static List<ParentComment> getAllParentComments(Connection conn) throws SQLException {
        List<ParentComment> comments = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {
            try (ResultSet rs = stmt.executeQuery("SELECT * FROM fp_parentComment")) {
                while (rs.next()) {
                    ParentComment comment = new ParentComment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getDate(5), rs.getString(6), rs.getString(7));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    public static List<ParentComment> getParentCommentByArticleId(int articleId, Connection conn) throws SQLException {
        try (PreparedStatement st = conn.prepareStatement("SELECT * FROM fp_parentComment WHERE article_id = ?")) {
            List<ParentComment> comments = new ArrayList<>();
            st.setInt(1, articleId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    ParentComment comment = new ParentComment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getDate(5), rs.getString(6), rs.getString(7));
                    comments.add(comment);
                }
            }
            System.out.println("getParentCommentByArticleId execute");
            return comments;

        }
    }

    public static void insertParentComment(ParentComment newComment, Connection conn) throws SQLException {

        try (PreparedStatement st = conn.prepareStatement("INSERT INTO fp_parentComment " +
                        "(content, article_id, user_id,date, username, avatarFilename) VALUES (?, ?, ?,?, ?) ",
                Statement.RETURN_GENERATED_KEYS)) {
            st.setString(1, newComment.getContent());
            st.setInt(2, newComment.getArticleId());
            st.setInt(3, newComment.getUserId());
            st.setDate(4, newComment.getDate());
            st.setString(5, newComment.getUsername());
            st.setString(6, newComment.getAvatarFilename());

            st.executeUpdate();

        }
    }

    public static void deleteParentrenComment(int id, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "DELETE FROM fp_parentComment WHERE id = ?")) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        }

    }

}

