package cn.blb.service;

import cn.blb.dao.BookNewsDao;
import cn.blb.dao.bean.BlbActive;
import cn.blb.dao.bean.BlbPublishing;
import cn.blb.dao.bean.BookNews;
import cn.blb.dao.factory.BookNewsDaoFactory;

import java.sql.SQLException;
import java.util.List;

public class BookNewsService {
    BookNewsDao dao;
    public BookNewsService() {
        this.dao= BookNewsDaoFactory.getInstance();
    }

    public List<BookNews> queryBookNews() throws SQLException {
        return dao.queryBookNews();
    }
    public List<BlbPublishing>  queryPublishing( ) throws SQLException {
        return dao.queryPublishing();
    }
    public List<BlbActive>  queryActive( ) throws SQLException {
        return dao.queryActive();
    }

}
