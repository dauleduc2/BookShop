package models;

public class Category {

    private Integer categoryId;
    private String name;
    private String createdDate;

    public Category() {
    }

    public Category(Integer categoryId, String name, String createdDate) {
        this.categoryId = categoryId;
        this.name = name;
        this.createdDate = createdDate;
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

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", name=" + name + '}';
    }
}
