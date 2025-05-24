package dao;

import model.Account;
import database.DatabaseConnection;

import java.sql.*;

public class AccountDAO {
    private Connection connect;
    private PreparedStatement ps;
    private ResultSet rs;

    public synchronized Account authenticateUser(String username, String password) {
        try {
            connect = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM account WHERE username = ? AND password = ?";
            ps = connect.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password); // Không mã hóa mật khẩu
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getInt("role"),
                        rs.getString("phone"),
                        rs.getInt("status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnections();
        }
        return null;
    }

    private void closeConnections() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (connect != null) connect.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
