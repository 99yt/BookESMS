package cn.blb.dao.template;

import cn.blb.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCTemplate {
    private Connection conn = DBUtils.getConnection();
     PreparedStatement pst=null;

    public int update(String sql, Object... args) {
        try {
            pst = conn.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                pst.setObject(i + 1, args[i]);
            }
            return pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public Object query(String sql, ResultSetHandler rsh, Object... args) {
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                pst.setObject(i + 1, args[i]);
            }
            ResultSet rs = pst.executeQuery();
            return rsh.doHandler(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

