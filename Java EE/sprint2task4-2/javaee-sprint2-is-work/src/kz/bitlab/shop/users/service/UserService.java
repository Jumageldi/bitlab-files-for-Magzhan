package kz.bitlab.shop.users.service;

import kz.bitlab.shop.DBManager;
import kz.bitlab.shop.users.entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserService extends DBManager {

    public static User login(String email, String password) {
        User user = null;
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM users WHERE email = ? AND password = ?"); // Replace with hashed password check
            statement.setString(1, email);
            statement.setString(2, password); // Hash the password before comparing
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setFullName(resultSet.getString("full_name"));
                // Don't set the password in the user object for security reasons
            }

            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

}
