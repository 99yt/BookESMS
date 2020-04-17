package cn.blb.service;

import cn.blb.dao.CartDao;
import cn.blb.dao.OrderDao;
import cn.blb.dao.bean.Order;
import cn.blb.dao.bean.catProduct;
import cn.blb.dao.factory.CartDaoFactory;
import cn.blb.dao.factory.OrderDaoFactory;

import java.util.List;

public class OrderService {

    private OrderDao orderDao;


    public OrderService() {
        super();
        this.orderDao = OrderDaoFactory.getInstance();
    }

    public Integer addOrder(Integer userId, String time, Double totalPrice, List<catProduct> list) {
    return orderDao.addOrder(userId,time,totalPrice,list);
    }

    public List<Order> queryOrder(Integer userId) {
        return orderDao.queryOrder(userId);
    }

    public Order getOneOrder(Integer orderId) {
        return orderDao.getOneOrder(orderId);
    }
}
