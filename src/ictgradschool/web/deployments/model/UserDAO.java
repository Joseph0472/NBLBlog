package ictgradschool.web.deployments.model;

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
        try (PreparedStatement stmt = conn.prepareStatement("select id from fp_userLogin where username = ?")){
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
            stmt.setString(5, user.getDob());
            stmt.setString(6, user.getCountry());
            stmt.setString(7, user.getDescription());
            stmt.setString(8, user.getAvatarFileName());
            stmt.setInt(9, user.getUserid());

            int success = stmt.executeUpdate();

            if (success == 0) {
                return false;
            }
//
//            try (ResultSet rs = stmt.getGeneratedKeys()) {
//                rs.next();
//                System.out.println(rs);
////                user.setUserid(rs.getInt(9));
//                stmt.setInt(9, user.getUserid());
//
                return true;
//            }
        }
    }
}
