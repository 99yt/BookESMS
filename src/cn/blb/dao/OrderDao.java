package cn.blb.dao;

import cn.blb.dao.bean.Order;
import cn.blb.dao.bean.catProduct;

import java.util.List;

public interface OrderDao {
    Integer addOrder(Integer userId, String time, Double totalPrice, List<catProduct> list);

    List<Order> queryOrder(Integer userId);

    Order getOneOrder(Integer orderId);
}
