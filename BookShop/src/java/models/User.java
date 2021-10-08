package models;

public class User {

    private String userId;
    private Integer roleId;
    private String username;
    private String fullName;
    private String email;
    private String address;
    private String phone;
    private String avatar;
    private String password;

    public User() {
    }

    public User(String userId, Integer roleId, String username, String fullName, String email, String address, String phone, String avatar, String password) {
        this.userId = userId;
        this.roleId = roleId;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.avatar = avatar;
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", roleId=" + roleId + ", username=" + username + ", fullName=" + fullName + ", email=" + email + ", address=" + address + ", phone=" + phone + ", avatar=" + avatar + ", password=" + password + '}';
    }
}
