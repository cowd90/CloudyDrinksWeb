package model;

public class OrderStatus {
    private int orderStatusId;
    private String description;

    public OrderStatus() {
    }

    public OrderStatus(int orderStatusId, String description) {
        this.orderStatusId = orderStatusId;
        this.description = description;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
