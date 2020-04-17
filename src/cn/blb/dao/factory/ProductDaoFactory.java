package cn.blb.dao.factory;

import cn.blb.dao.ProductDao;
import cn.blb.dao.impl.ProductDaOImpl;

public class ProductDaoFactory {
    public static ProductDao getInstance() {
        return new ProductDaOImpl();
    }
}
