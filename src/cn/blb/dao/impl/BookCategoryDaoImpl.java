package cn.blb.dao.impl;

import cn.blb.dao.BookCategoryDao;
import cn.blb.dao.bean.BookCategory;
import cn.blb.util.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class BookCategoryDaoImpl implements BookCategoryDao {

    QueryRunner qr=new QueryRunner();
    @Override
    public List<BookCategory> queryCategories(int parent_id) throws SQLException {
        return qr.query(DBUtils.getConnection(),SQL_QUERY_BOOK_CATEGORY,
                new BeanListHandler<>(BookCategory.class),parent_id);
    }
}
