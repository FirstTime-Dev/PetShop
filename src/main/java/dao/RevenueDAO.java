package dao;

import database.DatabaseConnection;
import model.Revenue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RevenueDAO {
    public List<Revenue> getAllRevenues() {
        List<Revenue> list = new ArrayList<>();
        String sql = "SELECT id, date, amount FROM revenue ORDER BY id";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Revenue r = new Revenue();
                r.setId(rs.getInt("id"));
                r.setDate(rs.getDate("date"));
                r.setAmount(rs.getDouble("amount"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
