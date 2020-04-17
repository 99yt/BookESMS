package cn.blb.dao;

import cn.blb.dao.bean.BlbActive;
import cn.blb.dao.bean.BlbPublishing;
import cn.blb.dao.bean.BookNews;

import java.sql.SQLException;
import java.util.List;

public interface BookNewsDao {
    public static final String SQL_QUERY_BOOK_NEWS = "select * from blb_news order by sticky desc limit 10";
    public static final String SQL_QUERY_BOOK_PUBLISHING = "select name from blb_publishing ";
    public static final String SQL_QUERY_BOOK_ACTIVE = "select * from Blb_Active ";

    List<BookNews> queryBookNews() throws SQLException;

    List<BlbPublishing>  queryPublishing( ) throws SQLException;

    List<BlbActive> queryActive()throws SQLException;
}
