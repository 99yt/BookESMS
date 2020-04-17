package cn.blb.service;


import cn.blb.dao.UserDao;
import cn.blb.dao.bean.BlbUser;
import cn.blb.dao.factory.UserDaoFactory;

import java.sql.SQLException;

/*
* 处理用户相关的具体业务
* 登录
*
* 注册
*
*
* */
public class UserService {
    private UserDao dao;

    public UserService() {
        this.dao= UserDaoFactory.getInsert();
    }

    public int register(BlbUser regUser) throws SQLException {
        return dao.insert(regUser);
    }

    public BlbUser login(String username,String password) throws SQLException {
        return dao.queryLogin(username,password);
    }

    public BlbUser getOneInfoByName(String userName) throws SQLException {
        return dao.getOneInfoByName(userName);
    }

    public Integer updateNickName(String username,String name , Integer num) throws SQLException {
        return dao.updateNickName(username,name,num);
    }

    public Integer updateUserInfo(BlbUser user) throws SQLException {
        return dao.updateUserInfo(user);
    }

    public Integer updateConnectionInfo(BlbUser user) throws SQLException {
        return dao.updateConnectionInfo(user);
    }

    public BlbUser selectPassword(String username,  String password) throws SQLException {
        return dao.selectPassword(username,password);
    }
    public Integer updatePassword(String username,  String newpassword) throws SQLException {
        return dao.updatePassword(username,newpassword);
    }

    public BlbUser getOneInfoById(Integer id) throws SQLException {
        return dao.getOneInfoById(id);
    }
}
