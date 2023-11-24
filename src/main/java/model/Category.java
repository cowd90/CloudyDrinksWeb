package model;

public class Category {
    private int catId;
    private String catName;

    public Category() {
    }

    public Category(int catId, String catName) {
        this.catId = catId;
        this.catName = catName;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    @Override
    public String toString() {
        return "Category{" +
                "catId=" + catId +
                ", catName=" + catName +
                '}';
    }
}
