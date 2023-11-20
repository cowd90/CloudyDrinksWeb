package model;

import java.sql.Timestamp;

public class User {
    private String userId;
    private String username;
    private String password;
    private String email;
    private String verificationCode;
    private Timestamp authCodeValidTime;
    private boolean isVerified;
    public User() {
    }

    public User(String userId, String username, String password, String email) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public User(String userId, String username, String password, String email, String verificationCode, Timestamp authCodeValidTime, boolean isVerified) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.verificationCode = verificationCode;
        this.authCodeValidTime = authCodeValidTime;
        this.isVerified = isVerified;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Timestamp getAuthCodeValidTime() {
        return authCodeValidTime;
    }

    public void setAuthCodeValidTime(Timestamp authCodeValidTime) {
        this.authCodeValidTime = authCodeValidTime;
    }

    public boolean isVerified() {
        return isVerified;
    }

    public void setVerified(boolean verified) {
        isVerified = verified;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", verifiedCode='" + verificationCode + '\'' +
                ", authCodeValidTime=" + authCodeValidTime +
                ", isVerified=" + isVerified +
                '}';
    }
}
