package model;

import java.util.ArrayList;

public class Product {
    private int productId;
    private String productName;
    private String productImage;
    private ArrayList<Size> productSizes;
    private String productDesc;
    private int catId;

    public Product() {
    }

    public Product(int productId, String productName, String productImage, String productDesc, int catId) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.productDesc = productDesc;
        this.catId = catId;
    }

    public Product(int productId, String productName, String productImage, ArrayList<Size> productSizes, String productDesc) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.productSizes = productSizes;
        this.productDesc = productDesc;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public ArrayList<Size> getProductSizes() {
        return productSizes;
    }

    public void setProductSizes(ArrayList<Size> productSizes) {
        this.productSizes = productSizes;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productImage='" + productImage + '\'' +
                ", productSizes=" + productSizes +
                ", productDesc='" + productDesc + '\'' +
                '}';
    }
}
