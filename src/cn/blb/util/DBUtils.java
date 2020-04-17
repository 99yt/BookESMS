package cn.blb.util;

import java.sql.*;
import java.util.ResourceBundle;

public class DBUtils {
    private static final String URL ;
    private static final String USER ;
    private static final String PASSWORD ;
    private static final String DRIVER;


    //获取资源文件中的数据
    static{
        //获取资源
        ResourceBundle rb = ResourceBundle.getBundle("cn.blb.util.jdbc");//资源位置
        URL = rb.getString("mysql_URL");
        USER = rb.getString("mysql_USER");
        PASSWORD = rb.getString("mysql_PASSWORD");
        DRIVER = rb.getString("mysql_DRIVER");

        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }



    /**
     * get Connection Object
     *
     * @return
     * @throws SQLException
     */
    public static Connection getConnection()  {
        Connection connection = null;
        try {
           connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void closeRes(Connection conn, Statement stat, ResultSet rs) throws SQLException{
        if(rs!=null)rs.close();
        if(stat!=null)stat.close();
        if(conn!=null)conn.close();
    }
}
