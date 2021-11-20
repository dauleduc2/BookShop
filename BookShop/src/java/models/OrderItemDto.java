package models;

public class OrderItemDto {

    private Integer quantity;
    private Float price;
    private String name;
    private String imageUrl;

    public OrderItemDto() {
    }

    public OrderItemDto(Integer quantity, Float price, String name, String imageUrl) {
        this.quantity = quantity;
        this.price = price;
        this.name = name;
        this.imageUrl = imageUrl;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "OrderItemDto{" + "quantity=" + quantity + ", price=" + price + ", name=" + name + ", imageUrl=" + imageUrl + '}';
    }

}
