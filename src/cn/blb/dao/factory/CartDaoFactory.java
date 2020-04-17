package cn.blb.dao.factory;

import cn.blb.dao.CartDao;
import cn.blb.dao.impl.CartDaoImpl;

public class CartDaoFactory {
    public static CartDao getInstance() {
        return new CartDaoImpl();
    }
}
