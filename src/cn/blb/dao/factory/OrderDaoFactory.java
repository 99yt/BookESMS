package cn.blb.dao.factory;

import cn.blb.dao.OrderDao;
import cn.blb.dao.impl.OrderDaoImpl;

public class OrderDaoFactory {
    public static OrderDao getInstance() {
       return new OrderDaoImpl();
    }
}
