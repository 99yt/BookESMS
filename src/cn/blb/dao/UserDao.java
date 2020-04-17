package cn.blb.dao;

import cn.blb.dao.bean.BlbUser;

import java.sql.SQLException;

public interface UserDao {
    public final String SQL_USERINFO_BYNAME = "SELECT * FROM BLB_USER WHERE login_name= ?";
    public final String SQL_INSERT_BLB_USER="insert into blb_user(user_id,login_name,password,email,recommender) values(null,?,?,?,?)";
    public final String SQL_QUERY_BLB_USER_BY_NAME_AND_PWD="select user_id from blb_user where login_name=? and password=?";
    public final String SQL_UPDATE_NICK_NAME="UPDATE BLB_USER SET nick_name = ? WHERE login_name = ?";
    public final String SQL_UPDATE_REAL_NAME = "UPDATE BLB_USER SET real_name = ? WHERE login_name = ?";
    public final String SQL_UPDATE_USERINFO = "UPDATE BLB_USER SET SEX = ?, BIRTH = ?, PROVINCE = ?, SCHOOL = ?, COMPANY = ?, CARD_NUMBER = ? WHERE login_name = ?";
    public final String SQL_UPDATE_CONNECTIONINFO="UPDATE BLB_USER SET EMAIL = ?, MOBILE = ?, PHONE = ?, MSN = ?, QQ = ?, WEBSITE = ?, SEND_ADDRESS = ?, ZIPCODE = ? WHERE login_name=?";
    public final String SQL_SELECT_PASSWORD = "SELECT * FROM BLB_USER WHERE login_name = ? AND PASSWORD = ?";
    public final String SQL_UPDATE_PASSWORD = "UPDATE BLB_USER SET PASSWORD = ? WHERE login_name = ?";
    public final  String SQL_GETONEINFO_BYID="SELECT * FROM BLB_USER WHERE ID= ?";

    /*
        *向blb_user用户表添加用户信息
        * 大于1 表示添加成功
        * */
     int insert(BlbUser regUser) throws SQLException;

    BlbUser queryLogin(String username, String password) throws SQLException;

    BlbUser getOneInfoByName(String userName) throws SQLException;

    Integer updateNickName(String username, String name, Integer num) throws SQLException;

    Integer updateUserInfo(BlbUser user)throws SQLException;

    Integer updateConnectionInfo(BlbUser user) throws SQLException;

    BlbUser selectPassword(String username, String password) throws SQLException;

    Integer updatePassword(String username, String newpassword)throws SQLException;

    BlbUser getOneInfoById(Integer id) throws SQLException;
}
