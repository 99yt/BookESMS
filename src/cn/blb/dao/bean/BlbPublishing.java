package cn.blb.dao.bean;

public class BlbPublishing {
    int id;
    String name;

    public BlbPublishing() {
    }

    public BlbPublishing(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "BlbPublishing{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

