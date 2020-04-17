package cn.blb.dao.bean;

public class BlbActive {
    private int id;
    private String src;
    private String activeName;
    private String price;
    private String vipPrice;

    public BlbActive() {
    }

    public BlbActive(int id, String src, String activeName, String price, String vipPrice) {
        this.id = id;
        this.src = src;
        this.activeName = activeName;
        this.price = price;
        this.vipPrice = vipPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getActiveName() {
        return activeName;
    }

    public void setActiveName(String activeName) {
        this.activeName = activeName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getVipPrice() {
        return vipPrice;
    }

    public void setVipPrice(String vipPrice) {
        this.vipPrice = vipPrice;
    }



    @Override
    public String toString() {
        return "BlbActive{" +
                "id=" + id +
                ", src='" + src + '\'' +
                ", activeName='" + activeName + '\'' +
                ", price='" + price + '\'' +
                ", vipPrice='" + vipPrice + '\'' +
                '}';
    }
}
