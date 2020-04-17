package cn.blb.dao.bean;

import java.util.List;

public class Order {
    private Integer orderId;

    private String realName;

    private Double totalPrice;

    private String orderTime;

    private String status;

    private List<catProduct> products;

    public Order() {
    }

    public Order(Integer orderId, String realName, Double totalPrice, String orderTime, String status, List<catProduct> products) {
        this.orderId = orderId;
        this.realName = realName;
        this.totalPrice = totalPrice;
        this.orderTime = orderTime;
        this.status = status;
        this.products = products;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<catProduct> getProducts() {
        return products;
    }

    public void setProducts(List<catProduct> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", realName='" + realName + '\'' +
                ", totalPrice=" + totalPrice +
                ", orderTime='" + orderTime + '\'' +
                ", status='" + status + '\'' +
                ", products=" + products +
                '}';
    }
}
