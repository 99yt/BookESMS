package cn.blb;

import java.util.ArrayList;
import java.util.List;

public class Test {
    private int id;
    private String name;
    private  String sex;

    public Test(int id, String name, String sex) {
        this.id = id;
        this.name = name;
        this.sex = sex;
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Test{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }

    public static void main(String[] args) {
        Test test=new Test(1,"张三", "男");
        Test test1=new Test(2,"王五", "6");
        Test test2=new Test(3,"张三", "男");
        List<Test> list=new ArrayList<>();
        list.add(test);
        list.add(test1);
        list.add(test2);
        System.out.println(list);
    }

}
