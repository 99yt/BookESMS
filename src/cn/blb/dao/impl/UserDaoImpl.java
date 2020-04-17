package cn.blb.dao.impl;

import cn.blb.dao.UserDao;
import cn.blb.dao.bean.BlbUser;
import cn.blb.util.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
    QueryRunner qr=new QueryRunner();
    @Override
    public int insert(BlbUser regUser) throws SQLException {
        return qr.update(DBUtils.getConnection(),SQL_INSERT_BLB_USER,regUser.getLogin_name(),
                regUser.getPassword(),regUser.getEmail(),regUser.getRecommender());
    }

    @Override
    public BlbUser queryLogin(String username, String password) throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_QUERY_BLB_USER_BY_NAME_AND_PWD,new BeanHandler<>(BlbUser.class),username,password);
    }

    @Override
    public BlbUser getOneInfoByName(String userName) throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_USERINFO_BYNAME,new BeanHandler<>(BlbUser.class),userName);
    }

    @Override
    public Integer updateNickName(String username, String name, Integer num) throws SQLException {
        if (num==0) {
            return qr.update(DBUtils.getConnection(), SQL_UPDATE_NICK_NAME, name ,username);
        } else {
            return qr.update(DBUtils.getConnection(), SQL_UPDATE_REAL_NAME, name,username);

        }
    }

    @Override
    public Integer updateUserInfo(BlbUser user) throws SQLException {
        return qr.update(DBUtils.getConnection(),SQL_UPDATE_USERINFO,
                user.getSex(),user.getBirth(),user.getProvince(),user.getSchool(),
                user.getCompany(),user.getCard_number(),user.getLogin_name());
    }

    @Override
    public Integer updateConnectionInfo(BlbUser user) throws SQLException {
        return qr.update(DBUtils.getConnection(),SQL_UPDATE_CONNECTIONINFO,
                user.getEmail(),user.getMobile(),
                user.getPhone(),user.getMsn(),
                user.getQq(),user.getWebsite(),
                user.getSend_address(),user.getZipcode(),
                user.getLogin_name());
    }

    @Override
    public BlbUser selectPassword(String username, String password) throws SQLException {
       return qr.query(DBUtils.getConnection(), SQL_SELECT_PASSWORD, new BeanHandler<>(BlbUser.class), username, password);


    }

    @Override
    public Integer updatePassword(String username, String newpassword) throws SQLException {
        return qr.update(DBUtils.getConnection(),SQL_UPDATE_PASSWORD,newpassword,username);
    }

    @Override
    public BlbUser getOneInfoById(Integer id) throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_GETONEINFO_BYID,new BeanHandler<>(BlbUser.class),id);
    }


}
