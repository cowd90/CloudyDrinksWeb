package model;

import java.sql.Timestamp;

public class Order extends Cart {
    private String orderId;
    private String receiverName;
    private String phoneNumber;
    private String address;
    private int orderStatusId;

    public Order() {
    }

    public Order(String userId, int productId, int sizeId, int quantity, int totalPrice, String note, Timestamp time, String orderId, String receiverName, String phoneNumber, String address, int orderStatusId) {
        super(userId, productId, sizeId, quantity, totalPrice, note, time);
        this.orderId = orderId;
        this.receiverName = receiverName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.orderStatusId = orderStatusId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", receiverName='" + receiverName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", orderStatusId=" + orderStatusId +
                '}';
    }
}
