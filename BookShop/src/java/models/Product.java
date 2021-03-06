package models;

public class Product {

    private Integer productId;
    private Integer categoryId;
    private String name;
    private String imageUrl;
    private Integer quantity;
    private Float price;
    private String description;
    private String publishedDate;
    private String createdDate;

    public Product() {
    }

    public Product(Integer productId, Integer categoryId, String name, String imageUrl, Integer quantity, Float price, String description, String publishedDate, String createdDate) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.name = name;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.publishedDate = publishedDate;
        this.createdDate = createdDate;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(String publishedDate) {
        this.publishedDate = publishedDate;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", categoryId=" + categoryId + ", name=" + name + ", imageUrl=" + imageUrl + ", quantity=" + quantity + ", price=" + price + ", description=" + description + ", publishedDate=" + publishedDate + ", createdDate=" + createdDate + '}';
    }
}
