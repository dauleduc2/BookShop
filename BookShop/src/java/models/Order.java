package models;

import java.util.Date;

public class Order {

    private String orderId;
    private String userId;
    private Date createdDate;
    private Integer status;

    public Order() {
    }

    public Order(String orderId, String userId, Date createdDate, Integer status) {
        this.orderId = orderId;
        this.userId = userId;
        this.createdDate = createdDate;
        this.status = status;
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

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", createdDate=" + createdDate + ", status=" + status + '}';
    }
}
