package com.hospital_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hospital_management.model.Notification;
import com.hospital_management.util.DBConnection;

public class NotificationDAO {

    // Add Notification
    public boolean addNotification(Notification notification) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO notifications (user_type, user_id, title, message) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, notification.getUserType());
            ps.setInt(2, notification.getUserId());
            ps.setString(3, notification.getTitle());
            ps.setString(4, notification.getMessage());

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                status = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get Notifications by User
    public List<Notification> getNotifications(String userType, int userId) {

        List<Notification> notificationList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM notifications WHERE user_type=? AND user_id=? ORDER BY notification_id DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userType);
            ps.setInt(2, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Notification notification = new Notification();

                notification.setNotificationId(rs.getInt("notification_id"));
                notification.setUserType(rs.getString("user_type"));
                notification.setUserId(rs.getInt("user_id"));
                notification.setTitle(rs.getString("title"));
                notification.setMessage(rs.getString("message"));
                notification.setRead(rs.getBoolean("is_read"));
                notification.setCreatedAt(rs.getString("created_at"));

                notificationList.add(notification);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return notificationList;
    }
}