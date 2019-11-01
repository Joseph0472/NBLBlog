package ictgradschool.web.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    public static List<Comment> getAllComments(Connection conn) throws SQLException {
        List<Comment> comments = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {
            try (ResultSet rs = stmt.executeQuery("SELECT * FROM final01_comment")) {
                while (rs.next()) {
                    Comment comment = new Comment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    public static List<Comment> getCommentByArticleId(int articleId, Connection conn) throws SQLException {
        try (PreparedStatement st = conn.prepareStatement("SELECT * FROM final01_comment WHERE article_id = ?")) {
            List<Comment> comments = new ArrayList<>();
            st.setInt(1, articleId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
                    comments.add(comment);
                }
            }
            return comments;

        }
    }

    public static boolean insertComment(Comment newComment, Connection conn) throws SQLException {

        try (PreparedStatement st = conn.prepareStatement("INSERT INTO final01_comment " +
                "(content, article_id, user_id, parent_id) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            st.setString(1, newComment.getContent());
            st.setInt(2, newComment.getArticleId());
            st.setInt(3, newComment.getUserId());
            st.setInt(4, newComment.getParentId());

            int success = st.executeUpdate();

            if (success == 0) {
                return false;
            }

            try (ResultSet rs = st.getGeneratedKeys()) {
                rs.next();
                newComment.setId(rs.getInt(1));
                return true;
            }
        }
    }

    public static List<Comment> getNestedComment (int commentId, Connection conn) throws SQLException {
        try (PreparedStatement st = conn.prepareStatement("SELECT * FROM final01_comment WHERE parent_id = ?")) {
            List<Comment> nestedComments = new ArrayList<>();
            st.setInt(1, commentId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
                    nestedComments.add(comment);
                }
            }
            return nestedComments;
        }
    }

    public static Comment getCommentByCommentId (int commentId, Connection conn) throws SQLException {
        try (PreparedStatement st = conn.prepareStatement("SELECT * FROM final01_comment WHERE comment_id = ?")) {

            st.setInt(1, commentId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Comment comment = new Comment(rs.getInt(1), rs.getString(2),
                            rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
                    return comment;
                } else {
                    return null;
                }
            }
        }
    }

    public static Comment updateNestedCommentNumber(int commentId, Connection conn) throws SQLException {

        try (PreparedStatement stmt = conn.prepareStatement(
                "update final01_comment set child_number = ? where comment_id = ?")){
            stmt.setInt(1, CommentDAO.getCommentByCommentId(commentId, conn).getChildNumber() + 1);
            stmt.setInt(2, commentId);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {
                    return getCommentFromResultSet(rs);
                } else {
                    return null;
                }

            }

        }

    }

    private static Comment getCommentFromResultSet(ResultSet rs) throws SQLException {
        return new Comment(rs.getInt(1), rs.getString(2),
                rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
    }
}
