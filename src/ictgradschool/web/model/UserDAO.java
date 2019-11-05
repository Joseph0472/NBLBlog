package ictgradschool.web.model;

import java.sql.*;

/**
 * This part is corresponding with the Authenticate part.
 *
 * **/
public class UserDAO {

    public static UserJavaBean getUserByUserName (String username, Connection conn) throws SQLException{
        try (PreparedStatement stmt = conn.prepareStatement("select * from fp_userLogin where username = ?")){
            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    return getUserFromResulrSet(rs);
                }else {
                    return null;
                }
            }
        }
    }

    public static int getUserIdByUserName(String username, Connection conn) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("select id from fp_userLogin where username LIKE ?")){
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    return getUserIdFromResulrSet(rs);
                }else {
                    return -1;
                }
            }

        }
    }

    public static String getUserFullNameByUserId(int userId, Connection conn) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("select fname, lname from fp_userInfo where userid = ?")){
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    return getUserFullNameFromResulrSet(rs);
                }else {
                    return null;
                }
            }

        }
    }

    private static String getUserFullNameFromResulrSet(ResultSet rs) throws SQLException{
        return rs.getString(1) + " " + rs.getString(2);
    }

    private static int getUserIdFromResulrSet(ResultSet rs) throws SQLException{
        return rs.getInt(1);
    }

    private static UserJavaBean getUserFromResulrSet(ResultSet rs) throws SQLException{
        return new UserJavaBean(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getString(5),
                rs.getInt(6)
        );
    }

    public static boolean addUser(UserJavaBean user, Connection conn) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO fp_userLogin (username, passHashBase64, saltBase64, numIterations) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassHashBase64());
            stmt.setString(3, user.getSaltBase64());
            stmt.setInt(4, user.getNumIterations());
            int success = stmt.executeUpdate();

            if (success == 0) {
                return false;
            }

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                rs.next();
                user.setId(rs.getInt(1));
                return true;
            }
        }
    }

    public static boolean addUserInfo(UserInfoJavaBean user, Connection conn) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO fp_userInfo (fname, lname, emailAddress, phoneNum, dob, country, description, avatarFilename, userid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            stmt.setString(1, user.getFname());
            stmt.setString(2, user.getLname());
            stmt.setString(3, user.getEmailAddress());
            stmt.setString(4, user.getPhoneNum());
            stmt.setDate(5, user.getDob());
            stmt.setString(6, user.getCountry());
            stmt.setString(7, user.getDescription());
            stmt.setString(8, user.getAvatarFileName());
            stmt.setInt(9, user.getUserid());

            int success = stmt.executeUpdate();

            if (success == 0) {
                return false;
            }

            return true;

        }
    }

    // add new methods by SHI
    public static String getUsernameById(Integer id, Connection conn) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("select * from fp_userLogin where id = ?")){
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    return getUsernameFromResultSet(rs);
                }else {
                    return null;
                }
            }
        }
    }

    private static String getUsernameFromResultSet(ResultSet rs) throws SQLException {
        return rs.getString("username");
    }

    public static UserInfoJavaBean getUserInfoById (int userid, Connection conn) {
        try (PreparedStatement stmt = conn.prepareStatement("select * from fp_userInfo where userid = ?")){

            stmt.setInt(1, userid);
            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    return getUserInfoByIdFromResulrSet(rs);
                }else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static UserInfoJavaBean getUserInfoByIdFromResulrSet(ResultSet rs) throws SQLException {
        return new UserInfoJavaBean(
                rs.getString(1),
                rs.getString(2),
                rs.getString(3),
                rs.getString(4),
                rs.getDate(5),
                rs.getString(6),
                rs.getString(7),
                rs.getString(8),
                rs.getInt(9)
        );
    }
    public static boolean updateUserAvatarById(int userId, String avatarFileName, Connection conn) {
        try (PreparedStatement stmt = conn.prepareStatement("update fp_userInfo set avatarFilename = ? where userid = ?")) {
            stmt.setString(1, avatarFileName);
            stmt.setInt(2, userId);

            int success = stmt.executeUpdate();

            if (success == 0) {
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public static int getUserIdInUserInfo(UserInfoJavaBean user, Connection conn) {
        try (PreparedStatement stmt = conn.prepareStatement("select userid from fp_userInfo where userid = ?")){
            stmt.setInt(1, user.getUserid());
            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    return getUserIdInUserInfoResultSet(rs);
                }else {
                    return -1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    private static int getUserIdInUserInfoResultSet(ResultSet rs) throws SQLException {
        return rs.getInt(1);
    }

    public static void deleteFormerUserInfo(int userid, Connection conn) {
        try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM fp_userInfo WHERE userid = ?")){
            stmt.setInt(1, userid);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
  add on NOV 04 for user avatar by SHI
   */
    public static String getUserAvatarById(Integer id, Connection conn) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement("select * from fp_userInfo where userid = ?")){
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()){
                if (rs.next()) {
                    System.out.println("have we got rs? "+ rs);
                    return getUserAvatarFromResultSet(rs);
                }else {
                    return null;
                }
            }
        }
    }

    private static String getUserAvatarFromResultSet(ResultSet rs) throws SQLException {
        return rs.getString("avatarFilename");
    }
}
