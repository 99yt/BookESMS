package cn.blb.dao.bean;

public class catProduct {
    private Integer cartId;

    private Integer product_id;

    private double price;

    private Integer quantity;

    private String name;

    private String picture;

    public catProduct() {
    }

    public catProduct(Integer cartId, Integer product_id, double price, Integer quantity, String name, String picture) {
        this.cartId = cartId;
        this.product_id = product_id;
        this.price = price;
        this.quantity = quantity;
        this.name = name;
        this.picture = picture;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }



    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }


    @Override
    public String toString() {
        return "catProduct{" +
                "cartId=" + cartId +
                ", productId=" + product_id +
                ", price=" + price +
                ", quantity=" + quantity +
                ", name='" + name + '\'' +
                ", picture='" + picture + '\'' +
                '}';
    }
}
