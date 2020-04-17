package cn.blb.dao.factory;

import cn.blb.dao.UserDao;
import cn.blb.dao.impl.UserDaoImpl;

public class UserDaoFactory {
    public static UserDao getInsert() {
        return new UserDaoImpl();
    }
}
