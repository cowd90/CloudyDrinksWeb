package model;

import java.sql.Timestamp;

public class Cart extends Product {
    private String cartId;
    private String userId;
    private int productId;
    private int sizeId;
    private int quantity;
    private String note;
    private Timestamp time;

    public Cart() {
    }

    public Cart(String cartId, String userId, int productId, int sizeId, int quantity, String note, Timestamp time) {
        this.cartId = cartId;
        this.userId = userId;
        this.productId = productId;
        this.sizeId = sizeId;
        this.quantity = quantity;
        this.note = note;
        this.time = time;
    }

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public int getProductId() {
        return productId;
    }

    @Override
    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId='" + cartId + '\'' +
                ", userId='" + userId + '\'' +
                ", productId=" + productId +
                ", sizeId=" + sizeId +
                ", quantity=" + quantity +
                ", note='" + note + '\'' +
                ", time=" + time +
                '}';
    }
}
