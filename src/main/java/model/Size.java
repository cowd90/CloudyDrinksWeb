package model;

public class Size {
    private int sizeId;
    private String sizeName;
    private int upSizePrice;
    private int productId;
    public Size() {
    }

    public Size(int sizeId, String sizeName, int upSizePrice) {
        this.sizeId = sizeId;
        this.sizeName = sizeName;
        this.upSizePrice = upSizePrice;
    }

    public Size(int sizeId, String sizeName, int upSizePrice, int productId) {
        this.sizeId = sizeId;
        this.sizeName = sizeName;
        this.upSizePrice = upSizePrice;
        this.productId = productId;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public int getUpSizePrice() {
        return upSizePrice;
    }

    public void setUpSizePrice(int upSizePrice) {
        this.upSizePrice = upSizePrice;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Size{" +
                "sizeId=" + sizeId +
                ", sizeName='" + sizeName + '\'' +
                ", upSizePrice=" + upSizePrice +
                '}';
    }
}
