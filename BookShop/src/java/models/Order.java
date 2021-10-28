package models;

import java.util.Date;

public class Order {

    private String orderId;
    private String userId;
    private Date createdDate;
    private Integer status;
    private String address;
    private String phoneNumber;
    private String consigneeName;

    public Order() {
    }

    public Order(String orderId, String userId, Date createdDate, Integer status, String address, String phoneNumber, String consigneeName) {
        this.orderId = orderId;
        this.userId = userId;
        this.createdDate = createdDate;
        this.status = status;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.consigneeName = consigneeName;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", createdDate=" + createdDate + ", status=" + status + ", address=" + address + ", phoneNumber=" + phoneNumber + ", consigneeName=" + consigneeName + '}';
    }
}
