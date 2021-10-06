package models;

public class OrderItem {

    private Integer productId;
    private String orderId;
    private Integer quantity;
    private Double price;

    public OrderItem() {
    }

    public OrderItem(Integer productId, String orderId, Integer quantity, Double price) {
        this.productId = productId;
        this.orderId = orderId;
        this.quantity = quantity;
        this.price = price;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "productId=" + productId + ", orderId=" + orderId + ", quantity=" + quantity + ", price=" + price + '}';
    }
}
