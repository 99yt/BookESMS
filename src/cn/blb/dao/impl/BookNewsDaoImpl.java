package cn.blb.dao.impl;

import cn.blb.dao.BookNewsDao;
import cn.blb.dao.bean.BlbActive;
import cn.blb.dao.bean.BlbPublishing;
import cn.blb.dao.bean.BookNews;
import cn.blb.util.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class BookNewsDaoImpl implements BookNewsDao {
    QueryRunner qr=new QueryRunner();
    @Override
    public List<BookNews> queryBookNews() throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_QUERY_BOOK_NEWS,new BeanListHandler<>(BookNews.class));
    }

    @Override
    public  List<BlbPublishing>  queryPublishing() throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_QUERY_BOOK_PUBLISHING,new BeanListHandler<>(BlbPublishing.class));
    }

    @Override
    public List<BlbActive> queryActive() throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_QUERY_BOOK_ACTIVE,new BeanListHandler<>(BlbActive.class));
    }
}
