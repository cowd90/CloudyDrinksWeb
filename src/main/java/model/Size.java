package model;

public class Size {
    private int sizeId;
    private String sizeName;
    private int sizePrice;

    public Size() {
    }

    public Size(int sizeId, String sizeName, int sizePrice) {
        this.sizeId = sizeId;
        this.sizeName = sizeName;
        this.sizePrice = sizePrice;
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

    public int getSizePrice() {
        return sizePrice;
    }

    public void setSizePrice(int sizePrice) {
        this.sizePrice = sizePrice;
    }

    @Override
    public String toString() {
        return "Size{" +
                "sizeId=" + sizeId +
                ", sizeName='" + sizeName + '\'' +
                ", sizePrice=" + sizePrice +
                '}';
    }
}
